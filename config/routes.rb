

Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update, :new, :destroy, :show]
    # ユーザーのログアウト処理用ルート
   
  # Deviseのルートを設定し、Sessionsコントローラーのdestroyアクションをログアウト処理に使う
 
  # ユーザーのログアウト処理用ルート


end