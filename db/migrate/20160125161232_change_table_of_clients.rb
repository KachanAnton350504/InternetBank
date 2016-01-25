class ChangeTableOfClients < ActiveRecord::Migration
  def change
    remove_column :clients, :address, :string
    remove_column :clients, :adress, :string
    remove_column :clients, :profit_currency, :string
    remove_column :clients, :profit_per_month, :integer

    change_table :clients do |t|
      t.rename :password_digest, :oauth_token
      t.rename :remember_token, :uid
      t.rename :email, :provider
    end

    add_column :clients, :oauth_expires_at, :datetime
  end
end
