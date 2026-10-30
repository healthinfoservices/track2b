<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Appointment
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Appointment</sch:title>
    <sch:rule context="f:Appointment">
      <sch:assert test="count(f:extension[@url = 'http://example.org/fhir/siu2fhir-au/StructureDefinition/source-message-datetime']) &lt;= 1">extension with URL = 'http://example.org/fhir/siu2fhir-au/StructureDefinition/source-message-datetime': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://example.org/fhir/siu2fhir-au/StructureDefinition/source-message-control-id']) &lt;= 1">extension with URL = 'http://example.org/fhir/siu2fhir-au/StructureDefinition/source-message-control-id': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &gt;= 1">identifier: minimum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:identifier) &lt;= 1">identifier: maximum cardinality of 'identifier' is 1</sch:assert>
      <sch:assert test="count(f:serviceType) &lt;= 1">serviceType: maximum cardinality of 'serviceType' is 1</sch:assert>
      <sch:assert test="count(f:appointmentType) &gt;= 1">appointmentType: minimum cardinality of 'appointmentType' is 1</sch:assert>
      <sch:assert test="count(f:start) &gt;= 1">start: minimum cardinality of 'start' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
