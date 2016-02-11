class CreateUsertags < ActiveRecord::Migration
  def change
    create_table :usertags do |t|
      t.references :user, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
