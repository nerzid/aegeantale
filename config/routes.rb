Rails.application.routes.draw do
  devise_for :users, controllers: {
      :sessions => "users/sessions",
      :registrations => "users/registrations"}

  get 'home/faq', to: 'home#faq', path: '/faq'

  root to: 'home#index'
end
