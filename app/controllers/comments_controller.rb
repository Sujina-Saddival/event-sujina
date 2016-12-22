class CommentsController < ApplicationController
	


	def create
		@comment=Comment.new(comment_params)
		@comment.user_id = current_user.id
		@comment.event_id = params[:event_id]
	
		@comment.save
		redirect_to event_show_path

	end

	def index
		@comments =  Comment.all
		# @event = Event.find(params[:event_id])
	end

	private
	def comment_params
   		params.require(:comment).permit(:title,:description)
	end
end
