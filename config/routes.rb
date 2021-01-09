Rails.application.routes.draw do
  root to: 'topics#index'
  resources :topics, only: [:index, :new, :create]
  resources :posts, only: [:index, :create]
end