trigger StudentTrigger on Student__c (before insert, before update) {

    for (Student__c student : Trigger.new) {

        // Validate CGPA
        if (student.CGPA__c != null) {
            if (student.CGPA__c < 0 || student.CGPA__c > 10) {
                student.CGPA__c.addError('CGPA must be between 0 and 10.');
            }
        }

        // Validate graduation year
        if (student.Graduation_Year__c != null) {
            if (student.Graduation_Year__c < 2020) {
                student.Graduation_Year__c.addError(
                    'Please enter a valid graduation year.'
                );
            }
        }
    }
}