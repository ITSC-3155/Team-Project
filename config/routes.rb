Rails.application.routes.draw do
  get 'welcome/index'
  get 'layouts/homepage'
  get 'layouts/Recommendend'
  get 'layouts/Forum'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
