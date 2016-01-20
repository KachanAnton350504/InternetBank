Rails.application.routes.draw do
   
  get '/deposit_department/index', to: 'deposit_department#index', as: 'deposit_index'

  get '/deposit_department/add', to: 'deposit_department#add_deposit', as: 'new_deposit_type'

  get '/deposit_department/:id', to: 'deposit_department#details', as: "details_deposit_type"

  get '/deposit_department/:id/edit', to: 'deposit_department#edit_deposit', as: "edit_deposit_type"

  post '/deposit_department', to: 'deposit_department#create_deposit', as: "create_deposit_type"

  patch '/deposit_department/:id', to: 'deposit_department#update_deposit', as: "update_deposit_type"

  delete '/deposit_department/:id', to: 'deposit_department#delete_deposit', as: "delete_deposit_type"

 
 get '/sessions/new', to: 'sessions#new', as: 'signin'

  post '/sessions/create', to: 'sessions#create', as: 'create_session'

  delete '/sessions/destroy/:id', to: 'sessions#destroy', as: 'signout'




  resources :clients
  get '/clients/new', to: 'clients#new', as: 'signup'

  get 'clients/create'

  get '/clients/show/:id', to: 'clients#show', as: 'client_profile'

  get 'clients/get_credit'

  get 'clients/get_credit_information'

  get 'clients/checkout_credit'

  get 'clients/get_deposit'

  get 'clients/get_deposit_information'

  get 'clients/checkout_deposit'

  get 'clients/client_informaton'

  get 'clients/message'

  root to: 'static_pages#home'

  get 'static_pages/home', to: 'static_pages#home', as: 'home'

  get 'static_pages/help', to: 'static_pages#help', as: 'help'

  get 'static_pages/about', to: 'static_pages#about', as: 'about'

 
end
