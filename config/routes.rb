Rails.application.routes.draw do
  root to: 'topics#index'
  resources :posts, only: [:index, :create]
end
