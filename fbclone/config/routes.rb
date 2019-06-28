Rails.application.routes.draw do
  devise_for :users

  resource :profile, only: [:show, :edit], path: '/:username' do 
    resources :posts, only: [:index, :show]
  end
end
