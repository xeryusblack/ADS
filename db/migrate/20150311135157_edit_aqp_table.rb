class EditAqpTable < ActiveRecord::Migration
  def change
  	remove_column :acquired_quota_points, :varsity_member_id
  end
end
