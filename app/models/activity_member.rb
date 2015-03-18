class ActivityMember < ActiveRecord::Base
	belongs_to :varsity_member
	belongs_to :acquired_quota_point
	belongs_to :competition
	
	validates :varsity_member_id, presence: :true
	validate :cannot_be_negative

	#accepts_nested_attributes_for :varsity_members

	before_validation :load_default

	 def load_default
   		if self.new_record?
   			self.amount = 0.00
      	end
   end

	def reply(object)
		if object == false
			return "No"
		else
			return "Yes"
		end
	end

end
