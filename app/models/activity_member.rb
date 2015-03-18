class ActivityMember < ActiveRecord::Base
	belongs_to :varsity_member
	belongs_to :acquired_quota_point
	belongs_to :competition
	
	validates :varsity_member_id, presence: :true
	validate :cannot_be_negative

	#accepts_nested_attributes_for :varsity_members

	# before_validation :load_default

	#  def load_default
 #   		if self.new_record?
 #   		#aqp = AcquiredQuotaPoint.find(self.acquired_quota_point_id)
 #        #ta = TrainingActivity.find(aqp.training_activity_id)
 #        	if self.training_activity.name != "Debate Round"
 #        		self.judge = false
 #        		self.article = false
 #        	end
 #      	end
 #   end
	def cannot_be_negative
		# if !self.round.nil?
	 # 		if self.round <= 0
	 #      		errors.add(:round, "Number of rounds must not be negative or zero!")
	 #    	end
	 #    end
	end

end
