class UsersController < ApplicationController
	include UsersHelper
		def create
		
  		@user = User.new(user_params)
      @user.image = params[:user][:images]

      @user.save!
   
      
      if @user.save
  			UserMailer.registration_confrimation(@user).deliver_now
      redirect_to user_new_path, :flash => { :success => "Mail has been sent to respective Email ID.Please follow the instrations as given." }
  			

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
