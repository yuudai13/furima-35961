class PurchasesController < ApplicationController

  def index
    @purchases = Purchases.new
  end

  def create
    @purchases = Purchases.new(purchaseses_params)
    if @purchases.valid?
      @purchases.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchaseses_params
    params.require(:order).permit(:price)
  end

end
