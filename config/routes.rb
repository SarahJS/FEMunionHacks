Rails.application.routes.draw do
  get 'welcome/index'

  resources :reports

  root 'welcome#index'

  get "/pages/:page" => "pages#show"
end
