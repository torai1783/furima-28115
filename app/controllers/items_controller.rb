class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit]
  before_action :set_item, only: [:edit, :show, :update]

  
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
    redirect_to root_path
    else
      render :show
    end
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  private
  def item_params
   params.require(:item).permit(:name, :image, :price, :description, :category_id, :status_id, :charge_id, :deliverysource_id, :deliveryday_id ).merge(user_id: current_user.id)
  end
end
