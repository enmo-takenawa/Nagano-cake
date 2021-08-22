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

    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_customer' #退会画面へ遷移
    patch '/customers/:id/unsubscribe' => 'customers#switch', as: 'unsubscribe_switch_customer' #会員ステータス切り替え
<<<<<<< HEAD
    get 'shipping_addresses/:id' => 'shipping_address#new'
    resources :shipping_addresses, except: [:new, :edit]
=======
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    resources :shipping_addresses
>>>>>>> d752fa20f29d9347285e014baaab967016558b3d
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
