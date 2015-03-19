class TrainingActivity < ActiveRecord::Base
	has_many :acquired_quota_points

	#validates_presence_of :name, :message => "Can't be blank"
	validates :name, length: { maximum: 30}
	validates :quota_point_value, presence: true, length: { maximum: 5 }

	validate :cannot_be_negative
	def cannot_be_negative
		if self.name == "" 
	       	errors.add(:name, "Name cannot be blank!")
		end
		if !self.quota_point_value.nil?
	 		if self.quota_point_value  <= 0.00
	      		errors.add(:quota_point_value, "Quantity must not be negative or zero!")
	    	end
		end
	end

	def to_s
		self.name
	end
end
