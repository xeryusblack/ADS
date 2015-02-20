class CreateContingents < ActiveRecord::Migration
  def change
    create_table :contingents do |t|
    	t.string :debater_position, null: false, :default => "Non-contingent"
    	t.belongs_to :varsity_member, null: false, index: true
    	t.belongs_to :competition, null: false, index: true
      # t.timestamps
    end
  end
end
