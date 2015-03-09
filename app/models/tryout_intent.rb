class TryoutIntent < ActiveRecord::Base
	validates :date, presence: true
	validates :debater_position, presence: true
end
