class AddDefaultValueToSavedSearches < ActiveRecord::Migration
 def change
  	change_column_default :saved_searches, :count, 1
  end
end
