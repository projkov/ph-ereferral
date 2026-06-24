Instance: ph-ereferral-server
InstanceOf: CapabilityStatement
Usage: #definition
Title: "PH eReferral Server Capability Statement"
Description: "Defines the minimum required server capabilities for a system conforming to the PH eReferral Implementation Guide, covering referral workflow resources in the Philippines health system."

* url = "https://fhir.doh.gov.ph/pheref/CapabilityStatement/ph-ereferral-server"
* version = "0.1.0"
* name = "PHERefServerCapabilityStatement"
* title = "PH eReferral Server Capability Statement"
* status = #draft
* experimental = false
* date = "2026-06-24"
* publisher = "SILab CoP IG Accelerator (eReferral)"
* description = "Defines the minimum required capabilities for a PH eReferral-conformant FHIR server supporting referral workflows in the Philippines health system."
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml

* rest[+].mode = #server
* rest[=].documentation = "PH eReferral FHIR REST endpoint. All resources are scoped to the referral workflow and conform to PH eReferral or PH Core profiles."

// ============================================================================
// Patient
// ============================================================================
* rest[=].resource[+].type = #Patient
* rest[=].resource[=].supportedProfile = Canonical(ERefPatient)
* rest[=].resource[=].documentation = "Patient demographics for the referred individual."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-identifier"
* rest[=].resource[=].searchParam[+].name = "name"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-name"
* rest[=].resource[=].searchParam[+].name = "birthdate"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-birthdate"
* rest[=].resource[=].searchParam[+].name = "gender"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-gender"

// ============================================================================
// Practitioner
// ============================================================================
* rest[=].resource[+].type = #Practitioner
* rest[=].resource[=].supportedProfile = Canonical(PHCorePractitioner)
* rest[=].resource[=].documentation = "Referring and receiving practitioners."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-identifier"
* rest[=].resource[=].searchParam[+].name = "name"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Practitioner-name"

// ============================================================================
// Organization
// ============================================================================
* rest[=].resource[+].type = #Organization
* rest[=].resource[=].supportedProfile = Canonical(PHCoreOrganization)
* rest[=].resource[=].documentation = "Initiating and receiving health facilities (NHFR-registered)."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-identifier"
* rest[=].resource[=].searchParam[+].name = "name"
* rest[=].resource[=].searchParam[=].type = #string
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
* rest[=].resource[=].searchParam[+].name = "type"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Organization-type"

// ============================================================================
// PractitionerRole
// ============================================================================
* rest[=].resource[+].type = #PractitionerRole
* rest[=].resource[=].supportedProfile = Canonical(ERefPractitionerRole)
* rest[=].resource[=].documentation = "Practitioner roles linking clinicians to initiating or receiving facilities."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "identifier"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-identifier"
* rest[=].resource[=].searchParam[+].name = "practitioner"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-practitioner"
* rest[=].resource[=].searchParam[+].name = "organization"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-organization"
* rest[=].resource[=].searchParam[+].name = "role"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/PractitionerRole-role"

// ============================================================================
// ServiceRequest
// ============================================================================
* rest[=].resource[+].type = #ServiceRequest
* rest[=].resource[=].supportedProfile = Canonical(ERefServiceRequest)
* rest[=].resource[=].documentation = "The core referral request resource."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[+].name = "status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-status"
* rest[=].resource[=].searchParam[+].name = "intent"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-intent"
* rest[=].resource[=].searchParam[+].name = "category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-category"
* rest[=].resource[=].searchParam[+].name = "authored"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-authored"
* rest[=].resource[=].searchParam[+].name = "requester"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/ServiceRequest-requester"

// ============================================================================
// Encounter
// ============================================================================
* rest[=].resource[+].type = #Encounter
* rest[=].resource[=].supportedProfile = Canonical(ERefEncounter)
* rest[=].resource[=].documentation = "Encounter context for the referral visit at the initiating facility."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[+].name = "status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Encounter-status"
* rest[=].resource[=].searchParam[+].name = "date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest[=].resource[=].searchParam[+].name = "class"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Encounter-class"

// ============================================================================
// Condition
// ============================================================================
* rest[=].resource[+].type = #Condition
* rest[=].resource[=].supportedProfile = Canonical(ERefCondition)
* rest[=].resource[=].documentation = "Diagnoses, chief complaints, and clinical conditions supporting the referral."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[+].name = "code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[=].resource[=].searchParam[+].name = "category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-category"
* rest[=].resource[=].searchParam[+].name = "clinical-status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-clinical-status"
* rest[=].resource[=].searchParam[+].name = "encounter"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Condition-encounter"

// ============================================================================
// Observation
// ============================================================================
* rest[=].resource[+].type = #Observation
* rest[=].resource[=].supportedProfile = Canonical(ERefObservation)
* rest[=].resource[=].documentation = "Vital signs and clinical measurements in the referral clinical summary."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[+].name = "code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[=].resource[=].searchParam[+].name = "category"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-category"
* rest[=].resource[=].searchParam[+].name = "encounter"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
* rest[=].resource[=].searchParam[+].name = "date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest[=].resource[=].searchParam[+].name = "status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Observation-status"

// ============================================================================
// Procedure
// ============================================================================
* rest[=].resource[+].type = #Procedure
* rest[=].resource[=].supportedProfile = Canonical(ERefProcedure)
* rest[=].resource[=].documentation = "Procedures performed prior to or during the referral encounter."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-patient"
* rest[=].resource[=].searchParam[+].name = "code"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-code"
* rest[=].resource[=].searchParam[+].name = "status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Procedure-status"
* rest[=].resource[=].searchParam[+].name = "encounter"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-encounter"
* rest[=].resource[=].searchParam[+].name = "date"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"


// ============================================================================
// Task
// ============================================================================
* rest[=].resource[+].type = #Task
* rest[=].resource[=].supportedProfile = Canonical(ERefTask)
* rest[=].resource[=].documentation = "Referral workflow tracking task managing state transitions from request through completion."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-patient"
* rest[=].resource[=].searchParam[+].name = "status"
* rest[=].resource[=].searchParam[=].type = #token
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-status"
* rest[=].resource[=].searchParam[+].name = "focus"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-focus"
* rest[=].resource[=].searchParam[+].name = "requester"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-requester"
* rest[=].resource[=].searchParam[+].name = "owner"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Task-owner"

// ============================================================================
// Provenance
// ============================================================================
* rest[=].resource[+].type = #Provenance
* rest[=].resource[=].supportedProfile = Canonical(ERefProvenance)
* rest[=].resource[=].documentation = "Audit trail for referral actions including professional signatures and timestamps."
* rest[=].resource[=].interaction[+].code = #read
* rest[=].resource[=].interaction[+].code = #search-type
* rest[=].resource[=].searchParam[+].name = "target"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Provenance-target"
* rest[=].resource[=].searchParam[+].name = "recorded"
* rest[=].resource[=].searchParam[=].type = #date
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Provenance-recorded"
* rest[=].resource[=].searchParam[+].name = "patient"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Provenance-patient"
* rest[=].resource[=].searchParam[+].name = "agent"
* rest[=].resource[=].searchParam[=].type = #reference
* rest[=].resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Provenance-agent"
