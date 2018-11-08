Rails.application.routes.draw do
  get 'home/home'
  resources :items
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#home"

end
