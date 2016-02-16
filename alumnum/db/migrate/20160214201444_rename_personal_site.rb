class RenamePersonalSite < ActiveRecord::Migration
  def change
  rename_column :profiles, :peronal_site, :personal_site
  end
end
