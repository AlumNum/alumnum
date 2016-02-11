class Qna < ActiveRecord::Base
  belongs_to :alum, foreign_key: "user_id"
  belongs_to :question
end
