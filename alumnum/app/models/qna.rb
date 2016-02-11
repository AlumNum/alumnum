class Qna < ActiveRecord::Base
  belongs_to :alum
  belongs_to :question
end
