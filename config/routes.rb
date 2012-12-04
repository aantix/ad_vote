Promotion::Application.routes.draw do
  resources :votes

  resources :ads, :only => [:show]

  resources :studies do
    collection do
      get :refresh
    end
  end

  resources :contacts

  authenticated :user do
    root :to => 'studies#index'
  end
  root :to => "studies#index"
  devise_for :users, :path => "auth", :path_names => { :sign_in => 'login', :sign_out => 'logout', :password => 'secret', :confirmation => 'verification', :unlock => 'unblock', :registration => 'register', :sign_up => 'sign_up' }
  devise_for :users
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
  end
  resources :users, :only => [:show, :index]
end
