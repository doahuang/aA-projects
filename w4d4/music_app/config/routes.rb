Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: %i(new create)
  resource :session, only: %i(new create destroy)
  
  resources :bands do 
    resources :albums, only: [:new]
  end
  resources :albums, except: %i(new index)
  
  root to: 'sessions#new'
end
