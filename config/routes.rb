Rails.application.routes.draw do
  devise_for :users

  resources :comments, only: :create do
    resources :thumbs, only: :create do
      collection do
        delete :destroy
      end
    end
  end

  resources :posts, only: %i[new create] do
    resources :likes, only: :create do
      collection do
        delete :destroy
      end
    end

    resources :comments, only: :create
  end

  root 'site#index'
end
