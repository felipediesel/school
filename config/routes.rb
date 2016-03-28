Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  root 'dashboard#index'

  resources :classrooms
  resources :rooms
  resources :students do
    resources :student_levels, path: :levels
  end
  resources :teachers
  resources :modalities
  resources :users, except: [ :show ]
end
