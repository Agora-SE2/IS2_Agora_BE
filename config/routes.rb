Rails.application.routes.draw do
  post 'token/index'

  get 'users/index'

  get 'report/index'

 resources :project_tags
  resources :project_tags
  devise_for :users, controllers: {sessions: 'users/sessions', registrations:"users/registrations", confirmations: 'confirmations'}
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  resources :tags
  resources :featured_projects
  resources :opinions
  resources :galleries
  resources :law_projects, defaults: {format: :json}
  get 'home/index'
  root 'home#index'
end
