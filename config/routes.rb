# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, except: :index, shallow: true
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
