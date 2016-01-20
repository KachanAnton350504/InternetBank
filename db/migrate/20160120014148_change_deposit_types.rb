class ChangeDepositTypes < ActiveRecord::Migration
  def change
    change_table :deposit_types do |t|
      t.string :currency
    end
  end
end
