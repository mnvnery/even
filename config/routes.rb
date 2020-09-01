Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :houses do
    resources( :bills, {only: [:new, :create]})
    # Method (symbol, hash { key/symbol value/array})
  end

  resources( :bills, {only: [:edit, :update, :delete]})
end
