class ConsultaEnderecoController < ApplicationController
  def consulta
    cep = params[:cep]
    resultado = ConsultaEnderecoService.consultar_endereco(cep)
    render json: resultado
  end
end