class OrdersController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :show, :create ] 



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
      
      @order_address.save
     
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end



  private

 # ストロングパラメータを定義
  def order_params
    params.require(:order_address).permit(:zipcode, :shipping_origin_id, :city, :street_address, :building_name, :phone).merge(user_id: current_user.id , item_id: @item.id)
  end

  
  def set_item
    @item = Item.find(params[:item_id])
  end
  

end
