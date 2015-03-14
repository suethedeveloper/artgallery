Rails.application.routes.draw do
  devise_for :users
  resources :arts do
    member do
      put "like", to: "arts#upvote"
    end
  end

  root "arts#index"
end
