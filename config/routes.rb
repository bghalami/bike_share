Rails.application.routes.draw do

  root to: 'welcome#home'
  resources :trips, only: [:index, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :orders, only: [:show]

  resources :users, only: [:new, :create, :edit, :update]
  get '/bike_shop', to: 'bike_shop#index'

  get '/dashboard', to: 'users#dashboard'
  post '/dashboard', to: 'users#dashboard'
  get '/stations-dashboard', to: 'stations#dash'
  get '/trips-dashboard', to: 'trips#dashboard'
  get '/condition-dashboard', to: 'conditions#dashboard'

  # resources :stations, only: [:index], param: :slug

  resources :conditions, only: [:index, :show]

  resources :accessories, only: [:show], param: :slug

  resources :checkout, only: [:create]

  post '/cart', to: 'carts#create'
  get '/cart', to: 'carts#show'
  delete '/cart', to: 'carts#destroy'
  put '/cart', to:'carts#increase'
  patch '/cart', to:'carts#decrease'

  namespace :admin do
    resources :stations, only: [:update, :destroy, :new, :create, :edit], param: :slug
    resources :trips, only: [:update, :destroy, :new, :create, :edit]
    resources :conditions, only: [:update, :destroy, :new, :create, :edit]
  end
  resources :stations, only: [:index]

  get '/:slug', to: 'stations#show', as: "station"
end
