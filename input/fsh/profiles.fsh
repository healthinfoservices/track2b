// Patient, Practitioner, Location and Organization are AU Core 2.0.0 profiles used as-is.
// Appointment has no AU Core (or AU Base) profile, so this IG defines one.

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
* identifier 1..* MS

Invariant: siu-appt-1
Description: "Exactly one participant references the Patient"
Expression: "participant.where(actor.reference.contains('Patient/')).count() = 1"
Severity: #error

Invariant: siu-appt-2
Description: "cancelationReason is only populated for cancelled appointments"
Expression: "cancelationReason.exists() implies status = 'cancelled'"
Severity: #error
