class CreateTrainingActivities < ActiveRecord::Migration
  def change
    create_table :training_activities do |t|
    	t.string :name, null: false
    	t.decimal :quota_point_value, null: false, :default => 0.00

      # t.timestamps
    end
  end
end
