class AcquiredQuotaPoint < ActiveRecord::Base
	belongs_to :varsity_member
	belongs_to :training_activity
end
