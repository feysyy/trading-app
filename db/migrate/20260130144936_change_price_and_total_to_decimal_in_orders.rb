class ChangePriceAndTotalToDecimalInOrders < ActiveRecord::Migration[8.0]
  def change
    change_column :orders, :price, :decimal, precision: 10, scale: 2
    change_column :orders, :total, :decimal, precision: 10, scale: 2
  end
end
