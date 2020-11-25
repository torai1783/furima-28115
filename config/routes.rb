Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users, only: [:index, :new, :edit, :update]
end
