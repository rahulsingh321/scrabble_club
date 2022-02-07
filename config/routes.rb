Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'leader_board#show'

  resources :games do
    resources :matches
  end

  resources :players
end
