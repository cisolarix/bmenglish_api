Rails.application.routes.draw do
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'

  resources :questions, except: %w(new edit)
  resources :textbooks, only: %w(index show)

  post 'add_to_my_workbook', to: 'workbooks#create'
  resources :workbooks, only: [:show] do
    get '/lessons/:lesson_id/practise', to: 'practices#show'
    # /workbooks/111/lessons/222/practise
  end

  root to: 'textbooks#index'
end
