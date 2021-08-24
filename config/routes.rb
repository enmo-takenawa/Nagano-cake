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
    #会員
    resources :customers, only: [:edit, :show, :update]
    #配送先住所
    resources :shipping_addresses, only: [:new, :edit, :update, :create, :destroy]
    get '/customers/:id/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe_customer' #退会画面へ遷移
    patch '/customers/:id/unsubscribe' => 'customers#switch', as: 'unsubscribe_switch_customer' #会員ステータス切り替え
    get 'shipping_addresses/:id' => 'shipping_address#new'
    post 'shipping_addresses/:id' => 'shipping_address#create'
    post 'shipping_address/:id/destroy' => 'shipping_address#destroy'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    resources :shipping_addresses
    resources :goods, only: [:index, :show]
    resources :cart_items do
      collection do
        delete 'destroy_all'
      end
    end
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