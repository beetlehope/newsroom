Rails.application.routes.draw do
  namespace :editor do
    get 'users/index'
  end

  get 'ideas/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "ideas#index"

  resources :ideas do 
    resources :comments do 
    end  
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
