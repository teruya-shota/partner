Rails.application.routes.draw do
  namespace :admin do
    get 'languages/index'
    get 'languages/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  #デバイス
  devise_for :users, skip: :all
  devise_scope :user do
    get '/users/sign_in', to: 'users/sessions#new'
    post '/users/sign_in', to: 'users/sessions#create'
    delete '/users/sign_out', to: 'users/sessions#destroy'
    get '/users/sign_up', to: 'users/registrations#new'
    post '/users', to: 'users/registrations#create'
    get '/password/edit', to: 'users/registrations#edit'
    get '/password/update', to: 'users/registrations#update'
  end

  #ルート設定
  root 'plans#top'
  #顧客
  resource :users, only: [:show,:edit,:update] do
    get :leave, on: :collection
    patch :left, on: :member
  end
  namespace :admin do
    #管理者ログイン
    get '/sign_in', to: 'admin#new'
    post '/sign_in', to: 'admin#create'
    delete '/sign_out', to: 'admin#destroy'
    get '/', to: 'admin#index'
    #顧客
    resources :users, only: [:index,:show,:edit,:update]
    #ジャンル
    resources :genres, only: [:index,:edit,:update,:create]
    #プログラミング言語
    resources :languages, only: [:index,:edit,:update,:create]
  end

  #管理者ログイン
  namespace :admin do
    get '/sign_in', to: 'admin#new'
    post '/sign_in', to: 'admin#create'
    delete '/sign_out', to: 'admin#destroy'
    get '/', to: 'admin#index'
  #ジャンル
  resources :genres, only: [:index,:edit,:update,:create]
  #プログラミング言語
  resources :languages, only: [:index,:edit,:update,:create]
  end

  #ルーム
  resources :rooms, only: [:index,:edit,:update,:create] do
    get :top, on: :collection
  end
  #チャット
  resources :chats, only:[:index,:edit,:update,:create]

end