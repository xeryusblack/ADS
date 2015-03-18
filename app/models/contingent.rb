class Contingent < ActiveRecord::Base

	has_many :varsity_members, through: :tryout_members
	has_many :tryout_members, through: :contingent_members
	belongs_to :tryout_intent

	has_many :contingent_members, :dependent => :destroy
	accepts_nested_attributes_for :contingent_members

	

after_create :edit_vm_debater_postion

	def edit_vm_debater_postion

      	self.contingent_members.each do |cmember|
    	  vm = VarsityMember.find(cmember.varsity_member_id)
    	  dp = cmember.debater_postion
    	  vm.update(:debater_postion => dp)
     	 end
    end

end
