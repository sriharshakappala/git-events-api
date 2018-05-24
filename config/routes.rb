Rails.application.routes.draw do
  resources :events, only: [:index, :create], defaults: { format: 'json' }
  resources :actors, only: [:index], defaults: { format: 'json' }
  delete '/erase'                   => 'erase#destroy'
  put '/actors'                     => 'actors#update', defaults: { format: 'json' }
  get '/events/actors/:actorID'     => 'events#actors_events', defaults: { format: 'json' }
  get '/actors/streak'              => 'actors#streak', defaults: { format: 'json' }
end
