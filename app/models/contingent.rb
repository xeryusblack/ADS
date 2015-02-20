class Contingent < ActiveRecord::Base
	belongs_to :competition
	belongs_to :varsity_member
end
