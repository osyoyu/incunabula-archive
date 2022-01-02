Rails.application.routes.draw do
  root "posts#index"

  resources :posts, only: [:show], param: :url_key
end
