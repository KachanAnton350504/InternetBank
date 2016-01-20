class RemoveBillFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :bill, :integer
  end
end
