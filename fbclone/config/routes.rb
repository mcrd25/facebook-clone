Rails.application.routes.draw do
  devise_for :users , path_names: { sign_in: 'login',
                                             sign_out: 'logout',
                                             sign_up: 'reg' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :profile, only: [:show, :edit],
                     path: '/:username'

  root 'home#index'
end
