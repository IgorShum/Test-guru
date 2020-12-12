# frozen_string_literal: true

Rails.application.routes.draw do
  get 'questions/index'
  get 'questions/new'
  get 'questions/show'
  get 'questions/create'
  get 'questions/update'
  get 'questions/destroy'
  root to: 'tests#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/tests/:id/start', to: 'tests#start'

  get '/tests/:id/questions', to: 'tests#show'

  get '/search/:category/:title', to: 'tests#search'

  get '/questions', to: 'questions#index'

  post '/questions', to: 'questions#create'

  resources :tests do
    resources :questions, shallow: true
  end
end
