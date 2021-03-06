class CreateVarsityMembers < ActiveRecord::Migration
  def change
    create_table :varsity_members do |t|
      t.integer :vm_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.integer :year, null: false
      t.string :course, null: false
      t.string :email_address, null: false
      t.string :contact_number, null: false
      t.string :varsity_track, null: false
      t.string :debater_position, null: false, :default => "Non-contingent"
      t.decimal :total_debt, :default => 0.00
      t.decimal :total_acquired_quota_points, :default => 0

      t.timestamps
    end
  end
end
