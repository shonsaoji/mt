class MedPost < ActiveRecord::Base
	belongs_to :med_post_category
	belongs_to :user
	has_many :med_replies
end
