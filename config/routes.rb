# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: :gurus, path_names: {sign_in: :login, sign_out: :logout}
  root to: 'tests#index'
  post 'feedback', to: 'feedback#feedback'
  get 'feedback', to: 'feedback#index'

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :badges, only: :index

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
    end
    resources :gists, only: %i[index show]
    resources :achievements
    resources :badges
  end

end
