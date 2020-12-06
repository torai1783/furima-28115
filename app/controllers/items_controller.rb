class ItemsController < ApplicationController

  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  #def destory
   # @item = item.find(params[:id])
    #item.destroy
 # end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
   params.require(:item).permit(:name, :image, :price, :description, :category_id, :status_id, :charge_id, :deliverysource_id, :deliveryday_id ).merge(user_id: current_user.id)
  end
end
