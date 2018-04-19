Rails.application.routes.draw do
  get 'users/index'

  get 'report/index'

 resources :project_tags
  resources :project_tags
  devise_for :users, controllers: {sessions: 'users/sessions'}
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  resources :tags
  resources :featured_projects
  resources :opinions
  resources :galleries
  resources :law_projects
  get 'home/index'
  root 'home#index'
end
