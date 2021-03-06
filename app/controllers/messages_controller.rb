require 'twilio-ruby'
class MessagesController < ApplicationController

   	skip_before_action :verify_authenticity_token

	def create
		params[:To][0] = ""
		to_number = params[:To]
		@recipient_number = Number.find_or_create_by(number: to_number)

		params[:From][0] = ""
		from_number = params[:From]
		@sender_number = Number.find_or_create_by(number: from_number)
		print  @sender_number.inspect

		if Conversation.between(@sender_number.id, @recipient_number.id).present?
	      @conversation = Conversation.between(@sender_number.id, @recipient_number.id).first
	    else
	      @conversation = Conversation.create!(sender_id: @sender_number.id, recipient_id: @recipient_number.id)
	    end

		@conversation.messages.create(number_id: @sender_number.id, body: params[:Body], conversation_id: @conversation.id)

		message = "Hi, it's Ellie. I've decided to go Numberless (gonumberless.com). Please visit heyellieday.com to get in touch!"
		@conversation.messages.create(number_id: @recipient_number.id, body: message, conversation_id: @conversation.id)
		

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

	private
	def conversation_params
	  params.permit(:sender_id, :recipient_id)
	end

end
