ChulaLounge::Application.routes.draw do

  resources :want_courses

  resources :have_courses

  resources :trade_messages

  resources :trades
  resources :dislikes
  resources :likes

  resources :faculties
  resources :curriculums
  resources :teaches
  resources :courses
  resources :ratings
  resources :comments
  resources :professors
  get 'my_trades', to: 'trades#my_trades'

  get 'search_trades', to: 'trades#search'
  
  root :to => "home#index"
  get 'pages/' => 'pages#index'
  post 'save/courses' => 'courses#register'
  get 'pages/nav/:id' => 'pages#nav', :constraints => { :id => /[0-9]+(\%7C[0-9]+)*/ }
  get 'pages/nav/:id/course/:cid' => 'pages#course_index', :constraints => { :id => /[0-9]+(\%7C[0-9]+)*/, :cid => /[0-9]+(\%7C[0-9]+)*/ }
  get 'pages/course_register' => 'pages#course_register'
  get 'query/courses' => 'courses#search_query'
  get 'query/curriculums' => 'courses#curriculum_query'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end