class ResumeItem < ActiveRecord::Base
	belongs_to :alum, foreign_key: "user_id"
end
