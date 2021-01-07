Rails.application.routes.draw do
  get 'topics/index'
  root to: 'posts#index'
  resources :posts, only: [:index, :create]
end
