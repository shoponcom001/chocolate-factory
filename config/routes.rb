Rails.application.routes.draw do
 
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/unsubscribe'
    get 'users/withdraw'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/comfirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'items/show'
  end
  namespace :public do
    get 'designs/index'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin do
    get 'lasts/index'
    get 'lasts/new'
    get 'lasts/create'
    get 'lasts/show'
    get 'lasts/edit'
    get 'lasts/update'
    get 'lasts/destroy'
  end
  namespace :admin do
    get 'colors/index'
    get 'colors/new'
    get 'colors/create'
    get 'colors/show'
    get 'colors/edit'
    get 'colors/update'
    get 'colors/destroy'
  end
  namespace :admin do
    get 'ranks/index'
    get 'ranks/new'
    get 'ranks/create'
    get 'ranks/show'
    get 'ranks/edit'
    get 'ranks/update'
    get 'ranks/destroy'
  end
  namespace :admin do
    get 'designs/index'
    get 'designs/new'
    get 'designs/create'
    get 'designs/show'
    get 'designs/edit'
    get 'designs/update'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  
  
  
 root to: 'public/homes#top'
 get '/adout', to: 'public/homes#about'
 
 get '/designs', to: 'public/designs#index'
 
 get '/items/:id', to: 'public/items#show'
 
 resources :orders, module: :public, only: [:new, :create, :index, :show]
  post '/orders/confirm', to: 'public/orders#confirm'
  get '/orders/complete', to: 'public/orders#complete'
  
resources :users, module: :public, only: [:edit, :update]
  get '/users/my_page', to: 'public/users#show'
  get 'users/:id/my_page', to: 'public/users#unsubscribe', as: 'user_unsubscribe'
  
namespace :admin do
  root to: 'homes#top'
  
  resources :orders, only: [:show, :update] do
    patch '/order_details/:id', to: 'order_details#update', as: 'details'
  end
  
  resources :designs, except: [:destroy]
  resources :ranks
  resources :colors
  resources :last
  
  resources :users, only: [:index, :show, :edit, :update]
  
  
end

devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

devise_for :users, controllers: {
  sessions:      'users/sessions',
  passwords:     'users/passwords',
  registrations: 'users/registrations'
}
  
end
