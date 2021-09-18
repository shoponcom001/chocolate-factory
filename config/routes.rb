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

 resources :items, module: :public, only: [:show, :create]

 resources :orders, module: :public, only: [:new, :create, :index, :show] do
    collection do
      get  'purchase/:id'=>  'items#purchase', as: 'purchase'
      post 'pay/:id'=>   'items#pay', as: 'pay'
      get  'done'=>      'items#done', as: 'done'
    end
  end
 
  post '/orders/confirm', to: 'public/orders#confirm'
  get '/orders/complete', to: 'public/orders#complete'

resources :users, module: :public, only: [:edit, :update]
  get '/users/my_page', to: 'public/users#show'
  get 'users/:id/my_page', to: 'public/users#unsubscribe', as: 'user_unsubscribe'
  patch '/users/:id/withdraw', to: 'public/users#withdraw', as: 'users_withdraw'

namespace :admin do
  root to: 'homes#top'

  resources :orders, only: [:show, :update] do
    patch '/order_details/:id', to: 'order_details#update', as: 'details'
  end

  resources :designs, except: [:destroy]
  resources :ranks, except: [:show]
  resources :colors, except: [:show]
  resources :lasts, except: [:show]
  resources :periods, only: [:new, :create]

  resources :users, only: [:index, :show, :edit, :update]


end

end
