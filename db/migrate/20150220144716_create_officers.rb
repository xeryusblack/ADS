class CreateOfficers < ActiveRecord::Migration
  def change
    create_table :officers, id: false do |t|
    	t.primary_key :id
    	t.string :name, null: false
      # t.timestamps
    end
  end
end
