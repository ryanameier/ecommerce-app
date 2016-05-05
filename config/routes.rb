Rails.application.routes.draw do


  devise_for :users
 #get "/product", to: #'products#one_product'
  root 'products#index'
  get "/products", to: 'products#index'
  get "/products/new", to: 'products#new'
  post "/products", to: 'products#create'
  get "/products/:id", to: 'products#show'
  get "/products/:id/edit", to: 'products#edit'
  patch "/products/:id", to: 'products#update'
  delete "/products/:id", to: 'products#destroy'
  post "/search", to: 'products#search'

  #suppliers
  get "/suppliers", to: 'suppliers#index'
  get "/suppliers/new", to: 'suppliers#new'

  #carted products
  post '/carted_products', to: 'carted_products#create'
  get '/carted_products', to: 'carted_products#index' 
  delete "/carted_products/:id", to: 'carted_products#destroy'

  #orders
  patch '/orders/:id', to: 'orders#update'
  get "/orders/:id", to: 'orders#show'
  post "/orders", to: 'orders#create'

end
