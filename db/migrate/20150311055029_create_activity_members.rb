class CreateActivityMembers < ActiveRecord::Migration
  def change
    create_table :activity_members do |t|
      t.integer :varsity_member_id
      t.integer :acquired_quota_point_id
      t.integer :round

      t.timestamps
    end
  end
end
