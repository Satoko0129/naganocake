Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

#urlにpublic/と付かない
scope module: 'public' do
  #public/homesのtopアクションを表示
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'items' => 'items#index'
  get 'items/:id' => 'items#show', as: 'item'
  resources :genres, only: [:index]
  patch 'customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw' #asオプション=ルーティングに名前を指定出来る
  get 'customers/my_page' => 'customers#show'
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information' => 'customers#update'
  get 'costomers/quit' => 'customers#quit'
  post 'orders/log' => 'orders#log', as: 'orders_log'
  get 'orders/thanks' => 'orders#thanks'
  resources :orders, only: [:new, :create, :index, :show] #[]内のアクションのみを指定
  resources :cart_items, only: [:index, :create, :update, :destroy]
  delete 'cart_items' => 'cart_items#destroy_all', as: 'destroy_all'
  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  get '/genre/search' => 'searches#genre_search'
end


devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: 'homes#top'
  resources :customers, only: [:index, :show, :edit, :update]
  resources :genres, only: [:index, :edit, :create, :update]
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  resources :orders, only: [:show, :update]
  resources :order_details, only: [:update]
end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end