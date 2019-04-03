Rails.application.routes.draw do
  devise_for :users
  get "static_page/index"
  root "static_page#index"
end
