# class Orders::PlaceOrder
#   def initialize(user:, company:, order_type:, quantity:)
#     @user = user
#     @company = company
#     @order_type = order_type
#     @quantity = quantity
#   end

#   def create_order
#   end

#   private

#   def fmp_price
#     @fmp_price ||= MarketApi::FmpPrice.new
#     @fmp.price.get_stock_price(@company.symbol).to_i
#   end
# end
