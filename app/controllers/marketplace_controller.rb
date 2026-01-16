class MarketplaceController < ApplicationController
  def index
    @companies = Company.all
    # line #5 shows how to display the price of each company stock in index page
    # @price = fmp_price.get_stock_prices
  end

  def show
    @company = Company.find(params[:id])
    @stock_price = fmp_price.get_stock_price(@company.symbol)
  end

  private

  def fmp_price
    @fmp_price ||= MarketApi::FmpPrice.new
  end
end
