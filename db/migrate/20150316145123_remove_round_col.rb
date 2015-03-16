class RemoveRoundCol < ActiveRecord::Migration
  def change
  	remove_column :activity_members, :round
  	add_column :activity_members, :judge, :boolean
  	add_column :activity_members, :article, :boolean
  end
end
