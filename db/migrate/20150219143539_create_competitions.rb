class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name, null: false
      t.integer :number_of_contingent, null: false
      t.decimal :arqp_contingent_debater, null: false
      t.decimal :arqp_contingent_adjudicator, null: false
      t.decimal :arqp_non_contingent, null: false
      t.string :presidential_approval_status, null: false
      t.date :start_date, null: false, :default => DateTime.now
      t.date :end_date, null: false, :default => DateTime.now
      t.decimal :quota_point_monetary_value, null: false, :default => 0.00

      # t.timestamps
    end
  end
end
