class UserMailer < ApplicationMailer
	def registration_confrimation(user)
		@user = user
		 mail to: @user.email, subject: 'Registration Confrimation'
	end
end
