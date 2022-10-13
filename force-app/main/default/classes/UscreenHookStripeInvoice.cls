//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//
// The supplied json has fields with names that are not valid in apex
// and so can only be parsed with explicitly generated code, this option
// was auto selected for you.

public with sharing class UscreenHookStripeInvoice {

	public class Automatic_tax {
		public Boolean enabled {get;set;} 
		public Object status {get;set;} 

		public Automatic_tax(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'enabled') {
							enabled = parser.getBooleanValue();
						} else if (text == 'status') {
							status = parser.readValueAs(Object.class);
						} else {
							System.debug(LoggingLevel.WARN, 'Automatic_tax consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
		
	public class Object_Z {
		public String id {get;set;} 
		public String object_Z {get;set;} // in json: object
		public String account_country {get;set;} 
		public String account_name {get;set;} 
		public Object account_tax_ids {get;set;} 
		public Integer amount_due {get;set;} 
		public Integer amount_paid {get;set;} 
		public Integer amount_remaining {get;set;} 
		public String application {get;set;} 
		public Integer application_fee {get;set;} 
		public Integer attempt_count {get;set;} 
		public Boolean attempted {get;set;} 
		public Boolean auto_advance {get;set;} 
		public Automatic_tax automatic_tax {get;set;} 
		public String billing {get;set;} 
		public String billing_reason {get;set;} 
		public String charge {get;set;} 
		public Boolean closed {get;set;} 
		public String collection_method {get;set;} 
		public Integer created {get;set;} 
		public String currency_Z {get;set;} // in json: currency
		public Object custom_fields {get;set;} 
		public String customer {get;set;} 
		public Object customer_address {get;set;} 
		public String customer_email {get;set;} 
		public String customer_name {get;set;} 
		public Object customer_phone {get;set;} 
		public Object customer_shipping {get;set;} 
		public String customer_tax_exempt {get;set;} 
		public List<Customer_tax_ids> customer_tax_ids {get;set;} 
		public Integer date_Z {get;set;} // in json: date
		public Object default_payment_method {get;set;} 
		public Object default_source {get;set;} 
		public List<Customer_tax_ids> default_tax_rates {get;set;} 
		public Object description {get;set;} 
		public Object discount {get;set;} 
		public List<Customer_tax_ids> discounts {get;set;} 
		public Object due_date {get;set;} 
		public Integer ending_balance {get;set;} 
		public Integer finalized_at {get;set;} 
		public Object footer {get;set;} 
		public Boolean forgiven {get;set;} 
		public Object from_invoice {get;set;} 
		public String hosted_invoice_url {get;set;} 
		public String invoice_pdf {get;set;} 
		public Object last_finalization_error {get;set;} 
		public Object latest_revision {get;set;} 
		public Lines lines {get;set;} 
		public Boolean livemode {get;set;} 
		public Metadata metadata {get;set;} 
		public Object next_payment_attempt {get;set;} 
		public String number_Z {get;set;} // in json: number
		public Object on_behalf_of {get;set;} 
		public Boolean paid {get;set;} 
		public Boolean paid_out_of_band {get;set;} 
		public String payment_intent {get;set;} 
		public Payment_settings payment_settings {get;set;} 
		public Integer period_end {get;set;} 
		public Integer period_start {get;set;} 
		public Integer post_payment_credit_notes_amount {get;set;} 
		public Integer pre_payment_credit_notes_amount {get;set;} 
		public Object quote {get;set;} 
		public String receipt_number {get;set;} 
		public Object rendering_options {get;set;} 
		public Integer starting_balance {get;set;} 
		public Object statement_descriptor {get;set;} 
		public String status {get;set;} 
		public Status_transitions status_transitions {get;set;} 
		public Object subscription {get;set;} 
		public Integer subtotal {get;set;} 
		public Integer subtotal_excluding_tax {get;set;} 
		public Object tax {get;set;} 
		public Object tax_percent {get;set;} 
		public Object test_clock {get;set;} 
		public Integer total {get;set;} 
		public List<Customer_tax_ids> total_discount_amounts {get;set;} 
		public Integer total_excluding_tax {get;set;} 
		public List<Customer_tax_ids> total_tax_amounts {get;set;} 
		public Object transfer_data {get;set;} 
		public Object webhooks_delivered_at {get;set;} 

		public Object_Z(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'id') {
							id = parser.getText();
						} else if (text == 'object') {
							object_Z = parser.getText();
						} else if (text == 'amount_paid') {
							amount_paid = parser.getIntegerValue();
						} else if (text == 'customer_email') {
							customer_email = parser.getText();
						} else if (text == 'customer_name') {
							customer_name = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Object_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	
	public class Metadata {
		public String product {get;set;} 
		public String uscreen_user_id {get;set;} 

		public Metadata(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'product') {
							product = parser.getText();
						} else if (text == 'uscreen_user_id') {
							uscreen_user_id = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Metadata consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Period {
		public Integer end_Z {get;set;} // in json: end
		public Integer start {get;set;} 

		public Period(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'end') {
							end_Z = parser.getIntegerValue();
						} else if (text == 'start') {
							start = parser.getIntegerValue();
						} else {
							System.debug(LoggingLevel.WARN, 'Period consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public Object_Z object_Z {get;set;} // in json: object

	public UscreenHookStripeInvoice(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'object') {
						object_Z = new Object_Z(parser);
					} else {
						System.debug(LoggingLevel.WARN, 'UscreenHookStripeInvoice consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	
	
	public class Customer_tax_ids {

		public Customer_tax_ids(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						{
							System.debug(LoggingLevel.WARN, 'Customer_tax_ids consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Payment_settings {
		public Object default_mandate {get;set;} 
		public Object payment_method_options {get;set;} 
		public Object payment_method_types {get;set;} 

		public Payment_settings(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'default_mandate') {
							default_mandate = parser.readValueAs(Object.class);
						} else if (text == 'payment_method_options') {
							payment_method_options = parser.readValueAs(Object.class);
						} else if (text == 'payment_method_types') {
							payment_method_types = parser.readValueAs(Object.class);
						} else {
							System.debug(LoggingLevel.WARN, 'Payment_settings consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Status_transitions {
		public Integer finalized_at {get;set;} 
		public Object marked_uncollectible_at {get;set;} 
		public Integer paid_at {get;set;} 
		public Object voided_at {get;set;} 

		public Status_transitions(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'finalized_at') {
							finalized_at = parser.getIntegerValue();
						} else if (text == 'marked_uncollectible_at') {
							marked_uncollectible_at = parser.readValueAs(Object.class);
						} else if (text == 'paid_at') {
							paid_at = parser.getIntegerValue();
						} else if (text == 'voided_at') {
							voided_at = parser.readValueAs(Object.class);
						} else {
							System.debug(LoggingLevel.WARN, 'Status_transitions consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	public class Lines {
		public String object_Z {get;set;} // in json: object
		public Boolean has_more {get;set;} 
		public Integer total_count {get;set;} 
		public String url {get;set;} 

		public Lines(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'object') {
							object_Z = parser.getText();
						} else if (text == 'has_more') {
							has_more = parser.getBooleanValue();
						} else if (text == 'total_count') {
							total_count = parser.getIntegerValue();
						} else if (text == 'url') {
							url = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Lines consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static UscreenHookStripeInvoice parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new UscreenHookStripeInvoice(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	



    
    private static List<Customer_tax_ids> arrayOfCustomer_tax_ids(System.JSONParser p) {
        List<Customer_tax_ids> res = new List<Customer_tax_ids>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Customer_tax_ids(p));
        }
        return res;
    }










}