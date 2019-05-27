Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :users, only: %i(show)
  root 'static_pages#home'
  get 'static_pages/home'
end
