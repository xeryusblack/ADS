class CreateTryoutIntents < ActiveRecord::Migration
  def change
    create_table :tryout_intents do |t|
    	t.date :date, null: false, :default => DateTime.now
    	t.string :debater_position, null: false

      # t.timestamps
    end
  end
end
