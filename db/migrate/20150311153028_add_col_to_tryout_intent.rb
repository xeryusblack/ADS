class AddColToTryoutIntent < ActiveRecord::Migration
  def change
  	add_column :tryout_intents, :varsity_member_id, :integer
  end
end
