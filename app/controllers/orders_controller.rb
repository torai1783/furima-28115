class OrdersController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @orders = Order.order("created_at DESC")
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def order_params
    params.require(:order).permit(:users_items, :postalcood, :deliverysource_id, :city, :address, :tel, :building ).merge(user_id: current_user.id)
  end
end
