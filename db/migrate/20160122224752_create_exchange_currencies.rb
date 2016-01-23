class CreateExchangeCurrencies < ActiveRecord::Migration
  def change
    create_table :exchange_currencies do |t|
      t.string :currency_form
      t.string :currency_to

      t.timestamps null: false
    end
  end
end
