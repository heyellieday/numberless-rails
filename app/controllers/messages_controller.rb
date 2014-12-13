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

	def index
	  	params.permit(:callback)
	  	if params[:callback]
	  		respond_to do |format|
	  			#format.html { render json: {stories: Story.all}}
		  		format.js { render json: {messages: Message.paginate(page: params[:pagination], :per_page => 50)}, :callback => params[:callback] }
		  	end
	  	else
	  		render json: {messages: Message.all}
	  	end
	end

end
