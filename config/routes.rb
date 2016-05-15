Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  root 'students#index'

  resources :classrooms
  resources :rooms
  resources :plans
  resources :students, except: [ :destroy ] do
    resource :invoice, only: [ :new, :create ]
    resources :student_levels, path: :levels
    resources :student_plans, path: :plans
    resources :subscriptions, only: [ :index, :show, :create, :destroy ]
    resource :subscription_bulk_updates, only: [ :new, :create ]
  end
  resources :teachers, except: [ :destroy ]
  resources :modalities
  resources :users, except: [ :show ]

  get :options, to: 'options#index'
  post :options, to: 'options#update'
end
