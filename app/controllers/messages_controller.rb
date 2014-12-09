require 'twilio-ruby'
class MessagesController < ApplicationController
	include Webhookable

	after_filter :set_header

   	skip_before_action :verify_authenticity_token

	def create

		#Message.create(from: params[:From], body: params[:Body])

		message = "Thanks for the message! I've decided to go Numberless, so please contact me at heyellieday@gmail.com. Go to http://numberless.io for info :)"

	   	twiml = Twilio::TwiML::Response.new do |r|
	       r.Message message
	   	end

	    respond_to do |format|
	    	format.xml {render xml: twiml.text}
	   	end
	end

end
