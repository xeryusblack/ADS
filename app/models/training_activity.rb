class TrainingActivity < ActiveRecord::Base
	has_many :acquired_quota_points

	validates :name, presence: true, length: { maximum: 30}
	validates :quota_point_value, length: { maximum: 3 }, numericality: true

	def cannot_be_negative
	 	if self.quota_point_value <= 0
	      errors.add(:quota_point_value, "Quantity must not be negative or zero!")
	    end
	end

	def to_s
		self.name
	end
end
