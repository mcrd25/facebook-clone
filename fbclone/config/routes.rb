Rails.application.routes.draw do
  devise_for :users

  resource :profile, only: [:show, :edit], path: '/:username' do 
    resources :posts, only: [:index, :show, :edit, :update, :new, :create]
  end

  root 'home#index'
end
