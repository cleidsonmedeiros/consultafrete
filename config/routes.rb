Rails.application.routes.draw do

  post 'consulta', to: 'consulta_endereco#consulta'
=======
  post 'consulta', to: "consulta_endereco#consulta"
  
end
