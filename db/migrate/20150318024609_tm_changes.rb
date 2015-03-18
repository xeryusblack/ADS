class TmChanges < ActiveRecord::Migration
  def change
  	add_column :tryout_members, :tryout_intent_id, :integer
  	remove_column :contingents, :tryout_intent_id
  end
end
