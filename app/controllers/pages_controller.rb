class PagesController < ApplicationController
  def home
    @resource = User.new
    @resource_name = :user
    @devise_mapping = Devise.mappings[:user]
  end

  def landing_page
  end

  def order_history
    @orders = current_user.orders.includes(:company)
  end
end
