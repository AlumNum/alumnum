class StaticController < ApplicationController

def index
	@user = User.all

end


end
