Rails.application.routes.draw do
  root 'content#landing'

  get '/auth/:provider/callback' => 'session#create', as: :create_session

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

end
