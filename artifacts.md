# Artifacts Summary - HL7 v2 SIU to FHIR Appointment - AU Core (Proof of Concept) v0.1.0

* [**Table of Contents**](toc.md)
* **Artifacts Summary**

## Artifacts Summary

This page provides a list of the FHIR artifacts defined as part of this implementation guide.

### Structures: Resource Profiles 

These define constraints on FHIR resources for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [SIU AU Appointment](StructureDefinition-siu-au-appointment.md) | An Appointment created and maintained from HL7 v2 SIU S12, S13, S14 and S15 messages, whose participants are AU Core resources. The ingestion service rebuilds the whole resource from each message it applies. |

### Structures: Extension Definitions 

These define constraints on FHIR data types for systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Source Message Control ID](StructureDefinition-source-message-control-id.md) | The MSH-10 (message control ID) of the most recent HL7 v2 SIU message applied to this Appointment. Provides traceability back to the interface engine's message log. |
| [Source Message Date/Time](StructureDefinition-source-message-datetime.md) | The MSH-7 (date/time of message) of the most recent HL7 v2 SIU message applied to this Appointment. The ingestion service compares an incoming message's MSH-7 with this value and ignores messages that are older, so a delayed message cannot undo a later change. |

### Terminology: Value Sets 

These define sets of codes used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [Appointment Identifier Type](ValueSet-appointment-identifier-type.md) | Identifier types used on SIU Appointments: filler (SCH-2) and placer (SCH-1) appointment IDs. |

### Terminology: Code Systems 

These define new code systems used by systems conforming to this implementation guide.

| | |
| :--- | :--- |
| [SIU2FHIR Resource Tags](CodeSystem-siu2fhir-tag.md) | Tags (meta.tag) the ingestion service puts on resources it creates. |

### Terminology: Concept Maps 

These define transformations to convert between codes by systems conforming with this implementation guide.

| | |
| :--- | :--- |
| [HL7 v2 Administrative Sex (0001) to FHIR AdministrativeGender](ConceptMap-HL70001ToAdministrativeGender.md) | The mapping the ingestion service applies to PID-8. The A and N mappings are judgement calls. |
| [HL7 v2 Filler Status (0278) to FHIR AppointmentStatus](ConceptMap-HL70278ToAppointmentStatus.md) | The mapping the ingestion service applies to SCH-25. Blocked, Overbook and Started have no exact FHIR equivalent. |

