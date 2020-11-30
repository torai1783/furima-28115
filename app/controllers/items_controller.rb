class ItemsController < ApplicationController
  def index
    @items = Item.all
    @items = Item.oder("created_at DESC")
    @user = User.find(params[:user_id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = item.new(item_params)
    if @items.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def item_params
   params.require(:item).permit(:user_id, :name, :image, :price, :description, :category_id, :status_id, :charges_id, :deliverysource_id, :deliverydays_id )
  end

end
