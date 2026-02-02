class RemoveStockFromOrders < ActiveRecord::Migration[8.0]
  def change
    remove_reference :orders, :stock, null: false, foreign_key: true
  end
end
