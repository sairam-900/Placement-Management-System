public with sharing class ApplicationIntegrationController {

    @AuraEnabled(cacheable=true)
    public static Application__c getApplication(Id applicationId) {

        if (applicationId == null) {
            throw new AuraHandledException(
                'Application Id is required.'
            );
        }

        return [
            SELECT Id,
                   Name,
                   Status__c,
                   Integration_Status__c,
                   External_Candidate_Id__c,
                   Last_Integration_Attempt__c,
                   Integration_Error__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];
    }


    @AuraEnabled
    public static String syncCandidate(Id applicationId) {

        if (applicationId == null) {
            throw new AuraHandledException(
                'Application Id is required.'
            );
        }

        Application__c applicationRecord = [
            SELECT Id,
                   Status__c,
                   Integration_Status__c
            FROM Application__c
            WHERE Id = :applicationId
            LIMIT 1
        ];

        if (applicationRecord.Status__c != 'Selected') {

            throw new AuraHandledException(
                'Candidate can be synchronized only after selection.'
            );
        }

        applicationRecord.Integration_Status__c = 'Pending';
        applicationRecord.Last_Integration_Attempt__c =
            System.now();
        applicationRecord.Integration_Error__c = null;

        update applicationRecord;

        System.enqueueJob(
            new CandidateSyncQueueable(applicationId)
        );

        return 'Candidate synchronization started successfully.';
    }
}