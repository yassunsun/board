Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'topics#index'
  resources :topics, only: [:index, :new, :create] do
    resources :posts, only: [:index, :create]
  end
end