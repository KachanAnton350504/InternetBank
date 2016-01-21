class CreateDeposers < ActiveRecord::Migration
  def change
    create_table :deposers do |t|
      t.string :name
      t.string :email
      
      t.timestamps null: false
    end
  end
end
