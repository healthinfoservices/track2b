# Architecture - HL7 v2 SIU to FHIR Appointment - AU Core (Proof of Concept) v0.1.0

* [**Table of Contents**](toc.md)
* **Architecture**

## Architecture

### Components

```
  PAS / scheduling system
  or interface engine
          │  HL7 v2 SIU over MLLP (TCP 2575)
          ▼
  ┌───────────────────────┐   ACK / NAK back to sender
  │  siu2fhir_au (Python) │ ◄── HTTP POST /hl7 (8090) for testing
  │  parse → map → upsert │
  └──────────┬────────────┘
             │  FHIR R4 REST (search, conditional update)
             ▼
  ┌───────────────────────┐
  │  HAPI FHIR server     │  base: http://<host>:8080/fhir
  └──────────┬────────────┘
             │  FHIR R4 REST (read / search)
             ▼
  Vue / Vuetify front end (planned)

```

| | |
| :--- | :--- |
| Sending system | Sends SIU S12–S15 messages; acts on the returned ACK |
| siu2fhir_au | Parses HL7 v2, maps it to FHIR, writes to HAPI, returns ACK/NAK |
| HAPI FHIR | Stores the resources and serves the FHIR REST API |
| Front end | Reads (and later may edit) appointments directly from HAPI |

### Processing steps for one message

1. Parse the message and check that it is SIU with an S12, S13, S14 or S15 trigger. Otherwise reply`AR`.
1. Map the message to resources. If required data is missing, reply`AE`.
1. Search HAPI for an existing Appointment by its filler (SCH-2) or placer (SCH-1) identifier.
1. If that Appointment has a later[source message date/time](StructureDefinition-source-message-datetime.md)than this message's MSH-7, reply`AA`and change nothing.
1. Look up each facility's Organization on the server (creating a tagged placeholder only if it's missing), then create or update the Patient, Practitioner and Location resources with conditional updates. Each Location references its facility's Organization and takes its address.
1. Build the Appointment, referencing the server ids from step 5, and write it.
1. Reply`AA`.

Facility details (name, address, HPI-O) come from Organizations held on the FHIR server. MRN identifier systems are built by a fixed rule from PID-3.4. Location type translations come from the [local registry](registry.md).

Messages are processed one at a time, so MLLP and HTTP input can't race on the same appointment.

### Security

None. The proof of concept has no authentication on the ingestion endpoints or on HAPI, and no TLS. The planned front end is to use a dummy login only.

