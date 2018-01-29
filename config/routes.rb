Rails.application.routes.draw do
  namespace :editor do
    get 'users/index'
  end

  get 'ideas/index'

  devise_for :users, skip: [:registrations]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "ideas#index"

  resources :ideas do 
    resources :comments do 
    end  
  end  

  resources :ideas do 
    resource :like, module: :ideas
  end 

  namespace :editor do 
  	root "application#index"

    resources :users do 
      member do
        patch :archive
      end
    end
   end  
end
