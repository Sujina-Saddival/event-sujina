class UsersController < ApplicationController
	include UsersHelper
		def create
		
  		@user = User.new(user_params)
  		if @user.save
  			binding.pry
  			UserMailer.registration_confrimation(@user).deliver_now
  			redirect_to login_form_path

  			# render :json => @user
  			# render json:{data:@user}
    		# redirect_to login_form_path, :flash => { :success => "Signed up" }
  		else
        	# render json: {error: @user.errors.full_messages.first,status: 422, success: false, message: "Unsuccessfull in creating a user!"}
			 render "new"
  		end
	end
	private

  	def user_params
   	 params.require(:user).permit(:firstname,:lastname,:username,:phone,:email,:password,:password_confirmation)
  	end
end
