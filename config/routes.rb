Rails.application.routes.draw do

  #static_pages controller
  root             'static_pages#home'
  get 'about'   	=> 'static_pages#about'
  get 'contact' 	=> 'static_pages#contact'
  
  #users controller
  get 'signup'		=> 'users#new'
  resources :users

  #sessions controller
  get 'login' 		=> 'sessions#new'
  post 'login'		=> 'sessions#create'
  delete 'logout' 	=> 'sessions#destroy'
  
end
