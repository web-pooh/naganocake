Rails.application.routes.draw do
  
  root to: 'public/homes#top'

  scope :public do
    resources :homes, only:[:about]
    resources :items, only:[:index,:show]
    resources :registrations, only:[:new, :create]
    resources :sessions, only:[:new, :create, :destroy]
    resources :customers, only:[:show, :edit, :update, :bye, :adios]
    resources :carts, only:[:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only:[:new, :confirm, :thanks, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end
  
  
  namespace :admin do
    get 'orders/show'
  end

  namespace :admin do
    get 'customers/index'
  end

  namespace :admin do
    get 'customers/show'
  end

  namespace :admin do
    get 'customers/edit'
  end

  namespace :admin do
    get 'genres/index'
  end

  namespace :admin do
    get 'genres/edit'
  end

  namespace :admin do
    get 'items/index'
  end

  namespace :admin do
    get 'items/new'
  end

  namespace :admin do
    get 'items/show'
  end

  namespace :admin do
    get 'items/edit'
  end

  namespace :admin do
    get 'homes/top'
  end

  namespace :public do
    get 'addresses/index'
  end

  namespace :public do
    get 'addresses/edit'
  end

  namespace :public do
    get 'orders/new'
  end

  namespace :public do
    get 'orders/confirm'
  end

  namespace :public do
    get 'orders/thanks'
  end

  namespace :public do
    get 'orders/index'
  end

  namespace :public do
    get 'orders/show'
  end

  namespace :public do
    get 'carts/index'
  end

  namespace :public do
    get 'customers/show'
  end

  namespace :public do
    get 'customers/edit'
  end

  namespace :public do
    get 'customers/bye'
  end

  namespace :public do
    get 'items/index'
  end

  namespace :public do
    get 'items/show'
  end

  namespace :public do
    get 'homes/top'
  end

  namespace :public do
    get 'homes/about'
  end
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
