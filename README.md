Placement Management System

A Salesforce-based Placement Management System designed to manage students, job opportunities, and student applications through a centralized platform.

The project demonstrates a complete Salesforce development workflow using Salesforce metadata, Apex, Triggers, Lightning Web Components (LWC), Git, GitHub, code review, deployment, and testing.

📌 Project Overview

The Placement Management System helps manage the placement activities of students and companies.

The system can be used to:

Manage student information

Manage job opportunities

Maintain eligibility information

Allow students to apply for jobs

Track application status

Automate business validations using Apex Triggers

Provide user interfaces using Lightning Web Components

Maintain Salesforce metadata in GitHub

Follow a controlled development and deployment workflow

🎯 Objectives

The main objectives of this project are:

Build a Salesforce-based placement management application.

Manage student and job-related information.

Automate business logic using Apex.

Use Apex Triggers for record validation and automation.

Develop user interfaces using Lightning Web Components.

Store Salesforce source code in GitHub.

Follow a feature-branch and Pull Request workflow.

Perform code reviews before merging changes.

Deploy Salesforce metadata to a development/test environment.

Test and verify the deployed application.

🛠️ Technologies Used

Technology

Purpose

Salesforce

Application platform

Apex

Backend business logic

Apex Triggers

Automation and validation

Lightning Web Components

Frontend/User Interface

Salesforce CLI

Salesforce source management and deployment

Visual Studio Code

Development environment

Git

Version control

GitHub

Source code repository

Salesforce Metadata

Objects, fields, classes, triggers, LWC, etc.

🏗️ Project Architecture

                PLACEMENT MANAGEMENT SYSTEM
                          |
         +----------------+----------------+
         |                |                |
         v                v                v
      Students          Jobs        Applications
         |                |                |
         +----------------+----------------+
                          |
                          v
                     Salesforce
                          |
          +---------------+---------------+
          |               |               |
          v               v               v
        Apex           Triggers          LWC
          |               |               |
          +---------------+---------------+
                          |
                          v
                     Git / GitHub
                          |
                          v
               Development / Test Org

📂 Project Structure

The Salesforce project follows the standard Salesforce DX project structure.

placement-management-system/
│
├── force-app/
│   └── main/
│       └── default/
│           │
│           ├── classes/
│           │   ├── ApplicationService.cls
│           │   ├── ApplicationService.cls-meta.xml
│           │   ├── ApplicationServiceTest.cls
│           │   └── ApplicationServiceTest.cls-meta.xml
│           │
│           ├── triggers/
│           │   ├── StudentTrigger.trigger
│           │   ├── StudentTrigger.trigger-meta.xml
│           │   ├── JobTrigger.trigger
│           │   ├── JobTrigger.trigger-meta.xml
│           │   ├── ApplicationTrigger.trigger
│           │   └── ApplicationTrigger.trigger-meta.xml
│           │
│           ├── lwc/
│           │   ├── studentManagement/
│           │   ├── jobManagement/
│           │   └── applicationManagement/
│           │
│           ├── objects/
│           │   ├── Student__c/
│           │   ├── Job__c/
│           │   └── Application__c/
│           │
│           └── flows/
│
├── docs/
│   └── deployment/
│       └── deployment-guide.md
│
├── scripts/
│
├── README.md
└── .gitignore

The exact components in the repository depend on the metadata implemented in the Salesforce org.

📊 Main Salesforce Components

1. Student

The Student component stores information about students participating in the placement process.

Example information:

Student Name

Email

Phone

Branch

CGPA

Graduation Year

2. Job

The Job component stores available job opportunities.

Example information:

Company

Job Role

Package

Minimum CGPA

Eligibility

Application Deadline

3. Application

The Application component connects students with job opportunities.

Example information:

Student

Job

Application Date

Application Status

⚙️ Apex

Apex is used to implement server-side business logic.

Example responsibilities:

Application processing

Eligibility validation

Student-related business logic

Job-related business logic

Application status processing

Database operations

Example structure:

classes/
├── ApplicationService.cls
├── ApplicationServiceTest.cls
├── JobService.cls
└── StudentService.cls

🔄 Apex Triggers

Apex Triggers are used for record-level automation and validation.

Current project triggers include:

triggers/
├── StudentTrigger.trigger
├── JobTrigger.trigger
└── ApplicationTrigger.trigger

StudentTrigger

Responsible for validations related to Student records.

Example:

CGPA validation

Graduation year validation

JobTrigger

Responsible for validations related to Job records.

Example:

Minimum CGPA validation

Package validation

ApplicationTrigger

Responsible for application-related automation.

Example:

Default application date

Default application status

💻 Lightning Web Components

Lightning Web Components provide the user interface for the application.

Example components:

lwc/
├── studentManagement/
├── jobManagement/
└── applicationManagement/

The LWC layer communicates with Apex when server-side processing or Salesforce data access is required.

🔐 Security

Security should be considered throughout the application.

The project should avoid:

Hard-coded credentials

API keys in source code

Passwords in GitHub

Unnecessary access to Salesforce data

Salesforce security concepts should be considered where applicable:

Object permissions

Field-level security

Record access

Sharing

User permissions

🌿 Git Branching Strategy

The project follows a feature-branch workflow.

main
|
+---- feature/student-management
|
+---- feature/job-management
|
+---- feature/application-management

Developers should avoid making uncontrolled changes directly to main.

🔄 Development Workflow

The recommended workflow is:

Salesforce Developer Org
|
v
VS Code
|
v
Git Branch
|
v
Commit
|
v
GitHub
|
v
Pull Request
|
v
Code Review
|
v
Merge
|
v
main

🚀 GitHub Setup

Initialize Git

From the project root:

git init

Check the repository:

git status

Add Files

git add .

Commit Changes

git commit -m "Add placement management system Salesforce components"

Connect GitHub Repository

Add the GitHub remote:

git remote add origin YOUR_GITHUB_REPOSITORY_URL

Verify:

git remote -v

Push to GitHub

git branch -M main
git push -u origin main

🌱 Feature Branch Workflow

Create a feature branch:

git checkout -b feature/application-management

Make your changes and check the status:

git status

Stage the changes:

git add .

Commit:

git commit -m "Improve application management workflow"

Push:

git push -u origin feature/application-management

Then create a Pull Request on GitHub.

🔍 Code Review

Every meaningful feature should preferably go through a Pull Request before merging.

The reviewer should check:

Apex

Bulkification

SOQL usage

DML usage

Error handling

Test coverage

Clear class responsibility

LWC

Component responsibility

Naming

Loading states

Error handling

Unnecessary duplicated logic

Security

No hard-coded secrets

Appropriate permissions

Appropriate sharing/security considerations

Integration

Appropriate authentication

Failure handling

Duplicate processing considerations

🚢 Deployment

Deployment means moving Salesforce metadata from the source repository/local project into a target Salesforce org.

The basic process is:

GitHub
|
v
Local Salesforce Source
|
v
Salesforce CLI
|
v
Development/Test Org

Deployment should be performed only after the code has been reviewed and approved.

🧪 Testing

Testing is performed after deployment.

The testing process includes:

Deployment
|
v
Apex Tests
|
v
Functional Testing
|
v
Manual Verification
|
v
Final Validation

Apex Testing

Apex test classes should verify:

Successful operations

Validation rules

Error conditions

Business logic

Database operations

Example:

ApplicationService
|
v
ApplicationServiceTest
|
v
Create Test Data
|
v
Execute Method
|
v
Verify Result

🧑‍💻 Manual Testing

After deployment, manually verify the application.

Student Testing

Create Student
↓
Enter Student Details
↓
Save
↓
Verify Student Record

Job Testing

Create Job
↓
Enter Job Details
↓
Save
↓
Verify Job Record

Application Testing

Select Student
↓
Select Job
↓
Submit Application
↓
Verify Application
↓
Check Status

LWC Testing

Verify that:

Components load correctly

Records are displayed correctly

Buttons work

Data is saved correctly

Errors are displayed appropriately

Apex communication works correctly

📋 Deployment Checklist

Before deployment:

Code committed

Code pushed to GitHub

Pull Request created

Code reviewed

Review comments addressed

Pull Request merged

Correct target Salesforce org identified

Metadata dependencies checked

Apex tests available

After deployment:

Deployment successful

Apex tests passed

LWC tested

Student functionality tested

Job functionality tested

Application functionality tested

Manual verification completed

Deployment documented

📝 Deployment Documentation

For every important deployment, record:

Deployment Date:
Source Branch:
Commit:
Target Org:
Components Deployed:
Tests Executed:
Manual Verification:
Deployment Result:
Known Issues:

🔧 Troubleshooting

Git Authentication Error

Check the remote:

git remote -v

Make sure the repository URL is correct.

Git Push Rejected

First retrieve the latest changes:

git pull origin main

Resolve conflicts if necessary, then push again.

Salesforce Authentication Problem

Verify that the correct Salesforce org is authenticated and that the target org is the intended environment before deployment.

Metadata Deployment Failure

Check:

Missing dependencies

Incorrect metadata

Apex compilation errors

Test failures

Incorrect API names

Required fields

Object/field dependencies

LWC Not Working

Check:

JavaScript errors

HTML template

Apex method

Object permissions

Field permissions

Record access

Browser console errors

📚 Sprint Implementation

This project follows the Engineering Sprint workflow described for the Salesforce development lifecycle.

Sprint 35 — Repository Setup

Create Git Repository
↓
Create Project Structure
↓
Configure Source Control

Sprint 36 — Salesforce Metadata

Salesforce Org
↓
Retrieve Metadata
↓
Local Salesforce Project

Metadata can include:

Custom Objects

Fields

Apex Classes

Apex Triggers

Lightning Web Components

Other Salesforce configuration

Sprint 37 — Code Review

Feature Branch
↓
Commit
↓
Push
↓
Pull Request
↓
Code Review
↓
Fix Comments
↓
Merge

Sprint 38 — Deployment Comparison

Compare:

Changesets

Salesforce CLI

Metadata API

Scratch Orgs

Sandboxes

Choose the appropriate approach based on the development and deployment scenario.

Sprint 39 — Deployment

Feature
↓
Commit
↓
Pull Request
↓
Review
↓
Merge
↓
Deploy
↓
Run Tests
↓
Manual Verification
↓
Document

📈 Overall Development Lifecycle

          BUILD
            |
            v
    Salesforce Developer Org
            |
            v
         VS Code
            |
            v
      Salesforce Source
            |
            v
          Git
            |
            v
        GitHub
            |
            v
    Feature Branch
            |
            v
     Pull Request
            |
            v
      Code Review
            |
            v
         Merge
            |
            v
      Test / Dev Org
            |
            v
         Testing
            |
            v
      Manual Verify
            |
            v
           UAT
            |
            v
       Production

🎓 Learning Outcomes

By completing this project, you will understand:

Salesforce development using VS Code

Salesforce metadata

Apex development

Apex Triggers

Lightning Web Components

Git version control

GitHub repository management

Feature branching

Pull Requests

Code review

Salesforce CLI

Metadata deployment

Testing and validation

Salesforce development lifecycle

👨‍💻 Project Status

Project: Placement Management System

Platform: Salesforce

Development Environment: Visual Studio Code

Version Control: Git & GitHub

📌 Important Note

The repository should contain the Salesforce metadata that actually belongs to the project. If custom objects and fields already exist in the Salesforce org, they should be retrieved into the Salesforce DX project rather than creating unrelated duplicate metadata manually.

The deployment process should always identify the correct target environment, validate dependencies, run appropriate tests, and manually verify the deployed functionality before considering the deployment complete.