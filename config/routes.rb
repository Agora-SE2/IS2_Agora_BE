Rails.application.routes.draw do
  resources :likes, defaults: {format: :json}
  post 'token/index'

  get 'users/index'

  get 'report/index'

  resources :project_tags, defaults: {format: :json}
  devise_for :users, controllers: {sessions: 'users/sessions', registrations:"users/registrations", confirmations: 'confirmations'}
  match '/users',   to: 'users#index',   via: 'get'
  match '/users/:id',   to: 'users#update',   via: 'put'
  match '/users/:id',     to: 'users#show',       via: 'get'
<<<<<<< HEAD
  resources :tags, defaults: {format: :json}
  resources :featured_projects, defaults: {format: :json}
  resources :opinions, defaults: {format: :json}
  resources :galleries, defaults: {format: :json}
  resources :law_projects, defaults: {format: :json}
=======
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
>>>>>>> 4a1e42bae79d545bce4c01bbdda08b4bd092d6ff
  get 'home/index'
  root 'home#index'
end
