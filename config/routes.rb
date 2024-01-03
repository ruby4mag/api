Rails.application.routes.draw do
  get 'dashboard/index'
  resources :unlock_accounts, controller: 'rails_jwt_auth/unlock_accounts', only: %i[update]
  resources :invitations, controller: 'rails_jwt_auth/invitations', only: [:show, :create, :update]
  resources :reset_passwords, controller: 'rails_jwt_auth/reset_passwords', only: [:show, :create, :update]
  resources :confirmations, controller: 'rails_jwt_auth/confirmations', only: [:create, :update]

  resource :profile, controller: 'rails_jwt_auth/profiles', only: %i[show update] do
    collection do
      put :email
      put :password
    end
  end
      
  resource :registration, controller: 'rails_jwt_auth/registrations', only: [:create]
  resource :session, controller: 'rails_jwt_auth/sessions', only: [:create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
