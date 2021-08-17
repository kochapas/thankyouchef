Rails.application.routes.draw do
  get 'chef_profiles/show'
  get 'chef_profiles/create'
  get 'courses/index'
  get 'courses/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :courses, only: [:index, :show] do
	  resources :bookings, only: [:create]
  end
  namespace :dashboard do
	  resources :bookings, only: [:index, :update]
  end
  resources :chef_profiles, only: [:show, :create] do
	  resources :courses, only: [:new, :create]
  end
end
