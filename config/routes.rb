Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'tasks#index'
  resources :tasks
  resources :notifications,only: [:index]
  namespace :admin do
    resources :users
  end
end
