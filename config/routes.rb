MovieApp::Application.routes.draw do
  #get "movies/index"
  
  
  root 'movies#index'

  resources :movies

  get 'search', to: 'movies#search'

  #delete to:  'movies#destroy'
#railDELETE /movies/:id(.:format)   to: 'movies#destroy'
  
end
