Rails.application.routes.draw do
  root 'main#index'
  resource :session
  resource :registrations
  resource :password_reset
  resource :password
  resources :confirmations, only: %i[create new], param: :confirmation_token do
    member do
      get 'confirm_email'
    end
  end
end
