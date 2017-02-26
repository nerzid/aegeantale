Rails.application.routes.draw do
  devise_for :users, controllers: {
      :sessions => "users/sessions",
      :registrations => "users/registrations"}
  resources :users

  devise_scope :user do
    authenticated :user do
      root "users#index"
    end
    unauthenticated :user do
      root "devise/sessions#new"
    end
  end
end
