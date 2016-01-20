class CreateDepositDepartments < ActiveRecord::Migration
  def change
    create_table :deposit_departments do |t|
      t.integer :all_deposit_profit
        
      t.timestamps null: false
    end
  end
end
