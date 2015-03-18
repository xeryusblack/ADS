class EditTryout < ActiveRecord::Migration
  def change
  	add_column :contingents, :tryout_intent_id, :integer
  end
end
