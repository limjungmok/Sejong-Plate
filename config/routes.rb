Rails.application.routes.draw do

  #static_pages controller
  root             'static_pages#home'
  get 'about'   	=> 'static_pages#about'
  get 'contact' 	=> 'static_pages#contact'

  #Facebook

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  
  #users controller
  get 'signup'		=> 'users#new'

  resources :users
  
end
