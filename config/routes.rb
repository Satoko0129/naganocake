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
end

namespace :public do
  resources :genres, only: [:show]
  patch 'customers/withdraw' => 'customers#withdraw', as: 'customers_withdraw'
  get 'show' => 'customers#show'
  get 'customers/edit' => 'customers#edit'
end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  root to: 'homes#top'
end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
