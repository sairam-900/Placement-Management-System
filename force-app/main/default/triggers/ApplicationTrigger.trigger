trigger ApplicationTrigger on Application__c (before insert, before update) {

    for (Application__c application : Trigger.new) {

        // Set application date automatically
        if (Trigger.isInsert && application.Application_Date__c == null) {
            application.Application_Date__c = Date.today();
        }

        // Set default status
        if (Trigger.isInsert && String.isBlank(application.Status__c)) {
            application.Status__c = 'Applied';
        }
    }
}