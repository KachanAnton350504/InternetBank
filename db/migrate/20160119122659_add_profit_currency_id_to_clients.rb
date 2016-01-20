class AddProfitCurrencyIdToClients < ActiveRecord::Migration
  def change
    add_column :clients, :profit_currency_id, :integer
  end
end
