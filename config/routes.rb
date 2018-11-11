Rails.application.routes.draw do
  get 'trades/list'
  get 'trades/:id/my_list'=>'trades#my_list'
  get 'trades/:id/detail'=>'trades#detail' ,as: 'trade_detail'
  post 'trades/mktr'=>'trades#mktr'
  get 'home/home'


  resources :items
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#home"

end
