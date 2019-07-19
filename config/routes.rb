Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#home'
  get    '/home'       =>     'static_pages#home'
  get    '/help'       =>     'static_pages#help'
  get    '/about'      =>     'static_pages#about'
  get    '/contact'    =>     'static_pages#contact'
  get    '/signup'     =>     'users#new'
  post   '/signup'     =>     'users#create'
  get    '/groups/new' =>  'groups#new'
  post   '/groups/new' =>  'groups#create'
  get    '/login'      =>     'sessions#new'
  post   '/login'      =>     'sessions#create'
  delete '/logout'     =>     'sessions#destroy'
  resources :users do
    get :groups, on: :member
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :games, only: [:create, :destroy]
  resources :group_memberships, only: [:create, :destroy]
  resources :groups do
    get :users, on: :member
  end
  resources :posts, only: [:create, :destroy]
end
