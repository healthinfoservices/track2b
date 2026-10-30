# Appointment Identifier Type - HL7 v2 SIU to FHIR Appointment - AU Core (Proof of Concept) v0.1.0

* [**Table of Contents**](toc.md)
* [**Artifacts Summary**](artifacts.md)
* **Appointment Identifier Type**

## ValueSet: Appointment Identifier Type (Experimental) 

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/siu2fhir-au/ValueSet/appointment-identifier-type | *Version*:0.1.0 |
| Draft as of 2026-10-30 | *Computable Name*:AppointmentIdentifierType |

 
Identifier types used on SIU Appointments: filler (SCH-2) and placer (SCH-1) appointment IDs. 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

 

### Expansion

-------

 Explanation of the columns that may appear on this page: 

| | |
| :--- | :--- |
| Level | A few code lists that FHIR defines are hierarchical - each code is assigned a level. In this scheme, some codes are under other codes, and imply that the code they are under also applies |
| System | The source of the definition of the code (when the value set draws in codes defined elsewhere) |
| Code | The code (used as the code in the resource instance) |
| Display | The display (used in the*display*element of a[Coding](http://hl7.org/fhir/R4/datatypes.html#Coding)). If there is no display, implementers should not simply display the code, but map the concept into their application |
| Definition | An explanation of the meaning of the concept |
| Comments | Additional notes about how to use the code |



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "appointment-identifier-type",
  "url" : "http://example.org/fhir/siu2fhir-au/ValueSet/appointment-identifier-type",
  "version" : "0.1.0",
  "name" : "AppointmentIdentifierType",
  "title" : "Appointment Identifier Type",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-10-30T02:04:31+00:00",
  "publisher" : "SIU2FHIR PoC",
  "description" : "Identifier types used on SIU Appointments: filler (SCH-2) and placer (SCH-1) appointment IDs.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "AU",
      "display" : "Australia"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/v2-0203",
      "version" : "5.0.0",
      "concept" : [{
        "code" : "FILL"
      },
      {
        "code" : "PLAC"
      }]
    }]
  }
}

```
