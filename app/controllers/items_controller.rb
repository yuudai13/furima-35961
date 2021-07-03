class ItemsController < ApplicationController

def index
  @items = Item.all
end

def new
  @items = Item.all
end

def create
  Item.create(items_params)
end

private
def items_params
  prams.require(:items).permit(:name, :description, :category_id, :condition_id, :delivery_charge_id, :delivery_source_id, :shipping_days_id, :price).merge(user_id: curent_user.id)
end
end

