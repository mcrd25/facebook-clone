Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/:username' => 'profiles#show'
  get '/:username/edit' => 'profiles#edit'
  resources :profiles, only: [:show], path: '', path_names: { show: '/:username'}
  root 'home#index'
end
