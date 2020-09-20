Rails.application.routes.draw do

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
  root 'users#show'
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