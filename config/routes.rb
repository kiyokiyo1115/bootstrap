Rails.application.routes.draw do
  resources :feeds
  root to: 'tops#index'

  resources :blogs do
  collection do
      post :confirm
    end
  end
  
  resources :sessions, only: [:new, :create, :show, :destroy]
  resources :users
  resources :favorites, only: [:create, :destroy] 
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end