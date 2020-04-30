Rails.application.routes.draw do
  get 'welcome/index'

  resources :forums do
    resources :comments
  end

  resources :homepage
  resources :recommended
  resources :forums
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
