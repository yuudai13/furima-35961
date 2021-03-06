class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
 
 
  def index
   @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @messages = @item.messages.includes(:user)
   #@messages = Item.find(params[:id])
     @message = Message.new 

  end

  def edit
    if user_signed_in? && @item.purchase != nil
      redirect_to root_path
     end
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

def destroy
  @item.destroy
  redirect_to root_path
end

  private
  def items_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :delivery_charge_id, :delivery_source_id, :shipping_day_id, :price).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def move_to_index
    if @item.user.id != current_user.id
      redirect_to root_path
     end
  end
end
