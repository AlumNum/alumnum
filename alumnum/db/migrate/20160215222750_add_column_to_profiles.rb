class AddColumnToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :attachment, :string
  end
end
