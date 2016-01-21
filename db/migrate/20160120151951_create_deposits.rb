class CreateDeposits < ActiveRecord::Migration
  def change
    create_table :deposits do |t|
      t.datetime :data_begin
      t.integer :sum
     

     t.timestamps null: false
    end
  end
end
