class RemoveVmId < ActiveRecord::Migration
  def change
  	remove_column :varsity_members, :vm_id
  end
end
