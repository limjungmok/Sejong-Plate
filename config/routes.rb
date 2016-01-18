Rails.application.routes.draw do

  get 'albums/new'
  get 'login' => 'users#login'
  
  get 'facebook_users/edit'
  get 'facebook_users/update'

  #static_pages controller
  root             'restaurants#index'
  get 'contact' 	=> 'static_pages#contact'

  #Facebook
  get 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  get 'auth/failure', to: redirect('/'), via: [:get, :post]
  get 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

  patch 'like' => 'restaurants#like'
  patch 'unlike' => 'restaurants#unlike'
    
  resources :sessions, only: [:create, :destroy]
  
  #users controller(로그인 페이스북만 쓰면 필요없음)
  
  resources :users
  

  resources :facebook_users
  resources :restaurants do
    resources :comments
  end
  resources :valuations

end
