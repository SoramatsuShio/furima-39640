class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    # 何もすることなし。トップページのビューを表示するだけ。
  end

  def show
    if params[:id] == 'sign_out'
      # 'sign_out' が渡された場合の特別な処理をここに追加
      # 例: ログアウトの処理やトップページへのリダイレクト
      redirect_to root_path
      # 例: エラー処理
    else
      @user = User.find(params[:id])
      # 通常のユーザー詳細表示の処理をここに追加
    end
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

