	module UsersHelper
	def main_form
		
	end
	def new
		@user=User.new
		@users=User.all
		@events=Event.all
		
		# render :json => @users
	end
	def show
		@user=User.find_by_id(params[:user_id])
		
	end
	

	def edit
		# binding.pry
		@user=User.find_by_id(params[:user_id])
	end

	def update
		# binding.pry
		@user = User.find_by_id(params[:user_id])
		@user.update_attributes(user_params)
		redirect_to event_new_path, :flash => { :success => "Updated" }
	end
end
