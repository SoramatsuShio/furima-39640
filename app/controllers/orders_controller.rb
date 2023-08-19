class OrdersController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @order = Order.new
  end

  def new
    @order = Order.new # Order購入画面へ遷移するnewアクションのコード
  end


  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  
  def order_params
    params.require(:order).permit(:price, :user_id, :item_id)
  end
  

end
