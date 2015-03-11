class TryoutIntent < ActiveRecord::Base
	validates :date, presence: true
	validates :debater_position, presence: true
	belongs_to :varsity_member

end
