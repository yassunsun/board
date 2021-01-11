Rails.application.routes.draw do
  devise_for :users
  root to: 'topics#index'
  resources :topics, only: [:index, :new, :create] do
    resources :posts, only: [:index, :create]
  end
end