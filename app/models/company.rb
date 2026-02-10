class Company < ApplicationRecord
  has_many :stocks, dependent: :destroy
  has_many :orders, dependent: :destroy
  validates :symbol, uniqueness: { case_sensitive: false }, presence: true
  validates :name, presence: true
  before_validation :capitalize_symbol

  private

  def capitalize_symbol
    self.symbol = symbol&.upcase
  end
end
