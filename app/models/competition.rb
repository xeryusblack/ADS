class Competition < ActiveRecord::Base
	has_many :competition_debts
	has_many :contingents
	has_many :activity_members

	STATUS = ["Ongoing", "Completed", "Upcoming", "Processing"]

	validates :name, presence: true, length: { maximum: 30}
	validates :number_of_contingent, length: { maximum: 3 }, numericality: true
	validates :arqp_contingent_debater, length: { maximum: 3 }, numericality: true
	validates :arqp_contingent_adjudicator, length: { maximum: 3 }, numericality: true
	validates :arqp_non_contingent, length: { maximum: 3 }, numericality: true
	validates :presidential_approval_status, presence: true, inclusion: { in: STATUS }
	validates :end_date, presence: true
	validates :start_date, presence: true
	validates :quota_point_monetary_value, length: { maximum: 3 }, numericality: true

	validate :cannot_be_negative

	def cannot_be_negative
	 	if self.number_of_contingent <= 0
	      errors.add(:number_of_contingent, "Quantity must not be negative!")
	    end

	    if self.arqp_contingent_debater <= 0
	      errors.add(:number_of_contingent, "Quantity must not be negative!")
	    end

	    if self.arqp_contingent_adjudicator <= 0
	      errors.add(:number_of_contingent, "Quantity must not be negative!")
	    end

	    if self.arqp_non_contingent <= 0
	      errors.add(:number_of_contingent, "Quantity must not be negative!")
	    end

	    if self.quota_point_monetary_value <= 0
	      errors.add(:number_of_contingent, "Quantity must not be negative!")
	    end
	end

	  def ongoing!
    if self.presidential_approval_status == "Ongoing"
      raise "ERROR: Competition already Ongoing" 
    else
      self.update!(presidential_approval_status: "Ongoing")
    end 
  end

  def completed!
    if self.presidential_approval_status == "Completed"
      raise "ERROR: Competition already Completed" 
    else
      self.update!(presidential_approval_status: "Completed")
    end 
  end

  def upcoming!
      if self.presidential_approval_status == "Upcoming"
        raise "ERROR: Competition already Upcoming" 
      else
        self.update!(presidential_approval_status: "Upcoming")
      end
  end

  def processing!
    result = false
      if self.self.presidential_approval_status == "Processing"
        raise "ERROR: Competition already Processing" 
        return result = false
      else
        self.update!(presidential_approval_status: "Processing")
        return result = true
      end
  end
  after_update :total_debt, if:  Proc.new { |competition| competition.presidential_approval_status == "Processing" } #{competition.presidential_approval_status == "processing"}
  
  def total_debt 
    temp = 0
    debt = 0

      VarsityMember.all.each do |vmember|
      #vmember.activity_members.each do |amember|
         
         #competition = Competition.find(amember.competition_id)
         competition = Competition.find_by(presidential_approval_status: "Processing")
         #vm = VarsityMember.find(amember.varsity_member_id)
         if vmember.debater_position == "Contingent Debater"

          temp = competition.arqp_contingent_debater - vmember.total_acquired_quota_points
            if temp > 0 
                debt = temp * competition.quota_point_monetary_value
                debt_total = vmember.total_debt + debt
                vmember.update(:total_debt => debt_total)
            end
        
        elsif vmember.debater_position == "Contingent Adjudicator"

              temp = competition.arqp_contingent_adjudicator - vmember.total_acquired_quota_points
            if temp > 0 
                debt = temp * competition.quota_point_monetary_value
                debt_total = vmember.total_debt + debt
                vmember.update(:total_debt => debt_total)
            end

        elsif vmember.debater_position == "Non-contingent"

              temp = competition.arqp_non_contingent - vm.total_acquired_quota_points
            if temp > 0 
                debt = temp * competition.quota_point_monetary_value
                debt_total = vmember.total_debt + debt
                vmember.update(:total_debt => debt_total)
            end
        end
    end
  end

end
