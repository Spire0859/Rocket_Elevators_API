Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#home'
  resources :quotes
  get 'pages/back'
  get 'residential', to: 'pages#residential'
  get 'commercial', to: 'pages#commercial'
  get 'quote', to: 'pages#quote'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Route for Homepage

end
