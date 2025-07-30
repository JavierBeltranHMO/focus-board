# app/config/routes.rb
Rails.application.routes.draw do
  devise_for :users

  resources :boards do
    resources :board_memberships, only: [ :create ]
    resources :lists, except: [ :index, :show ] do
      member do
        put :sort
      end
      resources :tasks, except: [ :index, :new ]
    end
  end

  resources :tasks, only: [ :edit, :update, :destroy, :show ] do
    member do
      put :sort
      patch :complete
    end
  end

  # health check
  get "up" => "rails/health#show", as: :rails_health_check

  # dynamic root
  authenticated :user do
    root to: "boards#index", as: :authenticated_root
  end
  unauthenticated do
    root to: "boards#index", as: :unauthenticated_root
  end
end
