class RemoveNameAndSymbolFromStocks < ActiveRecord::Migration[8.0]
  def change
    remove_column :stocks, :name, :string
    remove_column :stocks, :symbol, :string
  end
end
