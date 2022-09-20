Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users do   
        resources :reservations
      end
      resources :doctors 
    end
  end

  post "/login", to: "sessions#create"
  get "/authorized", to: "sessions#show"
  # Defines the root path route ("/")
  # root "articles#index"
end
