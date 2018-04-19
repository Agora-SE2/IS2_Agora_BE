Rails.application.routes.draw do
  get 'report/index'

 resources :project_tags
  resources :project_tags
  #devise_for :users, controllers: { confirmations: 'confirmations', omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :tags
  resources :featured_projects
  resources :opinions
  resources :galleries
  resources :law_projects
  get 'home/index'
  root 'home#index'
end
