require 'twilio-ruby'
class CallsController < ApplicationController

   	skip_before_action :verify_authenticity_token

	def create
		response = Twilio::TwiML::Response.new do |r|
        	r.Play "Hi, this is Ellie's voicemail. She has decided to go Numberless. Please visit heyellieday dot com to get in touch with her."
     	end

     	render_twiml response

	end

end