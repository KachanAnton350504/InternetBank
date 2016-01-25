class RenoveIndexFromClients < ActiveRecord::Migration
  def change
    remove_index :clients, :provider
    remove_index :clients, :uid

  end
end
