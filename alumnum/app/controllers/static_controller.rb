class StaticController < ApplicationController

def index
	@user = User.all

	@searches = SavedSearch.order(count: :desc).limit(5)

end


end
