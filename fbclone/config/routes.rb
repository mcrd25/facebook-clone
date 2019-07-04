Rails.application.routes.draw do
  get 'friendships/create'
  get 'friendships/destroy'
  devise_for :users

  resource :profile, only: [:show, :edit], path: '/:username' do 
    resources :posts
    resources :friend_requests, only: [:create, :destroy]
    resources :friends, only: [:index]
  end

  namespace :requests do
	 resources :sent_requests
	 resources :received_requests
	end

  resources :friendships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]

  root 'home#index'
end
