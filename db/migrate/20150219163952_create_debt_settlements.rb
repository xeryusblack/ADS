class CreateDebtSettlements < ActiveRecord::Migration
  def change
    create_table :debt_settlements do |t|
    	t.decimal :amount_paid, null: false, :default => 0.00
    	t.date :date_paid, null: false, :default => DateTime.now
		t.belongs_to :varsity_member, null: false, index: true
		t.belongs_to :officer, null: false, index: true	

      # t.timestamps
    end
  end
end
