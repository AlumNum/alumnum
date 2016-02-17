class Alum < User

has_one :profile 
has_many :resume_items, foreign_key: "user_id"
has_many :qnas
# JC 
# has_many :usertags, foreign_key: "user_id"


end