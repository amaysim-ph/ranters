Rails.application.routes.draw do
  devise_for :ranters

  root 'home#index'

  resources :rants, only: [:create]
end
