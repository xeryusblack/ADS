class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :number_of_contingent
      t.decimal :arqp_contingent_debater
      t.decimal :arqp_contingent_adjudicator
      t.decimal :arqp_non_contingent
      t.string :presidential_approval_status
      t.date :start_date
      t.date :end_date
      t.decimal :quota_point_monetary_value

      # t.timestamps
    end
  end
end
