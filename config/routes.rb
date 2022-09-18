Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'home#index'

  resources :logs, only: [:index, :new, :create, :destroy, :edit, :update]

  get '/account_authentications/sent', to: 'account_authentications#sent'
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
