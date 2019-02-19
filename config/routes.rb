Rails.application.routes.draw do
  root 'ideas#index'
  devise_for :users, skip: [:registrations]

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    delete 'sign_out', to: 'devise/sessions#destroy'
  end

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

  match "/delayed_job" => DelayedJobWeb, :anchor => false, :via => [:get, :post]
end
