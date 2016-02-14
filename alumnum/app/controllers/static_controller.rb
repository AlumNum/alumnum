class StaticController < ApplicationController
attr_accessor :id

def index
	@user = User.page(params[:page]).per(15)
	@employer_limit_items = Usertag.page(params[:page]).per(15)
end





end
