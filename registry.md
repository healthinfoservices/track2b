# Local Registry - HL7 v2 SIU to FHIR Appointment - AU Core (Proof of Concept) v0.1.0

* [**Table of Contents**](toc.md)
* **Local Registry**

## Local Registry

The service reads a small JSON registry (`config/au-registry.json`, or the path in the `AU_REGISTRY` environment variable) for the one thing SIU doesn't carry and the FHIR server doesn't hold: translations of local location type codes.

| | | |
| :--- | :--- | :--- |
| `locationTypes.{code}` | AIL-4.1 | A Coding from ServiceDeliveryLocationRoleType - AU Extended for`Location.type`. Untranslated codes are sent as local codes with a warning |

Keys starting with `_` are ignored, so they can hold comments and examples.

Everything else that used to need local configuration is handled without it:

| | |
| :--- | :--- |
| Facility name, address, HPI-O | Organizations on the FHIR server, found by`http://example.org/fhir/sid/organization`+ AIL-3.4 and never modified; a tagged placeholder is created when missing. Load them with`tools/seed_fhir.py` |
| MRN namespace | Fixed rule:`http://example.org/fhir/sid/mrn/`+ PID-3.4. No assigner is sent |

The location type translations could later move onto the FHIR server as a ConceptMap.

