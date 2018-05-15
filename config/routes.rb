Rails.application.routes.draw do
  resources :likes, defaults: {format: :json}
  post 'token/index'

  get 'users/index'

  get 'report/index'

  resources :project_tags, defaults: {format: :json}
  devise_for :users, controllers: {sessions: 'users/sessions', registrations:"users/registrations", confirmations: 'confirmations'}
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  resources :tags, defaults: {format: :json}
  resources :featured_projects, defaults: {format: :json}
  resources :opinions, defaults: {format: :json}
  resources :galleries, defaults: {format: :json}
  resources :law_projects, defaults: {format: :json}
  get 'home/index'
  root 'home#index'
end
