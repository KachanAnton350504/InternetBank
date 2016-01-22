Rails.application.routes.draw do
   


  # # # # DEPOSITORS # # # #
  get '/deposers/index', to: 'deposers#index', as: 'deposer_index'

  get '/deposers/information/:id', to: 'deposers#information', as: 'descry_deposit'

  get '/deposers/accept/:id/:acceptance', to: 'deposers#accept', as: 'accept_deposit' 
# # # # # # # # # # # # #


 



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

  post '/clients/create', to: 'clients#create', as: 'create_client'

  get '/clients/show/:id', to: 'clients#show', as: 'client_profile'

  get '/clients/get_credit', to: 'clients#get_credit', as: 'get_credit' 

  get '/clients/get_deposit/:id', to: 'clients#get_deposit', as: 'get_deposit'

  get '/clients/get_credit_information/:id', to: 'clients#get_credit_information', as: 'get_credit_information' 

  get '/clients/checkout_credit/:id', to: 'clients#checkout_credit', as: 'checkout_credit'

  post '/clients/query_credit', to: 'clients#query_credit', as: 'query_credit'

  get '/clients/get_deposit_information/:id', to: 'clients#get_deposit_information', as: 'get_deposit_information' 

  get '/clients/deposits_client_information/:id', to: 'clients#deposits_client_information', as: 'deposits_client_information' 
  
  get '/clients/checkout_deposit/:id', to: 'clients#checkout_deposit', as: 'checkout_deposit'

  post '/clients/query_deposit', to: 'clients#query_deposit', as: 'query_deposit'

  get '/clients/information/:id', to: 'clients#client_information', as: 'client_information'

  get '/clients/messages/:id', to: 'clients#messages', as: 'messages'

  delete '/clients/delete_message/:id', to: 'clients#delete_message', as: 'delete_message'

  get '/clients/client_credit_information/:client_id/:credit_id', to: 'clients#client_credit_information', as: 'client_credit_information'

  get '/clients/client_deposit_information/:client_id/:deposit_id', to: 'clients#client_deposit_information', as: 'client_deposit_information'
# # # # # # # # # # #
  root to: 'static_pages#home'

  get 'static_pages/home', to: 'static_pages#home', as: 'home'

  get 'static_pages/help', to: 'static_pages#help', as: 'help'

  get 'static_pages/about', to: 'static_pages#about', as: 'about'

  # # # # EXCHANGE # # # #
get '/exchange/:id', to: 'exchange#clients_bill_exchange', as: 'exchange'

post '/exchange/apply', to: 'exchange#apply', as: 'apply'
# # # # # # # # # # # # # 

 
end
