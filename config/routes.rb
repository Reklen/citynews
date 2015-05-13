Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root 'application#index'

  get 'search' => 'application#search'
  get 'articles/search' => 'articles#search'
  get 'events/search' => 'events#search'
  get 'articles' => 'application#index'
  get 'events' => 'application#index'

  resources :articles
  resources :events
  resources :promotions
  resources :jobs
  resources :city_comments

  get 'user_account' => 'user_account#index'

end
