Rails.application.routes.draw do

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
    resources :carts, only:[:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only:[:new, :confirm, :thanks, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    get 'customers/my_page' => 'customers#show'
    patch 'customers/update' => 'customers#update'
    get 'customers/bye' => 'customers#bye'
    patch 'customers/adios' => 'customers#adios'
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
