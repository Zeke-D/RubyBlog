Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
  	resources :comments
  end

  resources :users

  get 'signin', to: 'users#signin_show'
  post 'signin', to: 'users#signin'

  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
