class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    if current_admin?
      @user_details = @order.user.name
      #binding.pry
      @user_address = @order.user.addresses[0].address
      @accessories = @order.accessory_count
      @total_price = @order.total_price
    elsif current_admin? || (current_user && @order.user == current_user)
      @accessories = @order.accessory_count
      @total_price = @order.total_price
    else
      render file: '/public/404'
    end
  end

  def update
    if current_admin?
      @order = Order.find(params[:id])
      @order.update(status: params[:status])
      if @order.save
        flash[:success] = "#{@order.id} updated!"
        redirect_to admin_dashboard_path
      else
        flash[:notice] = "#{@order.id} not updated!"
      end
    end
  end

end
