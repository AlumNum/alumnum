class AddDefaultValueToViewCount < ActiveRecord::Migration
  def change
  	change_column_default :profiles, :view_count, 0
  end
end
