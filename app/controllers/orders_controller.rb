class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create ] 
  before_action :move_to_index, only: :index


  def index
    @order_address = OrderAddress.new
  end
  
  #def show
  #end


  #def new
   #@order_address = OrderForm.new(item_id: params[:item_id])
  #end



  def create
   
    @order_address = OrderAddress.new(order_params)
    
    if @order_address.valid?
      pay_item
      @order_address.save
     
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end



  
  private

 # ストロングパラメータを定義
  def order_params
    params.require(:order_address).permit(:zipcode, :shipping_origin_id, :city, :street_address, :building_name, :phone).merge(user_id: current_user.id , item_id: @item.id, token: params[:token])
  end

  
  def set_item
    @item = Item.find(params[:item_id])
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.mini_sell_price,            # 商品の値段
      card: order_params[:token],     # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def move_to_index
    redirect_to root_path if current_user == @item.user || @item.order.present?
  end

end
