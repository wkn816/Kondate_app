Rails.application.routes.draw do
  devise_for :users
  root to: 'tops#top'
  resources :lists
  resources :users

end
