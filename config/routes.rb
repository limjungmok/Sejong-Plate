Rails.application.routes.draw do

  get 'facebook_users/edit'

  get 'facebook_users/update'

  #static_pages controller
  root             'static_pages#home'
  get 'about'   	=> 'static_pages#about'
  get 'contact' 	=> 'static_pages#contact'

  #Facebook
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  
  #users controller(로그인 페이스북만 쓰면 필요없음)
  get 'signup'		=> 'users#new'

  resources :users
  resources :facebook_users

  
end
