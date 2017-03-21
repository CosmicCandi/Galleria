Rails.application.routes.draw do
  resources :shares
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#index'

  resources :users
  resources :galleries do
    resources :photos do
    resources :share
    end
  end

  resources :photos do
    resources :share
  end

  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: :logout
  post '/galleries/new' => 'galleries#create'
  post '/galleries/:id/edit' => 'galleries#update'

end
