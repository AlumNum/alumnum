class StaticController < ApplicationController
attr_accessor :id

def index
	@user = User.page(params[:page]).per(15)
	#@profiles = Profile.all
	
	#@profile = Profile.find(user_id=params[:id])
end

# def get_profile(user)
# 	Profile.find(user_id=user)
# end 




end
