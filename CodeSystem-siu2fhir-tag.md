# SIU2FHIR Resource Tags - HL7 v2 SIU to FHIR Appointment - AU Core (Proof of Concept) v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **SIU2FHIR Resource Tags**

## CodeSystem: SIU2FHIR Resource Tags (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/siu2fhir-au/CodeSystem/siu2fhir-tag | *Version*:0.1.0 |
| Draft as of 2026-10-30 | *Computable Name*:SIU2FHIRTag |

 
Tags (meta.tag) the ingestion service puts on resources it creates. 

 This Code system is referenced in the content logical definition of the following value sets: 

* This CodeSystem is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)



## Resource Content

```json
{
  "resourceType" : "CodeSystem",
  "id" : "siu2fhir-tag",
  "url" : "http://example.org/fhir/siu2fhir-au/CodeSystem/siu2fhir-tag",
  "version" : "0.1.0",
  "name" : "SIU2FHIRTag",
  "title" : "SIU2FHIR Resource Tags",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-10-30T02:04:31+00:00",
  "publisher" : "SIU2FHIR PoC",
  "description" : "Tags (meta.tag) the ingestion service puts on resources it creates.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "AU",
      "display" : "Australia"
    }]
  }],
  "caseSensitive" : true,
  "content" : "complete",
  "count" : 1,
  "concept" : [{
    "code" : "placeholder",
    "display" : "Placeholder",
    "definition" : "Created from an SIU message because no matching resource existed on the FHIR server. Expected to be curated (name, address, identifiers) by an administrator; the service never overwrites it."
  }]
}

```
