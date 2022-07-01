Rails.application.routes.draw do
  root 'pages#home'
  resources :quotes
  get 'pages/back'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #Route for Homepage

end
