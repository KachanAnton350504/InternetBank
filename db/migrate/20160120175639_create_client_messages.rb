class CreateClientMessages < ActiveRecord::Migration
  def change
    create_table :client_messages do |t|
        t.text :content
        t.references :client, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
