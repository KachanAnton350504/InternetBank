class RemoveProfitCurrencyIdFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :profit_currency_id, :integer
  end
end
