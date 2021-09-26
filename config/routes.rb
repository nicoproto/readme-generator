Rails.application.routes.draw do
  devise_for :users
  get '/kitchensink', to: 'pages#kitchensink' if Rails.env.development?
  root to: 'pages#home'

  resources :readmes, only: [:new, :create, :show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :gems, param: :query, only: [ :show, :index ]
    end
  end
end
