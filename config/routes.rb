Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'application#index'

  get 'articles/search' => 'articles#search'
  get 'events/search' => 'events#search'

  resources :articles
  resources :events
  resources :promotions
  resources :jobs
  resources :city_comments

  get 'user_account' => 'user_account#index'

end
