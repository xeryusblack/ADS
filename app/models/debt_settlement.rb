class DebtSettlement < ActiveRecord::Base
	belongs_to :varsity_member
	belongs_to :officer_in_charge

	validates :amount_paid, length: { maximum: 6 }, numericality: true
	validates :date_paid, presence: true

	validate :cannot_be_negative

	def cannot_be_negative
		if !self.amount_paid.nil?
	 		if self.amount_paid <= 0
	      		errors.add(:amount_paid, "Amount must not be negative or zero!")
	    	end

	    	vm = VarsityMember.find(self.varsity_member_id)

	    	if self.amount_paid >= vm.total_debt
	      		errors.add(:amount_paid, "Amount paid is greater than debt!")
	    	end
	    end
	end


	after_create :update_varisty_member_quota_point

	def update_varisty_member_quota_point

    	sum = 0
    	vm = VarsityMember.find(self.varsity_member_id)

       	sum = vm.total_debt - self.amount_paid
    
      	vm.update(:total_debt => sum)
	end

	def officer
		officer = OfficerInCharge.find(self.officer_id)

		return officer.email
	end

end
