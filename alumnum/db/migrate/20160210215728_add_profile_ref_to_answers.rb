class AddProfileRefToAnswers < ActiveRecord::Migration
  def change
    add_reference :answers, :profile, index: true, foreign_key: true
  end
end
