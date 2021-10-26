Rails.application.routes.draw do
  devise_scope :user do
    authenticated do
      root to: 'tasks#index'
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: 'unauthenticated_root'
    end
  end

  devise_for :users
  resources :tasks, only: %i[show update destroy create index edit new]
  resources :tags, only: %i[index create destroy new]
end
