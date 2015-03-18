class DeleteVm < ActiveRecord::Migration
  def change
  	remove_column :contingents, :varsity_member_id
  end
end
