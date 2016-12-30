class UsersController < ApplicationController
	include UsersHelper
		def create
      @user = User.new(user_params)
      @user.image = params[:user][:images]
		  if (params[:user][:age] == "")
         @user.age = params[:age]
      else
        @user.age = params[:user][:age]
      end
        @user.save
      
      if @user.save
  			UserMailer.registration_confrimation(@user).deliver_now
      redirect_to user_new_path, :flash => { :success => "Mail has been sent to respective Email ID.Please follow the instrations as given." }
    		# redirect_to login_form_path, :flash => { :success => "Signed up" }
        
        # TDD
        # render json:{user:@user,status: 200}
  		else
       render "new"

       # TDD
        	# render json: {error: @user.errors.full_messages.first,status: 422, success: false, message: "Unsuccessfull in creating a user!"}
  		end
	end
	private

  	def user_params
   	 params.require(:user).permit(:firstname,:lastname,:username,:phone,:email,:password,:password_confirmation)
  	end
end
