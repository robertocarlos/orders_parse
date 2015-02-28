Rails.application.routes.draw do
  resources :orders, only: [:index, :new, :create]

  root "orders#index"
end
