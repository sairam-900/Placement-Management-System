Sprint 32 — Task 1: External Recruitment API Contract

1. Purpose

This API contract defines the data Salesforce will send to the external recruitment system when a student's application reaches the Selected status.

2. API Endpoint

HTTP Method

POST

Endpoint

/candidates

The complete endpoint will be configured later through a Salesforce Named Credential.

3. Request Headers

Content-Type: application/json

Authentication will be handled through a Salesforce Named Credential.

Secrets, passwords, and access tokens must not be hard-coded in Apex.

4. Candidate Request Fields

Field

Description

studentId

Unique Student Id

name

Student Name

email

Student Email

branch

Student Branch

cgpa

Student CGPA

jobId

Selected Job Id

company

Company Name

role

Job Role

selectionDate

Date on which the student was selected

5. Sample Request

{
    "studentId": "STU001",
    "name": "Leela Sai Ram",
    "email": "student@example.com",
    "branch": "ECE",
    "cgpa": 8.5,
    "jobId": "JOB001",
    "company": "ABC Technologies",
    "role": "Salesforce Developer",
    "selectionDate": "2026-08-11"
}

6. Salesforce Data Mapping

The candidate data will be collected from the existing Salesforce records.

Student
├── Student Id
├── Name
├── Email
├── Branch
└── CGPA

Job__c
├── Job Id
├── Company
└── Role

Application__c
├── Student
├── Job
├── Status
└── Selection Date

The exact Salesforce API names must match the fields that exist in the org.

7. Success Response

HTTP 200 / 201

{
    "success": true,
    "message": "Candidate synchronized successfully",
    "candidateId": "EXT001"
}

8. Error Responses

400 — Bad Request

{
    "success": false,
    "message": "Invalid candidate data"
}

401 — Authentication Failure

{
    "success": false,
    "message": "Authentication failed"
}

403 — Forbidden

{
    "success": false,
    "message": "Access forbidden"
}

500 — Server Error

{
    "success": false,
    "message": "Internal server error"
}

9. Unexpected Responses

Any response that is not explicitly handled must be treated as an unexpected response.

The integration should capture the HTTP status code and response body for troubleshooting.

10. Security

The integration must not contain:

Hard-coded passwords
Hard-coded access tokens
Hard-coded API secrets

Authentication will be configured using:

Salesforce Named Credential

11. Integration Architecture

Application__c
      ↓
Status = Selected
      ↓
Application Trigger
      ↓
CandidateSyncQueueable
      ↓
Named Credential
      ↓
POST /candidates
      ↓
External Recruitment System
      ↓
HTTP Response
      ↓
Success / Error Handling

12. Task 1 Completion Checklist

API endpoint defined

HTTP method defined

Request headers defined

Candidate fields defined

JSON request example created

Salesforce data mapping documented

Success response documented

400 Bad Request documented

401 Authentication Failure documented

403 Forbidden documented

500 Server Error documented

Unexpected response handling documented

Security requirements documented

Integration architecture documented

13. Next Sprint 32 Task

After completing this API contract, the next implementation task is:

Task 2 — Create CandidateSyncQueueable.cls