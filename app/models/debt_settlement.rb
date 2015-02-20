class DebtSettlement < ActiveRecord::Base
	belongs_to :varsity_member
	belongs_to :officer
end
