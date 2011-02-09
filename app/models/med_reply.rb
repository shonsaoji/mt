class MedReply < ActiveRecord::Base
	belongs_to :user
	belongs_to :med_post
end
