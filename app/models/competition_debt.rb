class CompetitionDebt < ActiveRecord::Base
	belongs_to :competition
	belongs_to :varsity_member
end