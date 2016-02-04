trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
//list<opportunity>opp=[select id,StageName,CloseDate from opportunity  where id in:Trigger.newmap.keyset()];
List<Task> taskList = new List<Task>();

for(opportunity opp1 :Trigger.new){

if(opp1.StageName=='Closed Won'){
taskList .add(new task(Subject='Follow Up Test Task',WhatId=opp1.id));
    //system.debug('eve'+eve);
  }
}
if(taskList .size()>0){
insert taskList ;
}
}