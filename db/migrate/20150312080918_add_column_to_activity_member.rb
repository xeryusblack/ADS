class AddColumnToActivityMember < ActiveRecord::Migration
  def change
  	add_column :activity_members, :competition_id, :integer
  end
end
