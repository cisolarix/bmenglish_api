Rails.application.routes.draw do
  resources :photos, only: %i[create show]

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy'

  resources :questions, except: %w[new edit]
  resources :textbooks, only: %w[index show]

  post 'add_to_my_workbook', to: 'workbooks#create'
  resources :workbooks, only: %i[index show] do
    resources :lessons, only: [:show] do
      member do
        get 'practice', to: 'practices#show'
        post 'submit_practice', to: 'practices#create'
      end
    end
  end

  namespace :practices do
    resources :answers, only: [:show]
  end

  resources :chapters do
    scope module: :chapters do
      resource :sort, only: [:show, :create]
    end
  end
  resources :students do
    scope module: :students do
      resources :practices, only: %i[index show]
    end
  end

  root to: 'facades#index'
end
