class StaticController < ApplicationController

def index
	@user = User.all
	binding.pry
end


end
