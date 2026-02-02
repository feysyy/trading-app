class Stock < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :company_id, uniqueness: { scope: :user_id }
  after_save :check_stock_quantity

  private

  def check_stock_quantity
    destroy if self.quantity.zero?
  end
end
