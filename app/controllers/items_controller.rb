class ItemsController < ApplicationController
  def index
    @items = Item.new
    @user = User.find(@arams[:user_id])
  end

  def new
    @item = Item.new
  end

  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(user_params)
    @item.save  
    if @items.save
      redirect_to user_items_path(@user)
    else
      render :index
    end
  end

  private
  def items_params
   params.require(:item), permit(:user_id, :name, :image, :price, :description, :category_id, :status_id, :charges_id, :deliverysource_id, :deliverydays_id)
  end

end
