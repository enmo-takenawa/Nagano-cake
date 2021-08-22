Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  } #管理者ログイン画面へのルーティング

  devise_for :customers, controllers: {
    sessions: 'public/devise/sessions'
  }


  scope module: :public do
    root to: 'homes#top'
    get 'home/about' => 'homes#about'

    resources :customers, only: [:edit, :show, :update]
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    resources :shipping_addresses
    resources :goods, only: [:index, :show]
    resources :cart_items
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders do
      collection do
        post 'confirmation'
        get 'success'
      end
    end
  end


  namespace :admins do
    resources :orders
    patch 'ordered_goods/:id' => 'ordered_goods#update'
    resources :goods
    resources :customers, except: [:destroy]
    resources :genres, except: [:destroy]
  end

end
