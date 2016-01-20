class RemoveIndexFormDepositTypes < ActiveRecord::Migration
  def change
    remove_index :deposit_types, :currency_id
  end
end
