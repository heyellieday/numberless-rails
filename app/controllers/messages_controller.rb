require 'twilio-ruby'
class MessagesController < ApplicationController

   	skip_before_action :verify_authenticity_token

	def create

		Message.create(from: params[:From], body: params[:Body])

		message = "Hi, it's Ellie. I've decided to go Numberless (gonumberless.com). Please visit heyellieday.com to get in touch!"

	   	twiml = Twilio::TwiML::Response.new do |r|
	       r.Message message
	   	end
	    render xml: twiml.text
	end

end
