Rails.application.routes.draw do
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

scope module: 'customers' do
  #public/homesのtopアクションを表示
  root to: 'public/homes#top'
  resources :public, only:[:show, :index]
  get 'about' => 'public/homes#about'
end

namespace :customers do
end

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
