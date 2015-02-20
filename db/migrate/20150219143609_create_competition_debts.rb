class CreateCompetitionDebts < ActiveRecord::Migration
  def change
    create_table :competition_debts do |t|
      t.string :source_of_debt, null: false
      t.decimal :debt_amount, null: false, :default => 0.00
      t.integer :competition_id, null: false
      t.belongs_to :varsity_member, null: false, index: true
      t.belongs_to :competition, null: false, index: true

      # t.timestamps
    end
  end
end
