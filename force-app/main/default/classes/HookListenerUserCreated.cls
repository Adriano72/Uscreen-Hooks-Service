@RestResource(urlMapping='/hook_user_created')
global class HookListenerUserCreated {
    @HttpPost
    global static void doGet() {
        
        RestRequest request = REstContext.request;
        RestResponse response = REstCOntext.response;

        Blob bB = request.requestBody;
        String evento = '';
        String messaggio = '';
        String evento_ricevuto = '';
        String userEmail = '';
        String userLastName = '';
        Integer uScreenUSerId;
        JSONParser parser = JSON.createParser(bB.toString());

        UscreenHookUserCreated UserCreatedObjClass = UscreenHookUserCreated.parse(bB.toString());
        messaggio = bB.toString();
        evento_ricevuto = 'user_created';                         
        userEmail = UserCreatedObjClass.email;
        userLastName = UserCreatedObjClass.name;
        uScreenUSerId = UserCreatedObjClass.id;
               
        Contact newUser = new Contact(LastName = userLastName, Email = userEmail);

        upsert newUser Contact.fields.Email;
        

        WCCM_Subscription__c newSubscription = new WCCM_Subscription__c(Name = evento_ricevuto, Notes__c = messaggio, Uscreen_UserID__c = String.valueOf(uScreenUSerId),  Subscriber__c = newUser.ID);

        insert newSubscription;

    }
}


