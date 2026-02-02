class OrdersController < ApplicationController
  before_action :get_company, only: [ :create ]

  def create
    order = current_user.orders.new(order_params)
    order.company = @company

    ## save the exact price at the exact moment of buy or sell
    current_price = fmp_price.get_stock_price(@company.symbol)
    # order.total = order.quantity * current_price.first["price"]
    order.price = current_price.first["price"]

    if order.save
      redirect_to company_path(@company), notice: "Ordeer Successful!"
    else
      redirect_to marketplace_path, alert: "Something went wrong!"
    end
  end

  private

  def order_params
    params.require(:order).permit(:quantity, :order_type)
  end

  def get_company
    @company = Company.find(params[:company_id])
  end

  def fmp_price
    @fmp_price ||= MarketApi::FmpPrice.new
  end
end
