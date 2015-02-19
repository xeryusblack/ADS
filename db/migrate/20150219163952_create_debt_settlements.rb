class CreateDebtSettlements < ActiveRecord::Migration
  def change
    create_table :debt_settlements do |t|
    	t.decimal :amount_paid
    	t.date :date_paid
    	

      # t.timestamps
    end
  end
end
