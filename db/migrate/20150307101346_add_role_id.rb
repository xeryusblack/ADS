class AddRoleId < ActiveRecord::Migration
  def change
  	add_column :officer_in_charges, :role_id, :integer
  end
end
