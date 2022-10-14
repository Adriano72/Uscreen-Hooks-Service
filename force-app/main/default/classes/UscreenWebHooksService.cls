@RestResource(urlMapping='/uscreenhook')
global class UscreenWebHooksService {
    @HttpPost
    global static void doGet() {
        
        RestRequest request = RestContext.request;
        RestResponse response = RestContext.response;

        Blob bB = request.requestBody;
        String evento = '';
        String messaggio = '';
        String evento_ricevuto = '';
        String userEmail = '';
        String userLastName = '';
        JSONParser parser = JSON.createParser(bB.toString());

        while (parser.nextToken() != null) {
            if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
                    if(parser.getText() == 'event') {
                        parser.nextValue();
                        evento = parser.getText();
                    }
                    switch on evento {
                        when 'user_signed_in'{
                            UscreenHookSignIn UserSignInObjClass = UscreenHookSignIn.parse(bB.toString());
                            messaggio = bB.toString();
                            evento_ricevuto = 'user_signed_in';
                            userEmail = UserSignInObjClass.email;
                            userLastName = UserSignInObjClass.name;
                        }
                        when 'video_play'{
                            UscreenHookVideoPlay VideoPlayedObjClass = UscreenHookVideoPlay.parse(bB.toString());
                            messaggio = bB.toString();
                            evento_ricevuto = 'video_play';
                            userEmail = VideoPlayedObjClass.email;
                            userLastName = VideoPlayedObjClass.name;
                        }
                        when 'user_created'{
                            UscreenHookUserCreated UserCreatedObjClass = UscreenHookUserCreated.parse(bB.toString());
                            messaggio = bB.toString();
                            evento_ricevuto = 'user_created';                         
                            userEmail = UserCreatedObjClass.email;
                            userLastName = UserCreatedObjClass.name;

                            //Contact newUser = new Contact(LastName=UserCreatedObjClass.name, Email=userEmail);

                            //upsert newUser Contact.fields.Email;

                        }
                        when 'user_updated'{
                            UscreenHookUserUpdated UserUpdatedObjClass = UscreenHookUserUpdated.parse(bB.toString());
                            messaggio = bB.toString();
                            evento_ricevuto = 'user_updated';
                            userEmail = UserUpdatedObjClass.changes.email;
                            userLastName = UserUpdatedObjClass.changes.name;
                        }
                        when 'ownership_created'{ // Should be triggered by Assigned Offer hook but has a different event_name...
                            UscreenHookAssignedOffer AssignedOfferObjClass = UscreenHookAssignedOffer.parse(bB.toString());
                            messaggio = bB.toString();
                            evento_ricevuto = 'ownership_created';
                            userEmail = AssignedOfferObjClass.email;
                            userLastName = AssignedOfferObjClass.name;
                        }
                        when 'success_recurring'{ 
                            UscreenHookSuccessRecurring SuccessRecurringObjClass = UscreenHookSuccessRecurring.parse(bB.toString());
                            messaggio = bB.toString();
                            evento_ricevuto = 'success_recurring';
                            userEmail = SuccessRecurringObjClass.email;
                            userLastName = SuccessRecurringObjClass.name;
                        }
                        when 'subscription_canceled'{ 
                            UscreenHookSubscriptionCanceled SubscriptionCanceledObjClass = UscreenHookSubscriptionCanceled.parse(bB.toString());
                            messaggio = bB.toString();
                            evento_ricevuto = 'subscription_canceled';
                            userEmail = SubscriptionCanceledObjClass.email;
                            userLastName = SubscriptionCanceledObjClass.name;
                        }
                        when 'subscription_assigned'{
                            UscreenHookSubscriptionAssigned SubscriptionAssignedObjClass = UscreenHookSubscriptionAssigned.parse(bB.toString());
                            messaggio = bB.toString();
                            evento_ricevuto = 'subscription_assigned';
                            userEmail = SubscriptionAssignedObjClass.user_email;
                            userLastName = SubscriptionAssignedObjClass.user_name;
                        }
                        when 'order_paid'{
                            UscreenHookOrderPaid OrderPaidObjClass = UscreenHookOrderPaid.parse(bB.toString());
                            messaggio = bB.toString();
                            evento_ricevuto = 'order_paid';
                            userEmail = OrderPaidObjClass.customer_email;
                            userLastName = OrderPaidObjClass.customer_name;
                        }
                        when else {
                            evento_ricevuto = evento;
                            messaggio = 'Event not yet managed ' + bB.toString();
                            userEmail = 'adrianomassi@gmail.com';
                            userLastName = 'Massi';
                        }
                    }                    
            }
        }
        /*
        Contact queriedContact = [SELECT Contact.Description 
                            FROM Contact 
                            WHERE Email =: userEmail
                            LIMIT 1];
        */

        
        Contact newUser = new Contact(LastName = userLastName, Email = userEmail);

        upsert newUser Contact.fields.Email;
        

        WCCM_Subscription__c newSubscription = new WCCM_Subscription__c(Name = evento_ricevuto, Notes__c = messaggio, Subscriber__c = newUser.ID);

        insert newSubscription;

        response.statusCode = 200;
        response.responseBody = Blob.valueOf(JSON.serialize(new SFDCResponse('Success', 'Processed Succesfully')));

        
        
        //queriedContact.Description = messaggio;


        
        /*if(evento != 'user_updated' && evento != 'subscription_assigned') update queriedContact;*/
        
        
        /*RestResponse request = RestContext.response;
        Blob dB = request.responseBody;
        return 'Risposta:'+ dB.toString();*/
    }

    public class SFDCResponse {
        String response;
        String message;
        public SFDCResponse(String resp, String msg) {
            response = resp;
            message = msg;
        }
    }
}
