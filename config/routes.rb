Rails.application.routes.draw do
  devise_for :users, controllers: {
      :sessions => "users/sessions",
      :registrations => "users/registrations"}

  devise_scope :user do
    authenticated :user do
      resources :users
      resources :posts, :only => [:new, :create]
      resources :groups, :only => [:show, :new, :create]
      post "groups/request_join/:id", :to => "groups#request_join", :as => "request_join_group"
      put "groups/accept_join_request/:id/:user_id", :to => "groups#accept_join_request", :as => "accept_join_request"

      root "users#index"
    end
    unauthenticated :user do
      get "/home/faq", to: "home#faq"

      root "devise/sessions#new"
    end
  end
end
