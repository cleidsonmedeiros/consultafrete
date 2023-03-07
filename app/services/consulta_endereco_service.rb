class ConsultaEnderecoService
    PRICE_LIST = {
      sudeste: 7.85,
      centrooeste: 12.50,
      nordeste: 15.98,
      sul: 17.30,
      norte: 20.83
    }
  
    STATE_LIST = {
      AC: 'norte',
      AL: 'nordeste',
      AP: 'norte',
      AM: 'norte',
      BA: 'nordeste',
      CE: 'nordeste',
      DF: 'centrooeste',
      ES: 'sudeste',
      GO: 'centrooeste',
      MA: 'nordeste',
      MT: 'centrooeste',
      MS: 'centrooeste',
      MG: 'sudeste',
      PA: 'norte',
      PB: 'nordeste',
      PR: 'sul',
      PE: 'nordeste',
      PI: 'nordeste',
      RJ: 'sudeste',
      RN: 'nordeste',
      RS: 'sul',
      RO: 'norte',
      RR: 'norte',
      SC: 'sul',
      SP: 'sudeste',
      SE: 'nordeste',
      TO: 'norte'
    }
  
    def self.consultar_endereco(cep)
      response = Faraday.get("http://viacep.com.br/ws/#{cep}/json/")
      endereco = JSON.parse(response.body)
  
      frete = calcula_frete(endereco)
  
      {
        cep: cep,
        rua: endereco["logradouro"],
        complemento: endereco["complemento"],
        bairro: endereco["bairro"],
        cidade: endereco["localidade"],
        estado: endereco["uf"],
        frete: frete
      }
    end
  
    private
  
    def self.calcula_frete(endereco)
      estado = endereco["uf"]
      estado = estado.to_sym
      regiao = STATE_LIST[estado]
      regiao = regiao.to_sym
      PRICE_LIST[regiao]
    end
  end