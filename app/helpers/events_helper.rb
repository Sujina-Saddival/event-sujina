module EventsHelper
	def new
		@event=Event.new
		@users=User.all
		# @events=Event.paginate(:page => params[:page], per_page: 2)
		@events=Event.all
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
	def show
		@event = Event.find_by_id(params[:event_id])
		@comments=Comment.all
		
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

	

end
