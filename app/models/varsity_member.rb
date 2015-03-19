class VarsityMember < ActiveRecord::Base
		TRACK = ["Debater", "Adjudicator", "Debater and Adjudicator"]
	POSITION = ["Contingent Debater", "Contingent Adjudicator", "Non-contingent"]

	validates :vm_id, length: { is: 6 }, :uniqueness => { :message => "ID number already exist" }, numericality: true
	validates :first_name, length: { maximum: 30}
	validates :last_name,  length: { maximum: 30}
	validates :year,  length: { is: 1 }
	validates :course, length: { maximum: 15 }
	validates :contact_number, length: { is: 11 }
	validates :email_address,  length: { maximum: 40 }
	validates :varsity_track, inclusion: { in: TRACK }
	validates :debater_position, inclusion: { in: POSITION }
	validates :total_debt, length: { maximum: 7 }, numericality: true
	validates :total_acquired_quota_points, length: { maximum: 5 }, numericality: true

	
	has_many :debt_settlements 
	has_many :competition_debts
	has_many :acquired_quota_points, through: :activity_members
	has_many :activity_members, :dependent => :destroy
	has_many :tryout_intents
	has_many :competitons, through: :competition_debts

	validate :cannot_be_wrong
	
	def cannot_be_wrong

		if self.first_name == "" 
	       	errors.add(:first_name, "Cannot be blank!")
		end

		if self.last_name == "" 
	       	errors.add(:last_name, "Cannot be blank!")
		end

		if self.course == "" 
	       	errors.add(:course, "Cannot be blank!")
		end

		if self.email_address == "" 
	       	errors.add(:email_address, "Cannot be blank!")
		end

		if self.contact_number == "" 
			errors.add(:contact_number, "Cannot be blank!")
		else
	 		if self.contact_number.length != 11
	     		errors.add(:contact_number, "Must contain valid cellphone number! (11 digits)")
	    	end
	    end
		if self.vm_id == ""
			errors.add(:vm_id, "Cannot be blank!")
		else
			if !self.vm_id.nil?
	    		if self.vm_id > 999999
	      			errors.add(:vm_id, "Must contain valid ID Number (6 digits)")
	    		end
	    	end
		end
	end

	before_validation :load_default

	 def load_default
   		if self.new_record?
        self.total_debt = 0.00
        self.total_acquired_quota_points = 0.00
      end
   end


	def to_s
		self.first_name + " " + self.last_name
	end

	# def calculate_total_debt
	# 	competition = Competition.find(self.competition_id)
	# 	vm = VarsityMember.find(self.varsity_member_id)

	# 	position = vm.debater_positon

		

	# 	competiton.avm.total_acquired_quota_points 
	# 	money = competition.quota_point_monetary_value


	# 	selfVarsityMember.all.each do |member|
	# 		member.total_debt = member.total_debt + (member.total_acquired_quota_points * member.competitons
	# 	end
	# end

	
end
