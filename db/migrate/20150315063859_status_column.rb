class StatusColumn < ActiveRecord::Migration
  def change
  	rename_column :competitions, :presidential_approval_status, :status
  end
end
