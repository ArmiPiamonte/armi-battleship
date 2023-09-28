Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :games, only: %i[show create update] do
    resources :cells, only: %i[update]
  end
end
