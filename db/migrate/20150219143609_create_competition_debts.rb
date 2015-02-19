class CreateCompetitionDebts < ActiveRecord::Migration
  def change
    create_table :competition_debts do |t|
      t.string :source_of_debt, null: false
      t.decimal :debt_amount, null: false
      t.integer :competition_id, null: false
      t.integer :varsity_member_id, null: false

      # t.timestamps
    end
  end
end
