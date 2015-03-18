class DestroyTi < ActiveRecord::Migration
  def change
  	remove_column :tryout_intents, :debater_position
  	remove_column :tryout_intents, :varsity_member_id
  	add_column :tryout_intents, :competition_id, :integer
  	remove_column :contingents, :competition_id
  end
end
