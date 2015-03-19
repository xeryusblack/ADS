class Competition < ActiveRecord::Base
	has_many :competition_debts
	has_many :contingents
	has_many :activity_members


	STATUS = ["Ongoing", "Upcoming", "Processing", "Completed"]
  #validation of custom always goes first
  #current_user method cannot be accessed in model
	validates :name, length: { maximum: 30}
	validates :number_of_contingent, length: { maximum: 3 }, numericality: true
	validates :arqp_contingent_debater, length: { maximum: 4 }, numericality: true
	validates :arqp_contingent_adjudicator, length: { maximum: 4 }, numericality: true
	validates :arqp_non_contingent, length: { maximum: 4 }, numericality: true
	validates :status, presence: true, inclusion: { in: STATUS }
	validates :end_date, presence: true
	validates :start_date, presence: true
	validates :quota_point_monetary_value, length: { maximum: 4 }, numericality: true

	validate :cannot_be_invalid

	def cannot_be_invalid
    if self.name == "" 
          errors.add(:name, "Cannot be blank!")
    end
    if !self.number_of_contingent.nil?
	 	   if self.number_of_contingent <= 0
	       errors.add(:number_of_contingent, "Quantity must not be negative!")
	     end
    end

    if !self.arqp_contingent_debater.nil?
	    if self.arqp_contingent_debater <= 0
	      errors.add(:arqp_contingent_debater, "Quantity must not be negative!")
	    end
    end

    if !self.arqp_contingent_adjudicator.nil?
	    if self.arqp_contingent_adjudicator <= 0
	      errors.add(:arqp_contingent_adjudicator, "Quantity must not be negative!")
	    end
    end

    if !self.arqp_non_contingent.nil?
	    if self.arqp_non_contingent <= 0
	      errors.add(:arqp_non_contingent, "Quantity must not be negative!")
	    end
    end

    if !self.quota_point_monetary_value.nil?
	    if self.quota_point_monetary_value <= 0
	      errors.add(:quota_point_monetary_value, "Quantity must not be negative!")
	    end
    end

	end

  validate :status_check
  def status_check
      competition = Competition.find_by(status: "Ongoing")

      if self.status == "Ongoing" && competition != nil
        errors.add(:status, "A competition is currently ongoing")
      end

      #if self.status == "Completed" 
      #   raise "Error: Competition is alredy completed"
      #   errors.add(:status, "Competition is alredy completed")
      # end
  end
	 #  def ongoing!
  #   if self.status == "Ongoing"
  #     raise "ERROR: Competition already Ongoing" 
  #   else
  #     self.update!(status: "Ongoing")
  #   end 
  # end

  # def completed!
  #   if self.status == "Completed"
  #     raise "ERROR: Competition already Completed" 
  #   else
  #     self.update!(status: "Completed")
  #   end 
  # end

  # def upcoming!
  #     if self.status == "Upcoming"
  #       raise "ERROR: Competition already Upcoming" 
  #     else
  #       self.update!(status: "Upcoming")
  #     end
  # end

  # def processing!
  #   result = false
  #     if self.status == "Processing" || self.status == "Completed"
  #       raise "ERROR: Competition already Processing" 
  #       return result = false
  #     else
  #       self.update!(status: "Processing")
  #       return result = true
  #     end
  # end

  after_update :total_debt, if:  Proc.new { |competition| competition.status == "Processing" } #{competition.presidential_approval_status == "processing"}
  
  def total_debt 
    temp = 0
    debt = 0
      VarsityMember.all.each do |vmember|
      #vmember.activity_members.each do |amember|
         
         #competition = Competition.find(amember.competition_id)
         #competition = Competition.find_by(status: "Processing")
         #vm = VarsityMember.find(amember.varsity_member_id)
         if vmember.debater_position == "Contingent Debater"

          temp = self.arqp_contingent_debater - vmember.total_acquired_quota_points
            if temp > 0 
                debt = temp * self.quota_point_monetary_value
                debt_total = vmember.total_debt + debt
                vmember.update(:total_debt => debt_total)      
            end
        
        elsif vmember.debater_position == "Contingent Adjudicator"

              temp = self.arqp_contingent_adjudicator - vmember.total_acquired_quota_points
            if temp > 0 
                debt = temp * self.quota_point_monetary_value
                debt_total = vmember.total_debt + debt
                vmember.update(:total_debt => debt_total)
            end

        elsif vmember.debater_position == "Non-contingent"

              temp = self.arqp_non_contingent - vmember.total_acquired_quota_points
            if temp > 0 
                debt = temp * self.quota_point_monetary_value
                debt_total = vmember.total_debt + debt
                vmember.update(:total_debt => debt_total)
            end
        end
          vmember.update(:total_acquired_quota_points => 0)
          vmember.update(:debater_position => "Non-contingent")
          self.update!(status: "Completed")
    end


  end

  def to_s
    self.name
  end 

end
