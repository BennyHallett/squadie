Rails.application.routes.draw do
  root 'content#landing'

  ## AUTH ##
  get '/auth/:provider/callback' => 'session#create', as: :create_session
  get '/logout' => 'session#destroy', as: :destroy_session
  get '/login' => 'session#login', as: :login

  get '/players' => 'player#index', as: :players
  post '/players/add' => 'player#add', as: :add_player

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

end
