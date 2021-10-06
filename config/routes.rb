Rails.application.routes.draw do
  resources :people
  root to: 'pages#home'
  get '/randomfilm' => 'films#randomfilm'
  resources :films
  resources :genres
  get 'pages/login'
  get 'pages/logout'
  post 'pages/login'
  post 'pages/logout'
  delete 'pages/logout' => 'pages#destroy'

post 'people_path' => 'people#add_film_to_person', as: 'add_film_to_person'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/api' => 'pages#api'
end
