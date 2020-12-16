class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  #before_action :set_item, only: [:index, :create]

  def index
    @order = OrderItem.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderItem.new(order_params)
    if @order.valid?
       @order.save
       redirect_to root_path
    else
      render :index
    end

    #def set_item
      #@item = Item.find(params[:item_id])
    #end
  end

  private
  def order_params
    params.require(:order_item).permit(:postalcode, :deliverysource_id, :city, :address, :tel, :building, :users_item ).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
