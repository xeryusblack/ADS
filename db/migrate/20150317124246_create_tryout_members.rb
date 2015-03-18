class CreateTryoutMembers < ActiveRecord::Migration
  def change
    create_table :tryout_members do |t|
      t.integer :varsity_member_id
      t.integer :contingent_id

      t.timestamps
    end
  end
end
