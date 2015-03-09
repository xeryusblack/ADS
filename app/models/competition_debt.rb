class CompetitionDebt < ActiveRecord::Base
	belongs_to :competition
	belongs_to :varsity_member

	validates :debt_amount, length: { maximum: 3 }, numericality: true
	validates :source_of_debt, presence: true

	validate :cannot_be_negative

	def cannot_be_negative
	 	if self.debt_amount <= 0
	      errors.add(:debt_amount, "Quantity must not be negative or zero!")
	    end
	end

	after_create :update_varisty_member_competiton_debt

	def update_varisty_member_competiton_debt

    	sum = 0
    	vm = VarsityMember.find(self.varsity_member_id)

       	sum = vm.total_debt + self.debt_amount
    
      	user.update(:total_debt => sum)
	end
end
