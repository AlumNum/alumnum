class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :headline
      t.string :image_url
      t.text :bio
      t.integer :view_count
      t.string :status
      t.string :twitter
      t.string :github
      t.string :peronal_site
      t.string :linkedin

      t.timestamps null: false
    end
  end
end
