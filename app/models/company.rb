class Company < ApplicationRecord
  validates :symbol, uniqueness: { case_sensitive: false }
  before_validation :capitalize_symbol

  private

  def capitalize_symbol
    self.symbol = symbol&.upcase
  end
end
