Rails.application.routes.draw do
  devise_for :users, 
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }
  root to: 'topics#index'
  resources :topics, only: [:index, :new, :create] do
    resources :posts, only: [:index, :create]
  end
end