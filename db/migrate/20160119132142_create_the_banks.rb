class CreateTheBanks < ActiveRecord::Migration
  def change
    create_table :the_banks do |t|
      t.string :name
      t.integer :rating
      t.integer :start_capital
      t.integer :money_total
      t.integer :money_on_credits
      t.integer :money_on_deposits
      t.integer :money_dollars
      t.integer :money_bel
      t.integer :money_rus
      t.integer :money_euro

      t.timestamps null: false
    end
  end
end
