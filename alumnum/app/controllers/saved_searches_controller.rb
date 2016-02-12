class SavedSearchesController < ApplicationController

	def search #get#search
		@saved_search = SavedSearch.new(query: params[:q])
		@saved_search.save

		@history = SavedSearch.all
	end

end
