Rails.application.routes.draw do
  
  root to: 'public/homes#top'
  
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
    resources :customers, only:[:show, :edit, :update, :bye, :adios]
    resources :carts, only:[:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only:[:new, :confirm, :thanks, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
  end
  
  namespace :admin do
    resources :homes, only:[:top]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :update, :edit]
    resources :orders, only:[:show, :update]
    resources :order_details, only:[:update]
  end

 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
