Rails.application.routes.draw do
  resources :likes, defaults: {format: :json}
  post 'token/index', defaults: {format: :json}

  get 'users/index', defaults: {format: :json}

  get 'report/index', defaults: {format: :json}

  resources :project_tags, defaults: {format: :json}
  devise_for :users, controllers: {sessions: 'users/sessions', registrations:"users/registrations", confirmations: 'confirmations'}, defaults: {format: :json}
  match '/users',   to: 'users#index',   via: 'get', defaults: {format: :json}
  match '/users/:id',   to: 'users#update',   via: 'put', defaults: {format: :json}
  match '/users/:id',     to: 'users#show',       via: 'get', defaults: {format: :json}

  resources :tags, defaults: {format: :json}
  resources :featured_projects, defaults: {format: :json}
  resources :opinions, defaults: {format: :json}
  resources :galleries, defaults: {format: :json}
  resources :law_projects, defaults: {format: :json}
  scope '/stats' do
    resources :more_upvoted, only: [:index], :controller => 'stats/more_upvoted', defaults: {format: :json}
    resources :more_downvoted, only: [:index], :controller => 'stats/more_downvoted', defaults: {format: :json}
    resources :more_commented, only: [:index], :controller => 'stats/more_commented', defaults: {format: :json}
  end
  get 'home/index', defaults: {format: :json}
  root 'home#index'
end