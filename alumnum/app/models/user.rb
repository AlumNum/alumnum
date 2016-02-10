class User < ActiveRecord::Base

	has_one :profile #this will need to change once user types are implemented
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	has_many :resume_items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
