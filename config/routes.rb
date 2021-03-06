Rails.application.routes.draw do
  get 'static_pages/home'

  root 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :events
  resources :invites, only: [:create, :update]
end
