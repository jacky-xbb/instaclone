Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: %i[new create]

  root 'site#index'
end
