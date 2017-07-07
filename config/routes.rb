Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root :to => 'users#index'
  resources :users
  # do
  #   resources :products
  # end
end
