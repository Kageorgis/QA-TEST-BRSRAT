/**
   @Author Cognizant Tech.
   @name CRM_AutoTargetCreationAccInsertScheduler
   @CreateDate 27 September 2016
   @Description Schedulable class to schedule the CRM_AutoTargetCreationAccountInsertBatch.
   @Version <1.0>
   @reference Requirement no 153
*/
global with sharing class CRM_AutoTargetCreationAccInsertScheduler implements Schedulable {
    global void execute(SchedulableContext contextInstance) {
        //Batch instance 
        CRM_AutoTargetCreationAccountInsertBatch batchInstance = new CRM_AutoTargetCreationAccountInsertBatch();
        //Execute Batch
        Decimal batchSize =  10;
        CRM_Batch_Size__c setting = CRM_Batch_Size__c.getInstance('Auto Target Account Batch');
        if(setting != null && setting.Batch_Size__c != null){
            batchSize = setting.Batch_Size__c;
        }
        
        Database.executeBatch(batchInstance,Integer.valueOf(batchSize));
    }
}