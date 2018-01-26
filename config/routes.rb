Rails.application.routes.draw do
  get 'ideas/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "ideas#index"

  resources :ideas

  namespace :editor do 
  	root "application#index"
  end 
end
