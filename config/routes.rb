Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ## below is rails-specific syntax for standard routing protocols:
    ## request method to 'name_of_controller'#'action_of_controller' (or 'action_inside_controller')
  get '/songs', to: 'songs#index'
  get '/songs/:id', to: 'songs#show'

  get '/artists', to: 'artists#index'
  get '/artists/new', to: 'artists#new'
  get '/artists/:id', to: 'artists#show'
  get '/artists/:id/edit', to: 'artists#edit'
  post '/artists', to: 'artists#create'
  patch '/artists/:id/edit', to: 'artists#update'
  delete '/artists/:id', to: 'artists#destroy'

  get '/artists/:id/songs', to: 'artist_songs#index'
end
