class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @order = OrderItem.new
     #出品者はURLを直接入力して購入ページに遷移しようとすると、トップページに遷移すること
     #URLを直接入力して購入済み商品の購入ページへ遷移しようとすると、トップページに遷移すること
    if @item.user_id == current_user.id 
       redirect_to root_path
    end

    if @item.users_item.present?
       redirect_to root_path
    end

  end

  def create
    @order = OrderItem.new(order_params)
    if @order.valid?
       pay_item
       @order.save
       redirect_to root_path
    else
      render :index
    end
  end

  def set_item
      @item = Item.find(params[:item_id])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                # 通貨の種類（日本円）
      )
  end

  private
  def order_params
    params.require(:order_item).permit(:postalcode, :deliverysource_id, :city, :address, :tel, :building, :users_item ).merge(user_id: current_user.id, item_id: params[:item_id], price: params[:price],  token: params[:token])
  end
end
