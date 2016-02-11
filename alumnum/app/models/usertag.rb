class Usertag < ActiveRecord::Base
  belongs_to :alum, foreign_key: "user_id"
  belongs_to :employer, foreign_key: "user_id"
  belongs_to :tag


end
