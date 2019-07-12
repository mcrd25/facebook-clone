Rails.application.routes.draw do
  devise_for :users

  resources :notifications, only: [:index]

  resource :profile, only: [:show, :edit], path: '/:username' do 
    resources :posts do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :edit, :update, :destroy]
    end
    resources :friend_requests, only: [:create, :destroy]
    resources :friends, only: [:index]
  end

  namespace :requests do
	 resources :sent_requests
	 resources :received_requests
	end

  resources :friendships, only: [:create, :destroy]

  
  

  root 'home#index'
end
