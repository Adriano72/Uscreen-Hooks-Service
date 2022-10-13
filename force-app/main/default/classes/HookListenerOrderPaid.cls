@RestResource(urlMapping='/hook_order_paid')
global class HookListenerOrderPaid {
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
        JSONParser parser = JSON.createParser(bB.toString());

        UscreenHookOrderPaid OrderPaidObjClass = UscreenHookOrderPaid.parse(bB.toString());
        messaggio = bB.toString();
        evento_ricevuto = 'order_paid';
        userEmail = OrderPaidObjClass.customer_email;
        userLastName = OrderPaidObjClass.customer_name;
               
        Contact newUser = new Contact(LastName = userLastName, Email = userEmail);

        upsert newUser Contact.fields.Email;
        

        WCCM_Subscription__c newSubscription = new WCCM_Subscription__c(Name = evento_ricevuto, Notes__c = messaggio, Subscriber__c = newUser.ID);

        insert newSubscription;

    }
}


