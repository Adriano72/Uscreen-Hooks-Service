@RestResource(urlMapping='/uscreenhook')
global class UscreenWebHooksService {
    @HttpPost
    global static void doGet() {

        RestRequest request = REstContext.request;
        RestResponse response = REstCOntext.response;

        Blob bB = request.requestBody;
        String evento = '';
        String messaggio = '';
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
                            messaggio = 'User just logged in! '+ bB.toString();
                        }
                        when 'video_play'{
                            UscreenHookVideoPlay VideoPlayedObjClass = UscreenHookVideoPlay.parse(bB.toString());
                            messaggio = 'New Video has been played! ' + bB.toString();
                        }
                        when 'user_created'{
                            UscreenHookUserCreated UserCreatedObjClass = UscreenHookUserCreated.parse(bB.toString());
                            messaggio = 'New user has been created! ' + bB.toString();
                        }
                        when 'subscription_assigned'{
                            UscreenHookSubscriptionAssigned SubscriptionAssignedObjClass = UscreenHookSubscriptionAssigned.parse(bB.toString());
                            messaggio = 'New subscription has been assigned! ' + bB.toString();
                        }
                        when 'order_paid'{
                            UscreenHookOrderPaid OrderPaidObjClass = UscreenHookOrderPaid.parse(bB.toString());
                            messaggio = 'New order has been paid! ' + bB.toString();
                        }
                        when else {
                            messaggio = 'Event not yet managed ' + bB.toString();
                        }
                    }                    
            }
        }
        
        Contact queriedContact = [SELECT Contact.Description 
                            FROM Contact 
                            WHERE Email = 'adrianomassi@gmail.com'
                            LIMIT 1];
        // Update the contact's phone number
        queriedContact.Description = messaggio;
        
        update queriedContact;
        
        
        /*RestResponse request = RestContext.response;
        Blob dB = request.responseBody;
        return 'Risposta:'+ dB.toString();*/
    }
}
