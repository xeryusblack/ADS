class VarsityMember < ActiveRecord::Base
	self.primary_key = "vm_id"

	TRACK = ["Debater", "Adjudicator", "Debater and Adjudicator"]
	POSITION = ["Contingent Debater", "Contingent Adjudicator", "Non-contingent"]

	validates :vm_id, presence: true, length: { is: 6 }, :uniqueness => { :message => "ID number already exist" }
	validates :first_name, presence: true, length: { maximum: 30}
	validates :last_name, presence: true, length: { maximum: 30}
	validates :year, presence: true, length: { is: 1 }
	validates :course, presence: true, length: { maximum: 15 }
	validates :contact_number, presence: true, length: { is: 11 }
	validates :email_address, presence: true, length: { maximum: 40 }
	validates :varsity_track, presence: true, length: { maximum: 15 }, inclusion: { in: TRACK }
	validates :debater_position, presence: true, length: { maximum: 23 }, inclusion: { in: POSITION }
	validates :txotal_debt, length: { maximum: 7 }
	validates :total_acquired_quota_points, length: { maximum: 3 }

	has_many :debt_settlements
	has_many :competition_debts
	has_many :acquired_quota_points
end
