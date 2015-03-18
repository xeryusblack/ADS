class ContingentMember < ActiveRecord::Base
	belongs_to :tryout_member
	belongs_to :contingent

	POSITION = ["Contingent Debater", "Contingent Adjudicator", "Non-contingent"]
	validates :debater_position,  length: { maximum: 23 }, inclusion: { in: POSITION }
end
