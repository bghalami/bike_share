class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper
  def create
    accessory = Accessory.find(params[:item_id])
    @cart.add_accessory(accessory.id)
    session[:cart] = @cart.contents

    flash[:notice] = "#{accessory.title} was added to the cart."
    redirect_to bike_shop_path
  end

  def increase
    accessory = Accessory.find(params[:item_id])
    @cart.add_accessory(accessory.id)
    session[:cart] = @cart.contents

    redirect_to cart_path
  end

  def decrease
    accessory = Accessory.find(params[:item_id])
    @cart.remove_accessory(accessory.id)
    session[:cart] = @cart.contents
    if @cart.contents[params[:item_id]] == nil
      flash[:warning] = "Successfully removed #{view_context.link_to accessory.title, accessory_path(accessory)} from your cart.".html_safe
    end
    redirect_to cart_path
  end

  def show
    @accessories = @cart.accessories
  end

  def destroy
    @cart.contents.delete(params[:item_id])
    accessory = Accessory.find(params[:item_id])
    flash[:warning] = "Successfully removed #{view_context.link_to accessory.title, accessory_path(accessory)} from your cart.".html_safe
    redirect_to cart_path
  end
end
