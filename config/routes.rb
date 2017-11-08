Rails.application.routes.draw do
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'

  resources :questions, except: %w(new edit)
  resources :textbooks, only: %w(index show)

  root to: 'dashboards#index'
end
