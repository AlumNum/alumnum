class Profile < ActiveRecord::Base
	belongs_to :alum, foreign_key: "user_id"
	# has_many :questions
	has_many :answers #, through: :questions

	has_attached_file :image, styles: { large: "600x600>" , medium: "300x300>", thumb: "150x150#" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
