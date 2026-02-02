class PortfolioController < ApplicationController
  before_action :authenticate_user!
  # before_action :get_company, only: [ :show ]
  def show
    @stocks = current_user.stocks.includes(:company)
  end
end
