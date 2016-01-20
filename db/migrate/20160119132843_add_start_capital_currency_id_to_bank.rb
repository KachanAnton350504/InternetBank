class AddStartCapitalCurrencyIdToBank < ActiveRecord::Migration
  def change
    add_column :the_banks, :start_capital_currency_id, :integer
  end
end
