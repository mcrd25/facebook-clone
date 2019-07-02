Rails.application.routes.draw do
  devise_for :users

  resource :profile, only: [:show, :edit], path: '/:username' do 
    resources :posts
    resources :friend_requests, only: [:create]
  end

  namespace :friends do
	 resources :sent_requests
	 resources :received_requests
	end

  root 'home#index'
end
