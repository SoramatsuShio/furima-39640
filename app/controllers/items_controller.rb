class ItemsController < ApplicationController
 
  before_action :move_to_index, except: [:index, :show]
  
  def index
    # 何もすることなし。トップページのビューを表示するだけ。
  end
  
  def new
    # newアクションのコード
    @user = User.new
  end

  def create
    # createアクションのコード
    @user = User.new(user_params)  # メソッド名を修正

    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  private
  
  # ストロングパラメータを定義
  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :family_name_zenkaku,
      :first_name_zenkaku,
      :family_name_kana,
      :first_name_kana,
      :date_of_birth
    )
  end

end
