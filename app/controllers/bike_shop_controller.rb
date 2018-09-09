class BikeShopController < ApplicationController
  def index
    @accessories = Accessory.all
    # flash[:notice] = "#{@item.title} was added to the cart."
  end
end