
require 'spec_helper'

RSpec.describe "UsersController", :type => :request do
	user_params = 
	{
		user:
		{
			"firstname"=>"Arpitha",
			"lastname"=>"Mahesh",
			"username"=>"Arpitha",
			"email"=>"arpitha@gmail.com",
			"phone"=>"1234567890",
			"password"=>"arpitha",
			"password_confrimation"=>"arpitha"
		}
	}

	invalid_user_params={
		user:
		{
			"email"=>"arpitha@gmail.com"
		}

	}
	describe "signup" do
		it "should create a user with valid input" do
			post '/user',user_params
          	response_body = JSON.parse(response.body)
			expect(response_body["status"]).to eq(201)
          	expect(response_body["user"]).to include_json(
          	username: "Arpitha",
            email: "arpitha@gamil.com"
            )
          end

    it "should not create a user with invalid parameters" do
         post '/user', invalid_user_params
         response_body = JSON.parse(response.body)
         expect(response_body["status"]).to eq(422)
     	 expect(response_body["error"]).to include("Firstname can't be blank")
        end
    end

end

