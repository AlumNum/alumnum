class AddUserRefToResumeItems < ActiveRecord::Migration
  def change
    add_reference :resume_items, :user, index: true, foreign_key: true
  end
end
