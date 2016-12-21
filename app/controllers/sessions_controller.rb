class SessionsController < ApplicationController
  def new
  
  end
  # def create
  #     # binding.pry
  #   user = User.authenticate(params[:email], params[:password])
  #   if user
  #   	session[:user_id] = user.id
  #   	redirect_to event_new_path(user), :notice => "Logged in!"
  # 	else
  #  	 	flash.now.alert = "Invalid email or password"
  #   	render "new"
  # 	end
  #  end
 def create   
      
  if params[:provider] == "twitter"
    auth = request.env["omniauth.auth"]               
    user = auth.find_by_provider_and_uid(auth["provider"],
    auth["uid"]) || User.create_with_omniauth(auth)                  
  else
    user = User.authenticate(params[:email], params[:password])
  end
  if user 
           
    
    session[:user_id] = user.id         
    redirect_to event_new_path(user)              
    flash[:alert] = "you are successfully logged in "             
  else                    
    flash.now.alert = "Invalid email or password"              
    redirect_to root_path            
   end  
end

end
