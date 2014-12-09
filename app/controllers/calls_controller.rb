require 'twilio-ruby'
class CallsController < ApplicationController

   	skip_before_action :verify_authenticity_token


	def create
		message = "Hi, this is Ellie's voicemail. She has decided to go Numberless. Please visit heyellieday dot com to get in touch with her."

		twiml = Twilio::TwiML::Response.new do |r|
        	r.Say message
     	end
	    render xml: twiml.text
	end

end