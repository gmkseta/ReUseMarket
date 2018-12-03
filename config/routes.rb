Rails.application.routes.draw do
  resources :singos
  get 'trades/list'
  get 'trades/:id/my_list'=>'trades#my_list',as: 'trades_my_list'
  get 'trades/:id/detail'=>'trades#detail' ,as: 'trade_detail'
  post 'trades/mktr'=>'trades#mktr'
  get 'home/home'
  get 'trades/:id/update_status'=>'trades#update_status' ,as: 'trade_update_status'
  get 'trades/:id/cancel'=>'trades#cancel' ,as: 'trade_cancel'
  get 'home/user_profile',as: 'user_profile'

  patch 'trade/:id'=>'trades#update_review',as: 'trade'
  resources :chats
  resources :items
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#home"

end
