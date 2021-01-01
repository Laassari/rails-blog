# frozen_string_literal: true

Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  get '/login', to: 'login#new'
  post '/login', to: 'login#create'
  delete '/login', to: 'login#destroy'
  put '/signup', to: 'users#update'

  get '/signup', to: 'users#new', as: 'signup_page'
  post '/signup', to: 'users#create'
  get '/profile', to: 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect(path: '/articles')
end
