Rails.application.routes.draw do
  root 'home#index'

  resources :links, only: [:index, :create, :update, :destroy]
  resources :reminders, only: [:index, :create]
end
