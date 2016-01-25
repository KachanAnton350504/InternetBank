class CreateDepositTypes < ActiveRecord::Migration
  def change
    create_table :deposit_types do |t|
      t.string :kind
      t.integer :percent
      t.integer :min_sum

      t.timestamps null: false
    end
  end
end
