class ContingentEdit < ActiveRecord::Migration
  def change
  	add_column :contingents, :tryout_intent_id, :integer
  	remove_column :contingents, :debater_postion
  end
end
