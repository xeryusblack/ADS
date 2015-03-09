class Competition < ActiveRecord::Base
	has_many :competition_debts
	has_many :contingents

	STATUS = ["Approved", "Denied"]

	validates :name, presence: true, length: { maximum: 30}
	validates :number_of_contingent, length: { maximum: 3 }, numericality: true
	validates :arqp_contingent_debater, length: { maximum: 3 }, numericality: true
	validates :arqp_contingent_adjudicator, length: { maximum: 3 }, numericality: true
	validates :arqp_non_contingent, length: { maximum: 3 }, numericality: true
	validates :presidential_approval_status, presence: true
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
end
