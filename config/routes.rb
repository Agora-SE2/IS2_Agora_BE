Rails.application.routes.draw do
  resources :project_tags
  resources :project_tags
  devise_for :users
  resources :tags
  resources :featured_projects
  resources :opinions
  resources :galleries
  resources :law_projects
  get 'home/index'
    root 'home#index'
end
