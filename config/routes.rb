Rails.application.routes.draw do
  devise_for :users

  get 'home/faq', to: 'home#faq', path: '/faq'

  root to: 'home#index'
end
