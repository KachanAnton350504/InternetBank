class AddNameToDepositTypes < ActiveRecord::Migration
  def change
    add_column :deposit_types, :name, :string
  end
end
