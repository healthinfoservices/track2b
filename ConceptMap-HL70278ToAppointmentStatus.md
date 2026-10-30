# HL7 v2 Filler Status (0278) to FHIR AppointmentStatus - HL7 v2 SIU to FHIR Appointment - AU Core (Proof of Concept) v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **HL7 v2 Filler Status (0278) to FHIR AppointmentStatus**

## ConceptMap: HL7 v2 Filler Status (0278) to FHIR AppointmentStatus (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/siu2fhir-au/ConceptMap/HL70278ToAppointmentStatus | *Version*:0.1.0 |
| Draft as of 2026-10-30 | *Computable Name*:HL70278ToAppointmentStatus |

 
The mapping the ingestion service applies to SCH-25. Blocked, Overbook and Started have no exact FHIR equivalent. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "HL70278ToAppointmentStatus",
  "url" : "http://example.org/fhir/siu2fhir-au/ConceptMap/HL70278ToAppointmentStatus",
  "version" : "0.1.0",
  "name" : "HL70278ToAppointmentStatus",
  "title" : "HL7 v2 Filler Status (0278) to FHIR AppointmentStatus",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-10-30T02:04:31+00:00",
  "publisher" : "SIU2FHIR PoC",
  "description" : "The mapping the ingestion service applies to SCH-25. Blocked, Overbook and Started have no exact FHIR equivalent.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "AU",
      "display" : "Australia"
    }]
  }],
  "group" : [{
    "source" : "http://terminology.hl7.org/CodeSystem/v2-0278",
    "target" : "http://hl7.org/fhir/appointmentstatus",
    "element" : [{
      "code" : "Pending",
      "target" : [{
        "code" : "pending",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "Waitlist",
      "target" : [{
        "code" : "waitlist",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "Booked",
      "target" : [{
        "code" : "booked",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "Started",
      "target" : [{
        "code" : "arrived",
        "equivalence" : "inexact",
        "comment" : "Judgement call: the patient has arrived and the appointment has started."
      }]
    },
    {
      "code" : "Complete",
      "target" : [{
        "code" : "fulfilled",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "Cancelled",
      "target" : [{
        "code" : "cancelled",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "Discontinued",
      "target" : [{
        "code" : "cancelled",
        "equivalence" : "wider",
        "comment" : "v2.3+ code. Discontinued is treated as cancelled; the HL7 v2-to-FHIR IG leaves it unmapped."
      }]
    },
    {
      "code" : "DC",
      "target" : [{
        "code" : "cancelled",
        "equivalence" : "wider",
        "comment" : "v2.9+ code for Discontinued; treated as cancelled."
      }]
    },
    {
      "code" : "Deleted",
      "target" : [{
        "code" : "entered-in-error",
        "equivalence" : "inexact"
      }]
    },
    {
      "code" : "Blocked",
      "target" : [{
        "code" : "booked",
        "equivalence" : "inexact",
        "comment" : "No FHIR equivalent; the time is held so it is treated as booked."
      }]
    },
    {
      "code" : "Overbook",
      "target" : [{
        "code" : "booked",
        "equivalence" : "wider"
      }]
    },
    {
      "code" : "Noshow",
      "target" : [{
        "code" : "noshow",
        "equivalence" : "equivalent"
      }]
    }]
  }]
}

```
