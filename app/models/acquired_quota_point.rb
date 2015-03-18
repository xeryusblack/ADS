class AcquiredQuotaPoint < ActiveRecord::Base
  attr_accessor :result
	has_many :varsity_members, through: :activity_members
  belongs_to :training_activity
	has_many :activity_members
	accepts_nested_attributes_for :activity_members


	#validates :amount, length: { maximum: 3 }, numericality: true
	validates :date_conducted, presence: true

	#validate :cannot_be_negative

	#accepts_nested_attributes_for :varsity_members

	# def cannot_be_negative
	#  	if self.amount <= 0
	#       errors.add(:amount, "Quantity must not be negative or zero!")
	#     end
	# end

	before_validation :load_default

	 def load_default
   		if self.new_record?
        ta = TrainingActivity.find(self.training_activity_id)
        self.amount = 0.00
      end
   end


	#after_create :update_varisty_member_total_debt

	def update_varisty_member_quota_point

    	sum = 0
    	#vm = VarsityMember.find(self.varsity_member_id)
      self.varsity_members.each do |member|
    	#vm.acquired_quota_points.each do |point|
       		sum = member.total_acquired_quota_points + self.amount
            member.update(:total_acquired_quota_points => sum)
        end
    

	end

	before_create :calculate_amount

	def calculate_amount

    	sum = 0
      aqp_total = 0
      i = 1
      #find point value of TA
    	ta = TrainingActivity.find(self.training_activity_id)

      self.activity_members.each do |amember|
    	  vm = VarsityMember.find(amember.varsity_member_id)

        if ta.name == "Debate Round" 
          if amember.article == true
            if vm.debater_position == "Contingent Debater"
              if amember.judge == true
                sum = ta.quota_point_value/2
                aqp_total = vm.total_acquired_quota_points + sum
              else
                sum = ta.quota_point_value
                aqp_total = vm.total_acquired_quota_points + sum
              end
            elsif vm.debater_position == "Contingent Adjudicator"
              if amember.judge == false
                sum = ta.quota_point_value/2
                aqp_total = vm.total_acquired_quota_points + sum
              else
                sum = ta.quota_point_value
                aqp_total = vm.total_acquired_quota_points + sum
              end
            else vm.debater_position == "Non-contingent"
              if vm.varsity_track == "Debater"
                if amember.judge == true
                  sum = ta.quota_point_value/2
                  aqp_total = vm.total_acquired_quota_points + sum
                else
                  sum = ta.quota_point_value
                  aqp_total = vm.total_acquired_quota_points + sum
                end
              elsif vm.varsity_track == "Adjudicator" 
                if amember.judge == false
                  sum = ta.quota_point_value/2
                  aqp_total = vm.total_acquired_quota_points + sum
                else
                  sum = ta.quota_point_value
                  aqp_total = vm.total_acquired_quota_points + sum
              end
              elsif vm.varsity_track == "Debater and Adjudicator"
                sum = ta.quota_point_value
                aqp_total = vm.total_acquired_quota_points + sum
            end
          end
        else
                sum = ta.quota_point_value
                aqp_total = vm.total_acquired_quota_points + sum
        end
           vm.update(:total_acquired_quota_points => aqp_total)
           amember.update(:amount => sum)
	   end
   end

  end

    def to_s
    self.first_name + " " + self.last_name
  end
end
