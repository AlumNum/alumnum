class CreateResumeItems < ActiveRecord::Migration
  def change
    create_table :resume_items do |t|
      t.string :title
      t.string :heading
      t.string :start_date
      t.string :end_date
      t.text :description
      t.string :kind

      t.timestamps null: false
    end
  end
end
