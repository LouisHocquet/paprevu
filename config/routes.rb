Rails.application.routes.draw do
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :activities
  resources :discoveries, only: [:show, :index, :new, :create]
  get "loader_discovery", to: "discoveries#loader", as: :loader_discovery
  # get "random_discovery", to: "discoveries#random_discovery", as: :random_discovery
  get "maps_sandbox", to: "pages#maps_sandbox", as: :maps_sandbox
end
