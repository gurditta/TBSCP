public class quickEmailController{
    
    ApexPages.StandardSetController setCon;
    
    public quickEmailController(ApexPages.StandardSetController controller)
    {
        setCon = controller;
    }

    public pageReference doSomething()
    {
        // do something with the selected records
        for ( Account acc : (Account[])setCon.getSelected() )
        {
                System.debug('Account name = ' + acc.Name);
        }
        return null;
    }
}