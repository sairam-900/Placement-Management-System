trigger JobTrigger on Job__c (before insert, before update) {

    for (Job__c job : Trigger.new) {

        // Validate minimum CGPA
        if (job.Minimum_CGPA__c != null) {
            if (job.Minimum_CGPA__c < 0 || job.Minimum_CGPA__c > 10) {
                job.Minimum_CGPA__c.addError(
                    'Minimum CGPA must be between 0 and 10.'
                );
            }
        }

        // Validate package
        if (job.Package__c != null && job.Package__c < 0) {
            job.Package__c.addError(
                'Package cannot be negative.'
            );
        }
    }
}