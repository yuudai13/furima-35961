class ShippingAddressesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @shipping_addresses = ShippingAddress.new
  end

  def create
    @shipping_addresses = ShippingAddress.new(shipping_address_params)
    if @shipping_addresses.valid?
      @shipping_addresses.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def shipping_address_params
    params.require(:shipping_address).permit(:name, :price, :image).merge(user_id: current_user.id)
  end
end