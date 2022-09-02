Rails.application.routes.draw do
  root 'pages#home'
  resources :entries
  get 'signup', to: 'users#new'
  # POST signup?
  resources :users, only: [:new, :create]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
