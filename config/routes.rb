Rails.application.routes.draw do
  post 'v1/consulta-endereco', to: "consulta_endereco#consulta"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
