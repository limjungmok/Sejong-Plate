Rails.application.routes.draw do

  get 'comments/create'

  get 'comments/edit'

  get 'comments/destroy'

  get 'albums/new'

  get 'facebook_users/edit'
  get 'facebook_users/update'

  #static_pages controller
  root             'static_pages#home'
  get 'about'   	=> 'static_pages#about'
  get 'contact' 	=> 'static_pages#contact'
  get 'new_store' => 'static_pages#new_store'

  #Facebook
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
    
  resources :sessions, only: [:create, :destroy]
  
  #users controller(로그인 페이스북만 쓰면 필요없음)
  get 'signup'		=> 'users#new'

  resources :facebook_users
  resources :restaurants do
    resources :comments
  end

end
