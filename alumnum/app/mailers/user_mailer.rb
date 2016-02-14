class UserMailer < ApplicationMailer
	default from: 'alum.num.notice@example.com'
	# default from: "alum.num.notice@gmail.com"

	# def subscribe_alert(user)
	# 	@user = user
	# 	mail(:to => user.email, :subject => "Users you are interested in")
	# end

	def welcome_email(user)
		@user = user
		@url = 'http://example.com/login'
		mail(:to => @user.email, :subject => 'Welcome to Alumnum, new user')
	end

end
