class AddCompanyToStocks < ActiveRecord::Migration[8.0]
  def change
    add_reference :stocks, :company, null: false, foreign_key: true
  end
end
