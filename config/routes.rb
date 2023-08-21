

Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update, :new, :destroy, :show]
    # ユーザーのログアウト処理用ルート

  resources :items do # 商品ページトップを表示、遷移する処理用ルート
    resources :orders, only: [:index, :create]
  end

end


