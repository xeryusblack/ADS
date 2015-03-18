class ActivityMember < ActiveRecord::Migration
  def change
  	add_column :activity_members, :amount, :decimal
  end
end
