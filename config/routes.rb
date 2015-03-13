Rails.application.routes.draw do
  devise_for :users
  resources :arts
  root 'arts#index'

end
