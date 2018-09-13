class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    if current_admin? || (current_user && @order.user == current_user)
      @accessories = @order.accessory_count
      @total_price = @order.total_price
    else
      render file: '/public/404'
    end
  end

end
