class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to '/'
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :postage_id, :prefecture_id, :day_id, :price)
  end

end
