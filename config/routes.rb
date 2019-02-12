Rails.application.routes.draw do
  root 'ideas#index'
  devise_for :users, skip: [:registrations]

  namespace :editor do
    root 'application#index'

    resources :users do
      member do
        patch :archive
      end
    end
  end

  resources :ideas do
    resources :comments
    resource :like, module: :ideas
  end
end
