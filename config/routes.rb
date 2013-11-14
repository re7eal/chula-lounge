ChulaLounge::Application.routes.draw do

  resources :want_courses

  resources :have_courses

  resources :trade_messages

  resources :trades

  get 'my_trades', to: 'trades#my_trades'

  get 'search_trades', to: 'trades#search'
  
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end