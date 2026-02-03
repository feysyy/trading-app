class Order < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :order_type, inclusion: { in: %w[buy sell],
            message: "%{value} is not a valid order" }

  validates :quantity,
            presence: { message: "can't be blank" },
            numericality: {
              greater_than: 0,
              message: "must be greater than 0"
            }

  before_validation :set_total, on: :create
  after_create :process_order
  validate :check_order_validity

  def process_order
    if order_type === "buy"
      execute_buy
    else
      execute_sell
    end
  end

  private
  # for buy
  # -if company does not have an existing record in stock model
  # -create a new record then
  # -update stock quantity: order.quantity += stock.quantity
  # -update user balance: user.balance -= order.total

  # -if company already exist in stock record
  # -find the record then
  # -update stock quantity: order.quantity += stock.quantity
  # -update user balance: user.balance -= order.total
  def execute_buy
    self.total = self.price * self.quantity
    stock = user.stocks.find_or_initialize_by(company: company)
    stock.quantity += self.quantity
    user.balance -= self.total
    user.save!
    stock.save!
  end

  # for sell
  # -update and subtract: order.quantity -= stock.quantity
  # -update user balance: user.balance += order.total
  def execute_sell
    stock = user.stocks.find_by(company: company)
    self.total = self.price * self.quantity
    stock.quantity -= self.quantity
    user.balance += self.total
    stock.save!
    user.save!
  end

  # set the total here
  # instead of line 10 in orders controller
  # calculate the total based on saved order.price * order.quantity
  # save via before_validation :set_total, on: :create
  def set_total
    return if self.quantity.blank?
    self.total = self.price * self.quantity
  end

  # order validity
  # check if user has enough balance to buy and
  # enough stock's share to sell
  def check_order_validity
    return if self.quantity.blank?
    if self.quantity <= 0
      errors.add(:base, "You cannot #{order_type} negative or 0 share")
    end

    # for buy
    if order_type == "buy" && user.balance < self.total
      errors.add(:base, "Insufficient balance, please load up")
    end

    # for sell
    stock = user.stocks.find_by(company: company)
    if order_type == "sell" && self.quantity > stock.quantity
      errors.add(:base, "Not enough stock share, please try again")
    end
  end
end
