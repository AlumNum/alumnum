class StaticController < ApplicationController
attr_accessor :id

def find_by_user
    user_id = params[:id]
    @profile = Profile.find_by :user_id => user_id
end

def index
	@user = User.all
	@searches = SavedSearch.order(count: :desc).limit(5)
	@user_admin = Alum.page(params[:page]).per(15)
	@employer_limit_items = Alum.page(params[:page]).per(15)

	#@profile = Profile.find_by :user_id => params[:id]

end

end
