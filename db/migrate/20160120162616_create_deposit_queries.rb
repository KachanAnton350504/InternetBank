class CreateDepositQueries < ActiveRecord::Migration
  def change
    create_table :deposit_queries do |t|
      t.integer :sum
      t.references :deposit_type, index: true, foreign_key: true
      t.references :client, index: true, foreign_key: true
      t.references :deposer, index: true, foreign_key: true
 
      t.timestamps null: false
    end
  end
end
