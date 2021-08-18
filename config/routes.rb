Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  } #管理者ログイン画面へのルーティング

  devise_for :customers


  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  resources :customers, only: [:edit, :show, :update]
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  resources :shipping_addresses
  resources :goods, only: [:index, :show]
  resources :cart_items
  delete 'cart_items' => 'cart_items#destroy_all'
  resources :orders
  post 'orders/confirmation' => 'orders#confirmation'
  get 'orders/success' => 'orders#success'

  namespace :admins do
    resources :orders
    patch 'ordered_goods/:id' => 'ordered_goods#update'
    resources :goods
    resources :customers, except: [:destroy]
    resources :genres, except: [:destroy]
  end

end
