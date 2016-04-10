Rails.application.routes.draw do
  root :to => 'pages#homepage'
  resources :users, :notes, :classifications, :revisions

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/searcher' => 'notes#index'
  post '/searcher' => 'notes#index'
end
