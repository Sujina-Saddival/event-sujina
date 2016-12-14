class UsersController < ApplicationController
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
	
	def create
		
  		@user = User.new(user_params)
  		if @user.save
  			binding.pry
        		render json: {data: @user,status: 201, success: true, message: "User created Successfully!"}

  			# render :json => @user
  			# render json:{data:@user}
    		# redirect_to login_form_path, :flash => { :success => "Signed up" }
  		else
        	render json: {error: @user.errors.full_messages.first,status: 422, success: false, message: "Unsuccessfull in creating a user!"}

    		# render "new"
  		end
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
	private

  	def user_params
   	 params.require(:user).permit(:firstname,:lastname,:username,:phone,:email,:password,:password_confirmation)
  	end
end
