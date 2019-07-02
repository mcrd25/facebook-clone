Rails.application.routes.draw do
  devise_for :users

  resource :profile, only: [:show, :edit], path: '/:username' do 
    resources :posts
    resources :friend_requests, only: [:create]
  end

  root 'home#index'
end
