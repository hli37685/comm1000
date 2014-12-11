PostitTemplate::Application.routes.draw do
  root to: 'users#new'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/users/report', to: 'users#report'
  get '/users.csv', to: 'users#cvs' #remove this one?

  get 'users/q/*specs', controller: "users", action: "query"

  get 'users/export_to_csv', to: 'users#export_to_csv'

  resources :users, only: [:new, :create, :edit, :update, :show, :show_all]
  resources :slots, only: [:index, :show, :new, :create, :edit, :update]
  resources :instructors, only: [:index, :show, :new, :create, :edit, :update]
  
end
