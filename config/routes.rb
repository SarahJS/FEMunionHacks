Rails.application.routes.draw do
  get 'welcome/index'

  resources :reports
 
  root 'welcome#index'
end