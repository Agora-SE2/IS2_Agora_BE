Rails.application.routes.draw do
  get 'users/index'

  get 'report/index'

 resources :project_tags
  resources :project_tags
  devise_for :users, controllers: {sessions: 'users/sessions', registrations:"users/registrations", confirmations: 'confirmations'}
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',   to: 'users#update',   via: 'put'
  match '/users/:id',     to: 'users#show',       via: 'get'
  resources :tags
  resources :featured_projects
  resources :opinions
  resources :galleries
  resources :law_projects
  scope '/stats' do
    resources :more_upvoted, only: [:index], :controller => 'stats/more_upvoted'
    resources :more_downvoted, only: [:index], :controller => 'stats/more_downvoted'
    resources :more_commented, only: [:index], :controller => 'stats/more_commented'
  end
  get 'home/index'
  root 'home#index'
end
