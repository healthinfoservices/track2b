# Source Message Date/Time - HL7 v2 SIU to FHIR Appointment - AU Core (Proof of Concept) v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Source Message Date/Time**

## Extension: Source Message Date/Time 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/siu2fhir-au/StructureDefinition/source-message-datetime | *Version*:0.1.0 |
| Draft as of 2026-10-30 | *Computable Name*:SourceMessageDateTime |

The MSH-7 (date/time of message) of the most recent HL7 v2 SIU message applied to this Appointment. The ingestion service compares an incoming message's MSH-7 with this value and ignores messages that are older, so a delayed message cannot undo a later change.

**Context of Use**

**Usage info**

**Usages:**

* Use this Extension: [SIU AU Appointment](StructureDefinition-siu-au-appointment.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/example.fhir.siu2fhir.au|current/StructureDefinition/StructureDefinition-source-message-datetime.json)

### Formal Views of Extension Content

 [Description of Profiles, Differentials, Snapshots, and how the XML and JSON presentations work](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](StructureDefinition-source-message-datetime.csv), [Excel](StructureDefinition-source-message-datetime.xlsx), [Schematron](StructureDefinition-source-message-datetime.sch) 

#### Constraints



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "source-message-datetime",
  "url" : "http://example.org/fhir/siu2fhir-au/StructureDefinition/source-message-datetime",
  "version" : "0.1.0",
  "name" : "SourceMessageDateTime",
  "title" : "Source Message Date/Time",
  "status" : "draft",
  "date" : "2026-10-30T02:04:31+00:00",
  "publisher" : "SIU2FHIR PoC",
  "description" : "The MSH-7 (date/time of message) of the most recent HL7 v2 SIU message applied to this\nAppointment. The ingestion service compares an incoming message's MSH-7 with this value\nand ignores messages that are older, so a delayed message cannot undo a later change.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "AU",
      "display" : "Australia"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  }],
  "kind" : "complex-type",
  "abstract" : false,
  "context" : [{
    "type" : "element",
    "expression" : "Appointment"
  }],
  "type" : "Extension",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Extension",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Extension",
      "path" : "Extension",
      "short" : "Source Message Date/Time",
      "definition" : "The MSH-7 (date/time of message) of the most recent HL7 v2 SIU message applied to this\nAppointment. The ingestion service compares an incoming message's MSH-7 with this value\nand ignores messages that are older, so a delayed message cannot undo a later change."
    },
    {
      "id" : "Extension.extension",
      "path" : "Extension.extension",
      "max" : "0"
    },
    {
      "id" : "Extension.url",
      "path" : "Extension.url",
      "fixedUri" : "http://example.org/fhir/siu2fhir-au/StructureDefinition/source-message-datetime"
    },
    {
      "id" : "Extension.value[x]",
      "path" : "Extension.value[x]",
      "min" : 1,
      "type" : [{
        "code" : "dateTime"
      }]
    }]
  }
}

```
