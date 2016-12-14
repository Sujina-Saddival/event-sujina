class EventsController < ApplicationController
	before_filter :edit_event
	before_filter :find_user
	def new
		@event=Event.new
		@users=User.all
		@events=Event.paginate(:page => params[:page], per_page: 2)
		# binding.pry
		gon.event=@events

		# render :json => @events
		# render :json => @eusers

	end

	def create
		
		@event = Event.new(params_event)
		# binding.pry
		@event.user_id=@user.id
	

		@event.save
		params[:role_ids].each do |t|
			@invitation=Invitation.new
			@invitation.event_id=@event.id
			@invitation.invitee_id=t
			@invitation.inviter_id=params[:user_id]
			
		@invitation.save
		end
		redirect_to event_new_path
	end

	def destroy
   	  session[:user_id] = nil
  	  redirect_to root_url, :notice => "Logged out!"
   	end

	def update
   	# binding.pry
   		@event=Event.find_by_id(params[:event_id])
		
		
		params[:role_ids].each do |t|
			@invitation=Invitation.new
			
			@invitation.event_id=@event.id
			@invitation.invitee_id=t
			@invitation.inviter_id=params[:user_id]
			
			
		@invitation.save
		end
		@event.update_attributes(params_event)
		

		redirect_to event_new_path
		
	end

   def edit
   	# binding.pry
		@users=User.all
   		# @event=@event_edit
   		@event_edit = @event.id
		@inviter=@event.invitations[0].inviter_id
   		
   		@user=@user.id
   		

   end
   	def delete
		@event = Event.find_by_id(params[:event_id])
		@event.destroy
		redirect_to event_new_path
	end

	

   	private
	def params_event
		params.require(:event).permit(:event,:venue,:date,:time,:description,:invitee,:status)
	end
	def edit_event

		@event = Event.find_by_id(params[:event_id])
	end

	def find_user
		@user=User.find_by_id(params[:user_id])
	end
end

