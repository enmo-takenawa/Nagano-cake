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
    get 'shipping_addresses/:id' => 'shipping_address#new'
    resources :shipping_addresses, except: [:new, :edit]
    resources :goods, only: [:index, :show]
    resources :cart_items
    delete 'cart_items' => 'cart_items#destroy_all'
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
