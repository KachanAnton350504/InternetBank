class AddProfitCurrencyToClients < ActiveRecord::Migration
  def change
    add_column :clients, :profit_currency, :string 
  end
end
