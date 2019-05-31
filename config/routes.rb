Rails.application.routes.draw do
  get 'relations/create'
  get 'relations/destroy'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  resources :posts do
    resources :comments
    member do
      patch 'status_update'
    end
  end
  resources :users, only: %i(show) do
    member do
      get 'followers'
    end
  end
  resources :rooms do
    resources :messages
  end
  resources :relations, only: %i(create destroy)
  root 'static_pages#home'
  get 'static_pages/home'
end
