class SavedSearchesController < ApplicationController

	def search #get#search
		if params[:q]== ""
			query = "blank"
		else
			query = params[:q].downcase
		end
		
		@found = SavedSearch.find_by(:query => query)
		@tag = Tag.find_by :skill_tag => query
		@users_with_tag = Usertag.joins(:alum).where(:tag => @tag)
		@last_name_results = Alum.find_by :last_name => params[:q].capitalize
		@first_name_results = Alum.find_by :first_name => params[:q].capitalize

		if @users_with_tag == nil
			@no_results = true
		end
	
		if @found
			@found.count +=1
			@found.save
			
		else
			@saved_search = SavedSearch.new(query: query)
			@saved_search.save
		end
		

		@history = SavedSearch.order(count: :desc).limit(10)
	end

	def history
		@history = SavedSearch.order(count: :desc)
	end

end
