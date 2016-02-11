class Usertag < ActiveRecord::Base
  belongs_to :user
  belongs_to :employer
  belongs_to :tag


end
