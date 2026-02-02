class ChangeBalanceToDecimalInUser < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :balance, :decimal, precision: 15, scale: 2, default: 0.0
  end
end
