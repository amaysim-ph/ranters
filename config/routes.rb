Rails.application.routes.draw do
  devise_for :ranters

  root 'home#index'

  resources :rants, only: [:create]
  resources :ranters, only: [:index, :show] do
    member do
      get 'follow'
    end
  end
end
