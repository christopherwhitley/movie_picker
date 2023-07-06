Rails.application.routes.draw do
  root to: 'pages#home'

  # Custom Lists
  resources :custom_lists
  get '/customrandomfilm' => 'custom_lists#rand'

  # Films
  resources :films, except: :create
  post "/films" => "films#multiple_film_results", :as => 'filmsubmission'
  post "/films/new" => "films#create", :as => 'new_film_path'
  get 'films/confirmation'
  get '/randomfilm' => 'films#randomconfirm'
  get '/random_film_confirmation' => 'films#randomconfirm'
  post '/random_film_confirmation' => 'films#wheel'

  # Pages
  get '/api' => 'pages#api'
  get 'pages/login'
  get 'pages/logout'
  post 'pages/login'
  post 'pages/logout'
  delete 'pages/logout' => 'pages#destroy'

  # Genres
  resources :genres

  # People
  post 'people_path' => 'people#add_film_to_person', as: 'add_film_to_person'
  get 'people/watched_films' => 'people#watched_films'
  resources :people

  # Watched
  post '/people/:id' => 'watches#create'
  resources :watches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
