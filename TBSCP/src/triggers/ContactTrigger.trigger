trigger ContactTrigger on Contact (after insert) { 
  
    // Define connection id 
    Id networkId = ConnectionHelper.getConnectionId('Tavant Technologies'); 
    
    Set<Id> localContactAccountSet = new Set<Id>(); 
    List<Contact> localContacts = new List<Contact>(); 
    Set<Id> sharedAccountSet = new Set<Id>();    
    
    // only share records created in this org, do not add contacts received from another org. 
    for (Contact newContact : TRIGGER.new) { 
        if (newContact.ConnectionReceivedId == null && newContact.AccountId != null) { 
            localContactAccountSet.add(newContact.AccountId); 
            localContacts.add(newContact); 
        }         
    } 
    
    if (localContactAccountSet.size() > 0) { 
        // Get the contact account's partner network record connections 
        for (PartnerNetworkRecordConnection accountSharingRecord :  
                                  [SELECT p.Status, p.LocalRecordId, p.ConnectionId 
                                   FROM PartnerNetworkRecordConnection p              
                                   WHERE p.LocalRecordId IN :localContactAccountSet]) { 
                  
            // for each partner connection record for contact's account, check if it is active 
            if ((accountSharingRecord.status.equalsignorecase('Sent') 
              || accountSharingRecord.status.equalsignorecase('Received')) 
              && (accountSharingRecord.ConnectionId == networkId)) { 
                sharedAccountSet.add(accountSharingRecord.LocalRecordId); 
            }               
        } 
            
        if (sharedAccountSet.size() > 0) { 
            List<PartnerNetworkRecordConnection> contactConnections =  new  List<PartnerNetworkRecordConnection>(); 
            
            for (Contact newContact : localContacts) { 
  
                if (sharedAccountSet.contains(newContact.AccountId)) { 
                   
                    PartnerNetworkRecordConnection newConnection = 
                      new PartnerNetworkRecordConnection( 
                          ConnectionId = networkId, 
                          LocalRecordId = newContact.Id, 
                          SendClosedTasks = false, 
                          SendOpenTasks = false, 
                          SendEmails = false, 
                          ParentRecordId = newContact.AccountId); 
                          
                    contactConnections.add(newConnection); 
                
                } 
            } 
  
            if (contactConnections.size() > 0 ) { 
                   database.insert(contactConnections); 
            } 
        } 
    } 
}