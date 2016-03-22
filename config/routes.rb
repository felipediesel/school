Rails.application.routes.draw do
  devise_for :users, skip: [:registrations]
  root 'dashboard#index'

  resources :classrooms
  resources :rooms
  resources :students
  resources :teachers
  resources :modalities
  resources :users, except: [ :show ]
end
