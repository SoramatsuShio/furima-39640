class OrdersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:index, :show ] 



  def index
    @order_form = OrderForm.new
  end
  
  def new
    @order = Order.new # Order購入画面へ遷移するnewアクションのコード
  end

  def show
  end

  def create
    @order = Order.create(item_params)
    Address.create(order_params)  
    redirect_too root_path
  end

  private

 # ストロングパラメータを定義
 def item_params
  params.require(:item).permit(:mini_sell_price ).merge(user_id: current_user.id)
 end

  def order_params
    params.require(:order).permit(
      :zipcode,
      :prefecture_id,
      :city,
      :street_address,
      :building_name,
      :phone,
      ).merge(order_id: @order.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  

end
