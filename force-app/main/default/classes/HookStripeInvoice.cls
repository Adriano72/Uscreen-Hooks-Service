@RestResource(urlMapping='/hook_stripe_invoice')
global class HookStripeInvoice {
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
        String uScreenUSerId = '';
        JSONParser parser = JSON.createParser(bB.toString());

        UscreenHookStripeInvoice StripeInvoiceObjClass = UscreenHookStripeInvoice.parse(bB.toString());
        messaggio = bB.toString();
        evento_ricevuto = 'Stripe Invoice Created';                         
        userEmail = StripeInvoiceObjClass.Object_Z.customer_email;
        userLastName = StripeInvoiceObjClass.Object_Z.customer_name;
        uScreenUSerId = StripeInvoiceObjClass.Object_Z.Metadata.uscreen_user_id;
               
        Contact newUser = new Contact(LastName = userLastName, Email = userEmail);

        upsert newUser Contact.fields.Email;
        

        WCCM_Subscription__c newSubscription = new WCCM_Subscription__c(Name = evento_ricevuto, Notes__c = messaggio, Uscreen_UserID__c = uScreenUSerId,  Subscriber__c = newUser.ID);

        insert newSubscription;

    }
}

