class AddBillsToClients < ActiveRecord::Migration
  def change
    add_column :clients, :bill_rus, :integer, default: 0
    add_column :clients, :bill_bel, :integer, default: 0
    add_column :clients, :bill_euro, :integer, default: 0
    add_column :clients, :bill_dollars, :integer, default: 0
  end
end
