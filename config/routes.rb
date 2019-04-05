Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    get "static_page/index"
    root "static_page#index"

    namespace :admin do
      root "dashboard#index"
      resources :teams
    end
  end
end
