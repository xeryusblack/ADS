class TryoutIntent < ActiveRecord::Base
	validates :date, presence: true
	validates :competition_id, presence: true
	has_one :contingent

	has_many :tryout_members, :dependent => :destroy
	accepts_nested_attributes_for :tryout_members

	belongs_to :competition

	def to_s
		self.competition.name
	end


	after_create :create_contingent

  	def create_contingent
  		Contingent.create(tryout_intent_id: self.id)
  	end

  	 after_destroy :delete_contingent

  	private
    def delete_contingent
      Contingent.destroy(self.id)
    end
end
