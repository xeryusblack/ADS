class Competition < ActiveRecord::Base
	has_many :competition_debts
	has_many :contingents

	STATUS = ["Approved", "Denied"]
end
