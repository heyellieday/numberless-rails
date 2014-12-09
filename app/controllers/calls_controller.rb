require 'twilio-ruby'
class CallsController < ApplicationController

   	skip_before_action :verify_authenticity_token


	def create
		response = Twilio::TwiML::Response.new do |r|
        	r.Say "Hi, this is Ellie's voicemail. She has decided to go Numberless. Please visit heyellieday dot com to get in touch with her."
     	end
     	response.headers["Content-Type"] = "text/xml"
     	render text: response.text

	end

end