Rails.application.routes.draw do
  resources :appointments
  resources :users
  resources :user_subjects
  resources :subjects
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/auth/:provider/callback', to: 'sessions#omniauth'


end


