Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'

  resources :ramen_shops, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
