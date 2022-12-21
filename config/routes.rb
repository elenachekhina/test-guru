# frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'tests#index'
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  post :logout, to: 'sessions#destroy'
  resources :users, only: :create
  resources :sessions, only: :create
  resources :tests do
    resources :questions, except: :index, shallow: true do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
