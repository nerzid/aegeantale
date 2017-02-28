Rails.application.routes.draw do
  devise_for :users, controllers: {
      :sessions => "users/sessions",
      :registrations => "users/registrations"}
  resources :users

  devise_scope :user do
    authenticated :user do

      get "/users/:id", to: "users#show"
      get "/posts/new", to: "posts#new"
      post "/posts", to: "posts#create"

      root "users#index"
    end
    unauthenticated :user do
      get "/home/faq", to: "home#faq"

      root "devise/sessions#new"
    end
  end
end
