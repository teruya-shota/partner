Rails.application.routes.draw do

  #デバイス
  devise_for :users
  end
  #ルート設定
  root "products#top"
  #顧客
  resource :users, only: [:show,:edit,:update] do
    get :leave, on: :collection
    patch :left, on: :member
  end
  namespace :admin do
    resources :users, only: [:index,:show,:edit,:update]
  end

  #管理者ログイン
  namespace :admin do
    get '/sign_in', to: 'admin#new'
    post '/sign_in', to: 'admin#create'
    delete '/sign_out', to: 'admin#destroy'
    get '/', to: 'admin#index'
  end

end