class ShippingAddressesController < ApplicationController

  def index
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
    params.require(:order).permit(:price)
  end
end