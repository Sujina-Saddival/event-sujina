require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user) {FactoryGirl.build(:user)}

	describe "email" do
			it "should accept valid email address while sign up" do
				valid_emails = %w[user@gmail.com User123@ymail.io user_regime7@qwinix.io]
				valid_emails.each do |valid_email|
				user.email = valid_email
				expect(user).to be_valid
			end
		end

			it "should not accept invalid email address while sign up" do
				invalid_emails = %w[user@gmail,com User123ymail.io user_regime7@qwinixio]
				invalid_emails.each do |invalid_email|
				user.email = invalid_email
				expect(user).to be_invalid
			end
		end
	end


	describe "password" do
			it "should accept minimum of 6 charecters"  do 
				valid_passwords = %w[123example !@#example1]
				valid_passwords.each do |valid_password| 
				user.password = valid_password
				expect(user).to be_valid
			end
		end

		it "should reject short passwords on create"  do 
				invalid_passwords = %w[123 exam]
				invalid_passwords.each do |invalid_password| 
				user.password = invalid_password
				expect(user).to be_invalid
			end
		end

		it "should require a matching password confirmation on create" do
      			user.password = "matched123"
      			user.password_confirmation = "unmatched123"
      			expect(user).to be_invalid
		end

		it "should require a matching password confirmation on create" do
    	  		user.password = "matched123"
      			user.password_confirmation = "matched123"
      			expect(user).to be_valid
		end
	end

	describe "firstname" do
		it "should accpet valid firstname" do
				valid_names = %w[Arpitha Harshitha Example123]
				valid_names.each do |valid_name|
				user.firstname = valid_name
				expect(user).to be_valid
			end
		end
		it "should not accpet invalid firstname" do
				invalid_names = nil
				user.firstname = invalid_names
				expect(user).to be_invalid
			end
	end


	describe "lastname" do
		it "should accpet valid lastname" do
				valid_names = %w[Mahesh Harshitha Example123]
				valid_names.each do |valid_name|
				user.lastname = valid_name
				expect(user).to be_valid
			end
		end
		it "should not accpet invalid lastname" do
				invalid_names = nil
				user.lastname = invalid_names
				expect(user).to be_invalid
			end
	end


	describe "username" do
		it "should accpet valid username" do
				valid_names = %w[Arpitha Harshitha Example123]
				valid_names.each do |valid_name|
				user.firstname = valid_name
				expect(user).to be_valid
			end
		end
		it "should not accpet invalid username" do
				invalid_names = nil
				user.firstname = invalid_names
				expect(user).to be_invalid
			end
	end

	describe "phone" do
		it "should accpet valid phone number on create" do
				valid_phone = "1234567890"
				user.phone = valid_phone
				expect(user).to be_valid
		end

		it "should not accpet invalid phone number on create" do
				invalid_phone = nil
				user.phone = invalid_phone
				expect(user).to be_invalid
		end
	end
end
