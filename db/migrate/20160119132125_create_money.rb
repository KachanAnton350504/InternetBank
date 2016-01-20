class CreateMoney < ActiveRecord::Migration
  def change
    create_table :money do |t|
      t.integer :count
      
      t.timestamps null: false
    end
  end
end
