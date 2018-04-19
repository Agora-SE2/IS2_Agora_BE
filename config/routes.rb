Rails.application.routes.draw do
  get 'report/index'

 resources :project_tags
  resources :project_tags
  devise_for :users, controllers: {sessions: 'users/sessions'}
  resources :users, only: [:index]
  resources :tags
  resources :featured_projects
  resources :opinions
  resources :galleries
  resources :law_projects
  get 'home/index'
  root 'home#index'
end
