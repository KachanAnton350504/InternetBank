class ChangeTypeCurrency < ActiveRecord::Migration
  def change
     change_table :currencies do |t|
      t.rename :type, :kind_name
    end
  end
end
