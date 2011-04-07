Ghoulpool::Application.routes.draw do
  
  resources :rules

  resources :entries

  resources :pools

  devise_for :users, :path_names => { :sign_up => "register", :sign_in => "login", :sign_out => "logout"  }
  
  root :to => "pages#home"
  resources :ghouls
  
end
