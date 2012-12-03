Promotion::Application.routes.draw do
  resources :votes

  resources :ads, :only => [:show]

  resources :studies

  resources :contacts

  authenticated :user do
    root :to => 'studies#index'
  end
  root :to => "studies#index"
  devise_for :users
  resources :users, :only => [:show, :index]
end
