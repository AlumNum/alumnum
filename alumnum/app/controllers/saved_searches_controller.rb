class SavedSearchesController < ApplicationController

	def search #get#search
		@found = SavedSearch.find_by(:query => params[:q])
		if @found
			@found.count +=1
			@found.save
		else
			@saved_search = SavedSearch.new(query: params[:q])
			@saved_search.save
		end
		

		@history = SavedSearch.all
	end

end
