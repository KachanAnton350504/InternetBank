class AddRoleToClients < ActiveRecord::Migration
  def change
    add_column :clients, :role, :integer
  end
end
