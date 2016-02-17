class Alum < User

has_one :profile 
has_many :resume_items, foreign_key: "user_id"
has_many :qnas
has_many :usertags



end