Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :after_signup

  resources :houses do
    collection do
      get :onboarding
    end
    resources( :bills, {only: [:edit, :update, :new, :create]})
    # Method (symbol, hash { key/symbol value/array})
    resources :shares, only: [:index]
  end

  resources( :bills, {only: [:destroy]})

  resources :shares, only: [:edit, :update]
end
