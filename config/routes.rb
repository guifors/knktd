Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages, only: %i[create] do
    collection do
      get :confirm
    end
  end

  resources :challenges, only: %i[show] do
    member do
      get :companies
    end
  end
  resources :proposals, only: %i[create]
  resources :startups, only: %i[create]
  resources :users, only: %i[create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
