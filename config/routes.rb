Ghoulpool::Application.routes.draw do

  devise_for :users, :path_names => { :sign_up => "register", :sign_in => "login", :sign_out => "logout"  }
  devise_scope :user do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end
  
  root :to => "pages#home"
  
  match "dashboard" => 'dashboard#index', :via => :get
  
  resources :entries
  resources :ghouls, :only => [:show, :new, :create]
  resources :pools
  resources :rules
  
end
