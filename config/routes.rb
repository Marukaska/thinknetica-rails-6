Rails.application.routes.draw do

  namespace :admin do
    get 'gists/index'
  end
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  root 'tests#index'

  resources :feedbacks, only: [:new, :create]
  resources :badges, only: :index

  namespace :admin do
    resources :gists, only: :index
    resources :badges
    resources :tests do
      patch :update_inline, on: :member
      patch :update_status, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index

      end
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: :create

  resources :tests, only: :index do
    member do
      post :start
    end
    get :result
  end

end
