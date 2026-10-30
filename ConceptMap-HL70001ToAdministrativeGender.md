# HL7 v2 Administrative Sex (0001) to FHIR AdministrativeGender - HL7 v2 SIU to FHIR Appointment - AU Core (Proof of Concept) v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **HL7 v2 Administrative Sex (0001) to FHIR AdministrativeGender**

## ConceptMap: HL7 v2 Administrative Sex (0001) to FHIR AdministrativeGender (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/siu2fhir-au/ConceptMap/HL70001ToAdministrativeGender | *Version*:0.1.0 |
| Draft as of 2026-10-30 | *Computable Name*:HL70001ToAdministrativeGender |

 
The mapping the ingestion service applies to PID-8. The A and N mappings are judgement calls. 



## Resource Content

```json
{
  "resourceType" : "ConceptMap",
  "id" : "HL70001ToAdministrativeGender",
  "url" : "http://example.org/fhir/siu2fhir-au/ConceptMap/HL70001ToAdministrativeGender",
  "version" : "0.1.0",
  "name" : "HL70001ToAdministrativeGender",
  "title" : "HL7 v2 Administrative Sex (0001) to FHIR AdministrativeGender",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-10-30T02:04:31+00:00",
  "publisher" : "SIU2FHIR PoC",
  "description" : "The mapping the ingestion service applies to PID-8. The A and N mappings are judgement calls.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "AU",
      "display" : "Australia"
    }]
  }],
  "group" : [{
    "source" : "http://terminology.hl7.org/CodeSystem/v2-0001",
    "target" : "http://hl7.org/fhir/administrative-gender",
    "element" : [{
      "code" : "M",
      "target" : [{
        "code" : "male",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "F",
      "target" : [{
        "code" : "female",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "O",
      "target" : [{
        "code" : "other",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "U",
      "target" : [{
        "code" : "unknown",
        "equivalence" : "equivalent"
      }]
    },
    {
      "code" : "A",
      "target" : [{
        "code" : "other",
        "equivalence" : "inexact",
        "comment" : "Ambiguous mapped to other."
      }]
    },
    {
      "code" : "N",
      "target" : [{
        "code" : "unknown",
        "equivalence" : "inexact",
        "comment" : "Not applicable mapped to unknown."
      }]
    }]
  }]
}

```
