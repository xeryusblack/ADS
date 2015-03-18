class AddTm < ActiveRecord::Migration
  def change
  	remove_column :contingents, :debater_position
  	add_column :tryout_members, :debater_position, :string
  end
end
