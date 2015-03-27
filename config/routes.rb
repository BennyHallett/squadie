Rails.application.routes.draw do
  root 'content#landing'

  ## AUTH ##
  get '/auth/:provider/callback' => 'session#create', as: :create_session
  get '/logout' => 'session#destroy', as: :destroy_session

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

end
