require 'rails_helper'

RSpec.describe ConsultaEnderecoService do
    describe '.consultar_endereco' do
      let(:cep) { '12345678' }
      let(:endereco) do
        {
          "logradouro": "Rua Teste",
          "complemento": "Apto 123",
          "bairro": "Centro",
          "localidade": "São Paulo",
          "uf": "SP"
        }
      end
  
      before do
        allow(Faraday).to receive(:get).with("http://viacep.com.br/ws/#{cep}/json/").and_return(double(body: endereco.to_json))
      end
  
      it 'retorna o endereço com o frete' do
        expect(described_class.consultar_endereco(cep)).to eq(
          {
            cep: cep,
            rua: endereco[:logradouro],
            complemento: endereco[:complemento],
            bairro: endereco[:bairro],
            cidade: endereco[:localidade],
            estado: endereco[:uf],
            frete: 7.85
          }
        )
      end
    end
  end
  