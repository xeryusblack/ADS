class TryoutMember < ActiveRecord::Base
	belongs_to :varsity_member
	belongs_to :tryout_intent

	POSITION = ["Contingent Debater", "Contingent Adjudicator", "Non-contingent"]
	validates :debater_position,  length: { maximum: 23 }, inclusion: { in: POSITION }

	# def check_debt_status

	#     	vm = VarsityMember.find(self.varsity_member_id)
 #        	if vm.total_debt != 0
 #        		errors.add(:varsity_member, "Varsity Member still has debt!")
 #        	end
 #    end

   	def to_s
	  	self.varsity_member.first_name + " " + self.varsity_member.last_name
	  end

end
