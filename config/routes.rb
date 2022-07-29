Rails.application.routes.draw do
  resources :interventions
  resources :leads
  resources :customers
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'pages#home'
  resources :quotes
  get 'pages/back'
  get 'pages/customers_location'
  get 'pages/residential'
  get 'pages/commercial'
  get 'pages/quote'
  get 'rails_admin/data/playbriefing', to: 'data#playbriefing'
  get 'residential', to: 'pages#residential'
  get 'commercial', to: 'pages#commercial'
  get 'quote', to: 'pages#quote'
  # get 'admin', to: 'pages#admin'
  post '/contacts', to: 'home#create'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Route for Homepage

end