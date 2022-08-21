Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#index'

  resources :logs, only: [:index, :new, :create, :destroy, :edit, :update]
end
