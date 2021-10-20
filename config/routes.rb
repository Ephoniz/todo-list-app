Rails.application.routes.draw do
  # current_user.present? ? root 'tasks#index' : root 'users#'

  devise_scope :user do
    authenticated  do
      root to: 'tasks#index'
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end
  
  devise_for :users
  resources :tasks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
