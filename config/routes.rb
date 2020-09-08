Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :after_signup

  resources :houses do
    collection do
      get :onboarding
    end

    member do
      get :onboarding_link
      get :settings
    end

    resources( :bills, {only: [:edit, :update, :new, :create]})
    # Method (symbol, hash { key/symbol value/array})
    resources :shares, only: [:index]
    resources :memberships, only: [:index, :destroy]

    resources :payments, only: [:show, :create]

    get 'pre_payment/:id', to: 'payments#pre_payment', as: 'pre_payment'
  end

  resources( :bills, {only: [:destroy]})

  resources :shares, only: [:edit, :update]

  mount StripeEvent::Engine, at: '/stripe-webhooks'

end
