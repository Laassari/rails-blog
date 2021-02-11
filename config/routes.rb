# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :likes
    resources :comments
  end

  get '/login', to: 'login#new'
  post '/login', to: 'login#create'
  delete '/login', to: 'login#destroy'
  put '/signup', to: 'users#update'

  get '/signup', to: 'users#new', as: 'signup_page'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'
  get '/forgot_password', to: 'password#show'
  post '/forgot_password', to: 'password#create'
  get '/password_reset/:token', to: 'password#reset', as: 'password_reset'
  post '/password_reset/:token', to: 'password#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect(path: '/articles')
end
