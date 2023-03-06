# Consulta de Endereço

## Descrição
Este é um projeto Rails que permite consultar endereços a partir do CEP utilizando a API do ViaCEP.

## Requisitos
* Ruby
* Rails
* Faraday

## Instalação
1. Faça o clone deste repositório
2. Instale as dependências rodando o comando `bundle install`
3. Execute o servidor rodando o comando `rails s`

## Uso
Faça uma requisição HTTP POST para o endpoint `/consulta` com o parâmetro `cep` contendo o CEP que deseja consultar. A resposta será um JSON contendo as informações do endereço e o valor do frete para a região.

Exemplo de requisição usando cURL:

curl -X POST -H "Content-Type: application/json" -d '{"cep":"01310-100"}' http://localhost:3000/consulta