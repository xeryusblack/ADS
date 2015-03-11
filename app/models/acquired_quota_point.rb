class AcquiredQuotaPoint < ActiveRecord::Base
	has_and_belongs_to_many :varsity_members
	belongs_to :training_activity


	validates :amount, length: { maximum: 3 }, numericality: true
	validates :date_conducted, presence: true

	validate :cannot_be_negative

	accepts_nested_attributes_for :varsity_members

	def cannot_be_negative
	 	if self.amount <= 0
	      errors.add(:amount, "Quantity must not be negative or zero!")
	    end
	end

	after_create :update_varisty_member_quota_point

	def update_varisty_member_quota_point

    	sum = 0
    	vm = VarsityMember.find(self.varsity_member_id)

       	sum = vm.total_acquired_quota_points + self.amount
    
      	user.update(:total_acquired_quota_points => sum)
	end

end
