Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  root 'dashboard#index'

  resources :classrooms
  resources :rooms
  resources :students, except: [ :destroy ] do
    resources :student_levels, path: :levels
    resources :subscriptions, only: [ :index, :show, :create, :destroy ]
    resource :subscription_bulk_updates, only: [ :new, :create ]
  end
  resources :teachers
  resources :modalities
  resources :users, except: [ :show ]
end
