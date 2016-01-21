class AddIndexClientIdToDeposits < ActiveRecord::Migration
  def change
    add_reference :deposits, :client, index: true, foreign_key: true
    add_reference :deposits, :deposit_type, index: true, foreign_key: true
  end
end
