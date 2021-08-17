Rails.application.routes.draw do
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
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
  
end
