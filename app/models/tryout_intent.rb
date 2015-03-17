class TryoutIntent < ActiveRecord::Base
	validates :date, presence: true
	validates :debater_position, presence: true
	belongs_to :varsity_member

	POSITION = ["Contingent Debater", "Contingent Adjudicator", "Non-contingent"]

	validate :check_debt_status

	def check_debt_status

	    	vm = VarsityMember.find(self.varsity_member_id)
        	if vm.total_debt != 0
        		errors.add(:varsity_member, "Varsity Member still has debt!")
        	end
    end

   	after_create :gather_members

	def gather_members
		result = []

      	self.varsity_members.each do |member|
      		result.push(member)
        end
	end

	def tryoutMembers
		return result
	end
end
