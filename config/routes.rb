Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'agreement', to: 'pages#agreement'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :courses, only: [:index, :show] do
	  resources :bookings, only: [:create]
  end
  namespace :dashboard do
	  resources :bookings, only: [:index]
  end
  resources :bookings, only: [:update]
  resources :chef_profiles, only: [:show, :create] do
	  resources :courses, only: [:new, :create]
  end
end
