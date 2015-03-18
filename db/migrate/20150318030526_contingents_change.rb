class ContingentsChange < ActiveRecord::Migration
  def change
  	remove_column :tryout_members, :contingent_id
  	add_column :contingents, :debater_postion, :string
  end
end
