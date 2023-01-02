# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  post :logout, to: 'sessions#destroy'

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, except: :index, shallow: true do
        resources :answers, shallow: true
      end
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
