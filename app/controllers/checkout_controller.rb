class CheckoutController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
      order = current_user.orders.create(status: "ordered")
      @cart.contents.each do |key, value|
        value.times do
          order.order_accessories.create(order_id: order.id, accessory_id: key)
        end
      end
    if current_user.orders
      total = '%.2f' % @cart.cart_total
      num_items = @cart.accessories.count
      session[:cart] = nil
      flash[:notice] = "Successfully submitted your order totaling $#{total}! You ordered #{pluralize(@cart.accessories.count, "item")}."
      redirect_to dashboard_path
    else
      flash[:notice] = "Something went wrong, try again later."
      redirect_to bike_shop_path
    end
  end

end