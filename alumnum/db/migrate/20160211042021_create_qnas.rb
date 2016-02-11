class CreateQnas < ActiveRecord::Migration
  def change
    create_table :qnas do |t|
      t.references :user, index: true, foreign_key: true
      t.references :question, index: true, foreign_key: true
      t.text :response

      t.timestamps null: false
    end
  end
end
