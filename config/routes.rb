Rails.application.routes.draw do
  
  patch 'customers' => 'public/customers#update'

  root to: 'public/homes#top'
   get'about' => 'public/homes#about'
   get 'customers/edit' => 'public/customers#edit'
   devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  scope module: :public do
    resources :homes, only:[:about]
    resources :items, only:[:index,:show]
    resources :carts, only:[:index, :update, :destroy, :create]
    resources :orders, only:[:new, :confirm, :thanks, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    get 'customers/my_page' => 'customers#show'
    get 'customers/edit' => 'customers#edit'
    get 'customers/bye' => 'customers#bye'
    patch 'customers/adios' => 'customers#adios'
    post 'orders/confirm' => 'orders#confirm'
    delete 'carts' => 'carts#all', as: 'all'
  end

  namespace :admin do
    root :to => 'homes#top'
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :update, :edit]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
