class CreateAcquiredQuotaPoints < ActiveRecord::Migration
  def change
    create_table :acquired_quota_points do |t|
    	t.decimal :amount, null: false, :default => 0.00
    	t.date :date_conducted, null: false, :default => DateTime.now
    	t.belongs_to :varsity_member, null: false, index: true
    	t.belongs_to :training_activity, null: false, index: true
      # t.timestamps
    end
  end
end
