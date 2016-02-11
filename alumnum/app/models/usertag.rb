class Usertag < ActiveRecord::Base
  belongs_to :alum
  belongs_to :employer
  belongs_to :tag
end
