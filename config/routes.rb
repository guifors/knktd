Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :startups, only: %i[create]
  resources :users, only: %i[create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
