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
	def show_user
		
		@user=User.find_by_id(params[:user_id])
		
	end
	def index
		@users = User.all
	end

	def change_password
		current_user

	end

	def password_update
		@old_password = params[:user][:password]
		@new_password = params[:user][:password_new]
		old_password_hash = BCrypt::Engine.hash_secret(@old_password, current_user.password_salt)
		new_password_hash = BCrypt::Engine.hash_secret(@new_password, current_user.password_salt)
		if old_password_hash == current_user.password_hash
			user.update_attribute(:password, new_password_hash)
		else
			redirect_to change_password_path, :flash => { :success => "Invalid old password" }
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
end
