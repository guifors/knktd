Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages, only: %i[create] do
    collection do
      get :confirm
    end
    collection do
      get :confirm_two
    end
    collection do
      get :privacy
    end
  end

  resources :challenges, only: %i[index show create] do
    resources :users
    member do
      get :companies
    end
    member do
      get :published
    end
  end
  resources :proposals, only: %i[create]
  resources :startups, only: %i[create]
  resources :users, only: %i[create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
