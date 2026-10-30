// Patient, Practitioner, Location and Organization are AU Core 2.0.0 profiles used as-is.
// Appointment has no AU Core (or AU Base) profile, so this IG defines one.
Alias: $SCT = http://snomed.info/sct
Alias: $APTStatus = http://hl7.org/fhir/ValueSet/appointmentstatus
Alias: $APTCancel = http://terminology.hl7.org/ValueSet/appointment-cancellation-reason
Alias: $APTType = http://terminology.hl7.org/ValueSet/v2-0276
Alias: $AUCorePatient = http://hl7.org.au/fhir/core/StructureDefinition/au-core-patient


Profile: SIUAUAppointment
Parent: Appointment
Id: siu-au-appointment
Title: "SIU AU Appointment"
Description: """
An Appointment created and maintained from HL7 v2 SIU S12, S13, S14 and S15 messages,
whose participants are AU Core resources. The ingestion service rebuilds the whole
resource from each message it applies.
"""
* obeys siu-appt-1 and siu-appt-2
* extension contains
    SourceMessageDateTime named sourceMessageDateTime 0..1 MS and
    SourceMessageControlId named sourceMessageControlId 0..1 MS
* identifier 1..1 MS
* status 1..1 MS
* status from $APTStatus
* cancelationReason 0..1
* cancelationReason from $APTCancel (preferred)
* appointmentType 1..1 MS
* appointmentType from $APTType
* serviceType 0..1
* start 1..1 MS
* end 0..1 MS
* minutesDuration MS
* participant.actor only Reference(Patient or Practitioner or Location) 

 

Invariant: siu-appt-1
Description: "Exactly one participant references the Patient"
Expression: "participant.where(actor.reference.contains('Patient/')).count() = 1"
Severity: #error

Invariant: siu-appt-2
Description: "cancelationReason is only populated for cancelled appointments"
Expression: "cancelationReason.exists() implies status = 'cancelled'"
Severity: #error
