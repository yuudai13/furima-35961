class ShippingAddressesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_shipping_addresses = FormObject.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_shipping_addresses = FormObject.new(shipping_address_params)
    if @item_shipping_addresses.valid?
      pay_item
      @item_shipping_addresses.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def shipping_address_params
    params.require(:form_object).permit(:postal_code, :delivery_source_id, :municipalities, :address, :building_name, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

 def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: shipping_address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
 end

end