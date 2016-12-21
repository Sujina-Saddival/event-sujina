class UserMailer < ApplicationMailer
	def registration_confrimation(user)
		@user = user
		binding.pry
		 mail to: @user.email, subject: 'Registration Confrimation'
	end
end
