# Projeto de Modelagem e Consultas SQL para E-Commerce

Este repositório contém a solução para o desafio de modelagem e consultas SQL para um sistema de e-commerce. O objetivo do projeto é replicar a modelagem de um banco de dados para um cenário de comércio eletrônico, considerando diferentes entidades e seus relacionamentos. O projeto também inclui a criação de consultas SQL para realizar operações e análises sobre os dados.

## 🎲 Modelagem do Banco de Dados

O esquema do banco de dados foi projetado para atender às necessidades de um comércio eletrônico, considerando clientes, produtos, pedidos, pagamentos, entregas, fornecedores e vendedores. O modelo foi refinado para incluir as seguintes características:

- Clientes podem ser Pessoa Jurídica (PJ) ou Pessoa Física (PF), não podendo ter ambas informações.
- Um cliente pode ter várias formas de pagamento.
- As entregas possuem status e códigos de rastreio.
- Alguns vendedores também são fornecedores.

## 📋 Estrutura do Repositório

O repositório está organizado da seguinte forma:

- `criação-do-banco-e-das-tabelas.sql`: Arquivo SQL contendo o script para criar o esquema do banco de dados, incluindo tabelas, chaves primárias, chaves estrangeiras e constraints;
- `inserção-de-dados-no-banco.sql`: Arquivo SQL com código para inserção de valores fictícios afim de realizar testes com consultas;
- `pesquisas-respondendo-perguntas-de-negócio-no-banco.sql`: Arquivo SQL com uma série de consultas elaboradas para responder a diferentes perguntas de negócios relacionadas ao cenário de e-commerce. As consultas abordam seleções simples, filtros, atributos derivados, ordenações, filtros em grupos e junções entre tabelas.

## 💼 Perguntas de Negócios Abordadas

Através das consultas elaboradas no arquivo `pesquisas-respondendo-perguntas-de-negócio-no-banco.sql`, foram respondidas diversas perguntas de negócios, incluindo:

- Quantos produtos estão disponíveis em estoque no momento?
- Qual o nome do produto mais caro?
- Quantos clientes fizeram pelo menos um pedido?
- Quais são os pedidos que foram finalizados nos últimos 7 dias?
- Quais clientes tem ao menos 1 pedido finalizado?
- Do com maior número de vendas para o menor, quais produtos foram vendidos mais de 5 vezes?

## ⚙️ Como Usar

1. Clone este repositório para o seu ambiente local;
2. Execute o script SQL `criação-do-banco-e-das-tabelas.sql` em seu sistema de gerenciamento de banco de dados para criar o esquema do banco de dados;
3. Utilize o arquivo `inserção-de-dados-no-banco.sql` para inserir os dados nas tabelas do esquema;
4. Realize as pesquisas do arquivo `pesquisas-respondendo-perguntas-de-negócio-no-banco.sql` para explorar as consultas elaboradas e suas respostas para as perguntas de negócios.

## ✅ Conclusão

Este projeto apresenta uma solução de modelagem de banco de dados e consultas SQL para um cenário de e-commerce. As consultas abordam uma variedade de operações de dados e análises, fornecendo insights sobre o funcionamento do comércio eletrônico.

---

Obrigado por ler até aqui! - [Caiython](https://github.com/caiython) 😊