Rails.application.routes.draw do
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'

  resources :questions, except: %w(new edit)
  resources :textbooks, only: %w(index show)

  post 'add_to_my_workbook', to: 'workbooks#create'
  resources :workbooks, only: [:show] do
    resources :lessons, only: [:show] do
      member do
        get 'practice', to: 'practices#show'
        post 'submit_practice', to: 'practices#create'
      end

      resources :practices, only: [:show] do
        get 'answers', to: 'practices/answers#show'
      end
    end
  end

  root to: 'textbooks#index'
end
