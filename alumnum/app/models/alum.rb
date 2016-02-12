class Alum < User

has_one :profile 
has_many :resume_items
has_many :qnas
has_many :usertags



end