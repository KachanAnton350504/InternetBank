class AddDepositDurationToDepositType < ActiveRecord::Migration
  def change
    add_column :deposit_types, :deposit_duration, :integer
  end
end
