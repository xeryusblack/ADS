class Role < ActiveRecord::Base
	has_and_belongs_to_many :officer_in_charges
	POSITION = ["Office of Finance", "Office of Training and Varsity", "Administrator"]

	#validates :name, inclusion: { in: POSITION }
end
