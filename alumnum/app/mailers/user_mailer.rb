class UserMailer < ApplicationMailer
	default from: 'alum.num.notice@gmail.com'
	# default from: "alum.num.notice@gmail.com"

	# def subscribe_alert(user)
	# 	@user = user
	# 	mail(:to => user.email, :subject => "Users you are interested in")
	# end


	def alert_email(user_to, user_tagged)
	#user_to is the user to email, user_tagged is the alum who added a tag to their account
		@user_to = user_to
		@user_tagged = user_tagged
		url = 'http://example.com/login'
		mail(:to => @user_to.email, :subject => 'Welcome to Alumnum, new user')
	end

end
