class UsersController < ApplicationController
  def index
    # 何もすることなし。トップページのビューを表示するだけ。
  end
  
  def new
    # newアクションのコード
    @user = user.new
  end

  def create
    # createアクションのコード
    @user = User.new(item_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

end
