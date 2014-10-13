PostitTemplate::Application.routes.draw do
  root to: 'users#new'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :slots, only: [:index, :show, :new, :create, :edit, :update]
  resources :instructors, only: [:new, :create, :edit, :update, :show]
  
end
