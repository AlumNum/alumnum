class AddColumnToSavedSearches < ActiveRecord::Migration
  def change
    add_column :saved_searches, :count, :integer
  end
end
