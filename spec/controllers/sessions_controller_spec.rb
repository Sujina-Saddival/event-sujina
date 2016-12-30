require 'rails_helper'

RSpec.describe "SessionsController", :type => :request do
  
  let!(:user) { FactoryGirl.create(:user) }

  describe 'Session create' do
  	it "sholud login successfully with valid credentials" do
  		user_credentials = {email: user.email,password: user.password}
  		post '/user/login_form', user_credentials
    	binding.pry
  		response_body = JSON.parse(response.body)
      binding.pry
  		expect(response_body["status"]).to eq(200)
  		expect(response_body["msg"]).to eq("Login successfully")
  	end

    it "Should not login with invalid credentials" do
      user_invalid_credentials = {email: user.email,password: "1234adsd"}
      post 'user/login_form', user_invalid_credentials
      binding.pry
      response_body = JSON.parse(response.body)
      expect(response_body["status"]).to eq(422)
      expect(response_body["error"]).to eq()
    end

  end

end