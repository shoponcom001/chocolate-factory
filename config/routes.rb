Rails.application.routes.draw do

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
  
 root to: 'public/homes#top'
 get '/about', to: 'public/homes#about'
 
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
  resources :ranks, except: [:show]
  resources :colors, except: [:show]
  resources :lasts, except: [:show]
  
  resources :users, only: [:index, :show, :edit, :update]
  
  
end

end
