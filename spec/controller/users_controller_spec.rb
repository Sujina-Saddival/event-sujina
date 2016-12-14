
require 'spec_helper'

# let!(:message4) {FactoryGirl.create(:message, body: "Is this birthday correct? If yes reply with 'Y' or re-send the date of birth in the form of MMDDYY.", program_id: program1.id, message_key: "confirm_dob", message_type: "Question")}
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
						user=post '/user',user_params
          	response_body = JSON.parse(response.body)
						expect(response_body["status"]).to eq(201)
						#  current_user = response_body["data"]
      # expect(response.status).to eq 200
      # expect(current_user["Firstname"]).to eq user.firstname
      # expect(current_user["email"]).to eq user.email
      # expect(current_user["first_name"]).to eq user.first_name
      # expect(current_user["last_name"]).to eq user.last_name
      # expect(current_user["id"]).to eq user.id
      # expect(current_user["phone_number"]).to eq user.phone_number
						binding.pry
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

# describe "Fetching the current user" do
#   context "with valid auth token" do
#     it "returns the current user" do
#       user = create(:user)
#       auth_header = { "Auth-Token" => user.auth_token }

#       get v1_current_user_url, {}, auth_header

#       current_user = response_body["user"]
#       expect(response.status).to eq 200
#       expect(current_user["auth_token"]).to eq user.auth_token
#       expect(current_user["email"]).to eq user.email
#       expect(current_user["first_name"]).to eq user.first_name
#       expect(current_user["last_name"]).to eq user.last_name
#       expect(current_user["id"]).to eq user.id
#       expect(current_user["phone_number"]).to eq user.phone_number
#     end
#   end

#   def response_body
#     JSON.parse(response.body)
#   end
# end