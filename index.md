# Home - HL7 v2 SIU to FHIR Appointment - AU Core (Proof of Concept) v0.1.0

* [**Table of Contents**](toc.md)
* **Home**

## Home

| | |
| :--- | :--- |
| *Official URL*:http://example.org/fhir/siu2fhir-au/ImplementationGuide/example.fhir.siu2fhir.au | *Version*:0.1.0 |
| Draft as of 2026-10-30 | *Computable Name*:SIU2FHIRAUCore |

### Purpose

This implementation guide documents a **proof of concept** that turns an HL7 v2 scheduling feed into FHIR R4 resources conforming to **AU Core 2.0.0**. A Python ingestion service receives SIU S12, S13, S14 and S15 messages, converts them, and writes them to a HAPI FHIR server. A web front end (planned: Vue/Vuetify) reads appointments directly from that server.

This guide describes a proof of concept that uses
**simulated data only**. It is not intended for clinical use. IHI, HPI-I and Medicare numbers in the examples are
**synthetic**: they pass the AU Base format checks but were not issued to anyone. The canonical URL, local identifier systems and local code systems are
`example.org`placeholders.

### What conforms to what

| | | |
| :--- | :--- | :--- |
| Patient | [AU Core Patient](https://hl7.org.au/fhir/core/StructureDefinition-au-core-patient.html) | PID |
| Practitioner | [AU Core Practitioner](https://hl7.org.au/fhir/core/StructureDefinition-au-core-practitioner.html) | AIP-3 |
| Location | [AU Core Location](https://hl7.org.au/fhir/core/StructureDefinition-au-core-location.html) | AIL-3, AIL-4 |
| Organization | [AU Core Organization](https://hl7.org.au/fhir/core/StructureDefinition-au-core-organization.html) | AIL-3.4 facility, looked up on the FHIR server |
| Appointment | [SIU AU Appointment](StructureDefinition-siu-au-appointment.md)(this guide) | SCH, AIS, AIG, AIL, AIP, NTE |

AU Core 2.0.0 has no Appointment profile, so this guide defines one whose participants reference the AU Core resources.

### Scope

| | | |
| :--- | :--- | :--- |
| S12 | New appointment booking | Create the Appointment (or update it if the ID already exists) |
| S13 | Reschedule | Rebuild the Appointment with the new times |
| S14 | Modification | Rebuild the Appointment with the changed details |
| S15 | Cancellation | Set status to`cancelled`and record the reason |

### Dependencies








### How to read this guide

* [AU Core Conformance](au-core.md): what changes compared with a plain FHIR R4 mapping, and why.
* [Mapping](mapping.md): field-level HL7 v2 to FHIR rules.
* [Local Registry](registry.md): local configuration (location type translations), and how facilities and MRN namespaces are handled without it.
* [Processing](messaging.md): matching, ordering and acknowledgements.
* [Worked Example](lifecycle.md): one appointment through S12 → S13 → S14 → S15, plus a missing-data example.
* [Building This Guide](building.md): local build and the GitHub Pages workflow.
* [Open Issues](open-issues.md).



## Resource Content

```json
{
  "resourceType" : "ImplementationGuide",
  "id" : "example.fhir.siu2fhir.au",
  "url" : "http://example.org/fhir/siu2fhir-au/ImplementationGuide/example.fhir.siu2fhir.au",
  "version" : "0.1.0",
  "name" : "SIU2FHIRAUCore",
  "title" : "HL7 v2 SIU to FHIR Appointment - AU Core (Proof of Concept)",
  "status" : "draft",
  "experimental" : true,
  "date" : "2026-10-30T02:04:31+00:00",
  "publisher" : "SIU2FHIR PoC",
  "description" : "Describes how a proof-of-concept service converts HL7 v2 SIU S12, S13, S14 and S15 scheduling messages into FHIR R4 resources that conform to AU Core 2.0.0 (Patient, Practitioner, Location, Organization) plus an Appointment profile. Simulated data only; not for clinical use.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "AU",
      "display" : "Australia"
    }]
  }],
  "packageId" : "example.fhir.siu2fhir.au",
  "license" : "CC0-1.0",
  "fhirVersion" : ["4.0.1"],
  "dependsOn" : [{
    "id" : "hl7tx",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on HL7 Terminology"
    }],
    "uri" : "http://terminology.hl7.org/ImplementationGuide/hl7.terminology",
    "packageId" : "hl7.terminology.r4",
    "version" : "7.5.0"
  },
  {
    "id" : "hl7ext",
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/implementationguide-dependency-comment",
      "valueMarkdown" : "Automatically added as a dependency - all IGs depend on the HL7 Extension Pack"
    }],
    "uri" : "http://hl7.org/fhir/extensions/ImplementationGuide/hl7.fhir.uv.extensions",
    "packageId" : "hl7.fhir.uv.extensions.r4",
    "version" : "5.4.0"
  },
  {
    "id" : "hl7_fhir_au_core",
    "uri" : "http://hl7.org.au/fhir/core/ImplementationGuide/hl7.fhir.au.core",
    "packageId" : "hl7.fhir.au.core",
    "version" : "2.0.0"
  },
  {
    "id" : "hl7_fhir_au_base",
    "uri" : "http://hl7.org.au/fhir/ImplementationGuide/hl7.fhir.au.base",
    "packageId" : "hl7.fhir.au.base",
    "version" : "6.0.0"
  }],
  "definition" : {
    "extension" : [{
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-internal-dependency",
      "valueCode" : "hl7.fhir.uv.tools.r4#1.3.0"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "copyrightyear"
      },
      {
        "url" : "value",
        "valueString" : "2026+"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "releaselabel"
      },
      {
        "url" : "value",
        "valueString" : "ci-build"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "autoload-resources"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "template/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-liquid"
      },
      {
        "url" : "value",
        "valueString" : "input/liquid"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-qa"
      },
      {
        "url" : "value",
        "valueString" : "temp/qa"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-temp"
      },
      {
        "url" : "value",
        "valueString" : "temp/pages"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-output"
      },
      {
        "url" : "value",
        "valueString" : "output"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-suppressed-warnings"
      },
      {
        "url" : "value",
        "valueString" : "input/ignoreWarnings.txt"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "path-history"
      },
      {
        "url" : "value",
        "valueString" : "http://example.org/fhir/siu2fhir-au/history.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-html"
      },
      {
        "url" : "value",
        "valueString" : "template-page.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "template-md"
      },
      {
        "url" : "value",
        "valueString" : "template-page-md.html"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-contact"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-context"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-copyright"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-jurisdiction"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-license"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-publisher"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-version"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "apply-wg"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "active-tables"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "fmm-definition"
      },
      {
        "url" : "value",
        "valueString" : "http://hl7.org/fhir/versions.html#maturity"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "propagate-status"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "excludelogbinaryformat"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    },
    {
      "extension" : [{
        "url" : "code",
        "valueCode" : "tabbed-snapshots"
      },
      {
        "url" : "value",
        "valueString" : "true"
      }],
      "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-parameter"
    }],
    "resource" : [{
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ValueSet"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ValueSet-appointment-identifier-type.html"
      }],
      "reference" : {
        "reference" : "ValueSet/appointment-identifier-type"
      },
      "name" : "Appointment Identifier Type",
      "description" : "Identifier types used on SIU Appointments: filler (SCH-2) and placer (SCH-1) appointment IDs.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ConceptMap"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ConceptMap-HL70001ToAdministrativeGender.html"
      }],
      "reference" : {
        "reference" : "ConceptMap/HL70001ToAdministrativeGender"
      },
      "name" : "HL7 v2 Administrative Sex (0001) to FHIR AdministrativeGender",
      "description" : "The mapping the ingestion service applies to PID-8. The A and N mappings are judgement calls.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "ConceptMap"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "ConceptMap-HL70278ToAppointmentStatus.html"
      }],
      "reference" : {
        "reference" : "ConceptMap/HL70278ToAppointmentStatus"
      },
      "name" : "HL7 v2 Filler Status (0278) to FHIR AppointmentStatus",
      "description" : "The mapping the ingestion service applies to SCH-25. Blocked, Overbook and Started have no exact FHIR equivalent.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:resource"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-siu-au-appointment.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/siu-au-appointment"
      },
      "name" : "SIU AU Appointment",
      "description" : "An Appointment created and maintained from HL7 v2 SIU S12, S13, S14 and S15 messages,\nwhose participants are AU Core resources. The ingestion service rebuilds the whole\nresource from each message it applies.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "CodeSystem"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "CodeSystem-siu2fhir-tag.html"
      }],
      "reference" : {
        "reference" : "CodeSystem/siu2fhir-tag"
      },
      "name" : "SIU2FHIR Resource Tags",
      "description" : "Tags (meta.tag) the ingestion service puts on resources it creates.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-source-message-control-id.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/source-message-control-id"
      },
      "name" : "Source Message Control ID",
      "description" : "The MSH-10 (message control ID) of the most recent HL7 v2 SIU message applied to this\nAppointment. Provides traceability back to the interface engine's message log.",
      "exampleBoolean" : false
    },
    {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/resource-information",
        "valueString" : "StructureDefinition:extension"
      },
      {
        "url" : "http://hl7.org/fhir/StructureDefinition/implementationguide-page",
        "valueUri" : "StructureDefinition-source-message-datetime.html"
      }],
      "reference" : {
        "reference" : "StructureDefinition/source-message-datetime"
      },
      "name" : "Source Message Date/Time",
      "description" : "The MSH-7 (date/time of message) of the most recent HL7 v2 SIU message applied to this\nAppointment. The ingestion service compares an incoming message's MSH-7 with this value\nand ignores messages that are older, so a delayed message cannot undo a later change.",
      "exampleBoolean" : false
    }],
    "page" : {
      "extension" : [{
        "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
        "valueUrl" : "toc.html"
      }],
      "nameUrl" : "toc.html",
      "title" : "Table of Contents",
      "generation" : "html",
      "page" : [{
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "index.html"
        }],
        "nameUrl" : "index.html",
        "title" : "Home",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "architecture.html"
        }],
        "nameUrl" : "architecture.html",
        "title" : "Architecture",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "au-core.html"
        }],
        "nameUrl" : "au-core.html",
        "title" : "AU Core Conformance",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "adapter-specification.html"
        }],
        "nameUrl" : "adapter-specification.html",
        "title" : "Adapter Specification",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "mapping.html"
        }],
        "nameUrl" : "mapping.html",
        "title" : "HL7 v2 to FHIR Mapping",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "registry.html"
        }],
        "nameUrl" : "registry.html",
        "title" : "Local Registry",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "messaging.html"
        }],
        "nameUrl" : "messaging.html",
        "title" : "Message Processing and Acknowledgements",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "lifecycle.html"
        }],
        "nameUrl" : "lifecycle.html",
        "title" : "Worked Example",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "building.html"
        }],
        "nameUrl" : "building.html",
        "title" : "Building This Guide",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "open-issues.html"
        }],
        "nameUrl" : "open-issues.html",
        "title" : "Open Issues",
        "generation" : "markdown"
      },
      {
        "extension" : [{
          "url" : "http://hl7.org/fhir/tools/StructureDefinition/ig-page-name",
          "valueUrl" : "facility-codes.html"
        }],
        "nameUrl" : "facility-codes.html",
        "title" : "Facility Codes",
        "generation" : "markdown"
      }]
    },
    "parameter" : [{
      "code" : "path-resource",
      "value" : "input/capabilities"
    },
    {
      "code" : "path-resource",
      "value" : "input/examples"
    },
    {
      "code" : "path-resource",
      "value" : "input/extensions"
    },
    {
      "code" : "path-resource",
      "value" : "input/models"
    },
    {
      "code" : "path-resource",
      "value" : "input/operations"
    },
    {
      "code" : "path-resource",
      "value" : "input/profiles"
    },
    {
      "code" : "path-resource",
      "value" : "input/resources"
    },
    {
      "code" : "path-resource",
      "value" : "input/vocabulary"
    },
    {
      "code" : "path-resource",
      "value" : "input/maps"
    },
    {
      "code" : "path-resource",
      "value" : "input/testing"
    },
    {
      "code" : "path-resource",
      "value" : "input/history"
    },
    {
      "code" : "path-resource",
      "value" : "fsh-generated/resources"
    },
    {
      "code" : "path-pages",
      "value" : "template/config"
    },
    {
      "code" : "path-pages",
      "value" : "input/images"
    },
    {
      "code" : "path-tx-cache",
      "value" : "input-cache/txcache"
    }]
  }
}

```
