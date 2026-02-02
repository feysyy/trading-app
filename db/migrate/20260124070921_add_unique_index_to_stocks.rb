class AddUniqueIndexToStocks < ActiveRecord::Migration[8.0]
  def change
    add_index :stocks, [ :user_id, :company_id ], unique: true
  end
end
