Rails.application.routes.draw do
  devise_for :users, controllers: {
      :sessions => "users/sessions",
      :registrations => "users/registrations"}

  devise_scope :user do
    authenticated :user do
      resources :users
      resources :posts, :only => [:new, :create]
      resources :groups, :only => [:show, :new, :create]

      root "users#index"
    end
    unauthenticated :user do
      get "/home/faq", to: "home#faq"

      root "devise/sessions#new"
    end
  end
end
