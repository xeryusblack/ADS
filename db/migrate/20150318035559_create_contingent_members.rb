class CreateContingentMembers < ActiveRecord::Migration
  def change
    create_table :contingent_members do |t|
      t.integer :contingent_id
      t.string :debater_position
      t.integer :tryout_member_id

      t.timestamps
    end
  end
end
