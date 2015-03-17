class Contingent < ActiveRecord::Base
	belongs_to :competition
	belongs_to :varsity_member

	POSITION = ["Contingent Debater", "Contingent Adjudicator", "Non-contingent"]

	before_validation :load_default

	def load_default
   		if self.new_record?
        ta = TrainingActivity.find(self.training_activity_id)
        self.amount = 0.00
      end
   end

	if TryoutIntent.all != nil 

		

	end





end
