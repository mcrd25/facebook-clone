Rails.application.routes.draw do
  devise_for :users

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

  resources :notifications, only: [:index]
  

  root 'home#index'
end
