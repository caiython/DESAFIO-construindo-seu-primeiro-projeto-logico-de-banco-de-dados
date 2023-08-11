INSERT INTO Identificacao (cpf, nome_completo, data_nasc)
	VALUES ('18369485369', 'José da Silva Conceição', '2023-05-20'),
		   ('18205489425', 'Mariana Nogueira Nascimento', '1983-03-23'),
           ('89435889465', 'Roberto Bastos Silva', '1990-07-18'),
           ('18068804312', 'Joana Moreira Cerqueira', '2000-10-10'),
           ('54726738489', 'Pedro Henrique Vieira Santana', '1990-10-20');
          
INSERT INTO Endereco (logradouro, numero, complemento, cidade, estado, cep)
	VALUES ('Rua Bahia', '10', NULL, 'Salvador', 'BA', '41745000'),
		   ('Rua São Paulo', '13', 'Apartamento 25', 'São Paulo', 'SP', '01153000'),
           ('Rua Santos', '18', NULL, 'São Paulo', 'SP', '01153000'),
           ('Rua Vicente', '593', NULL, 'Santos', 'SP', '12345678'),
           ('Rua Padre Francisco', '123', 'Fundos', 'Santos', 'SP', '12321978');

INSERT INTO Cliente (id_identificacao, id_endereco)
	VALUES (1, 1),
		   (2, 2),
           (3, 3),
           (4, 4),
           (5, 5);
          
INSERT INTO DimensoesProduto (altura, largura, comprimento)
	VALUES (10.2, 15.2, 10.4),
		   (19, 2, 2.2),
           (5.6, 1.1, 2.5),
           (NULL, NULL, NULL),
           (15.6, 15, 2);

INSERT INTO Produto (nome, preco, descricao, id_dimensoes)
	VALUES ('Escova de Dentes', 3.45, 'Escova de dentes azul', 1),
		   ('Chapéu', 15.50, 'Chapéu rosa muito bonito', 2),
           ('Ferrari', 100000, 'Ferrari do ano', 3),
           ('Tênis Nike', 399.99, 'Preto com listras brancas', 4),
           ('iPhone 11', 2999.99, 'Ótimo telefone para tirar fotos', 5);

INSERT INTO PagamentoPedido (valor_pagamento, valor_frete, metodo_pagamento, status_pagamento)
VALUES (150.00, 15.00, 'Cartão', 'Confirmado'),
       (500.00, 10.00, 'Boleto', 'Pendente'),
       (1200.00, 20.00, 'Pix', 'Processando'),
       (50.00, 10.00, 'Cartão', 'Pendente'),
       (75.00, 12.00, 'Dois Cartões', 'Pendente');

INSERT INTO Entrega (codigo_rastreio, localizacao_atual, nome_transportador, tipo_envio, data_hora_envio, data_hora_entrega, status_entrega, observacoes, assinatura_recebedor)
VALUES
    ('ABC123', 'Depósito Central', 'TransporteExpress', 'Normal', '2023-08-10 10:00:00', '2023-08-15 15:30:00', 'Em trânsito', 'Nenhum problema identificado', NULL),
    ('DEF456', 'Centro de Distribuição', 'FastShipping', 'Expresso', '2023-08-12 11:30:00', '2023-08-14 13:15:00', 'Entregue', 'Recebido por João Silva', NULL),
    ('GHI789', 'Rota de Entrega', 'QuickCourier', 'Expresso', '2023-08-11 09:45:00', '2023-08-16 10:45:00', 'Atrasado', 'Cliente não estava presente, reagendar entrega', NULL),
    ('JKL012', 'Centro de Triagem', 'SwiftLogistics', 'Normal', '2023-08-14 12:00:00', NULL, 'Aguardando Pagamento', 'Aguardando confirmação de pagamento', NULL),
    ('MNO345', 'Em Distribuição', 'SpeedyShip', 'Expresso', '2023-08-13 14:30:00', NULL, 'Em trânsito', 'Entrega prevista para amanhã', NULL);
    
INSERT INTO Pedido (status_do_pedido, descricao, id_cliente, id_pagamento, id_entrega)
VALUES
    ('Em processo', 'Pedido de roupas de verão', 1, 1, 1),
    ('Finalizado', 'Pedido de eletrônicos', 2, 2, 2),
    ('Em processo', 'Pedido de livros', 3, 3, 3),
    ('Finalizado', 'Pedido de alimentos', 4, 4, 4),
    ('Cancelado', 'Pedido de decoração', 5, 5, 5);

INSERT INTO Estoque (quantidade, id_endereco)
VALUES
    (100, 1),
    (50, 2),
    (200, 3),
    (75, 4),
    (30, 5);

INSERT INTO Identificacao (tipo_de_pessoa, cpf, nome_completo, data_nasc, cnpj, razao_social, nome_fantasia)
VALUES
    ('Pessoa Física', '12345678901', 'João da Silva', '1985-05-15', NULL, NULL, NULL),
    ('Pessoa Jurídica', NULL, NULL, NULL, '12345678901234', 'Eletrônicos BRASIL Ltda.', NULL),
    ('Pessoa Física', '98765432101', 'Maria Oliveira', '1990-08-30', NULL, NULL, NULL),
    ('Pessoa Jurídica', NULL, NULL, NULL, '98765432101234', 'SeusProdutos S.A.', 'Distribuidora'),
    ('Pessoa Física', '54321678901', 'Carlos Santos', '1982-03-20', NULL, NULL, NULL);


INSERT INTO Contato (email, telefone)
VALUES
    ('fornecepeças@gmail.com', '1122334455'),
    ('tudoparaseuecommerce@outlook.com', '9988776655'),
    ('vendasja@gmail.com', '2133445566'),
    ('contato@vendacomonunca.com.br', '1199887766'),
    ('contato@meuprodutoseulucro.com.br', '1144332211');

INSERT INTO Endereco (logradouro, numero, complemento, cidade, estado, cep)
VALUES
    ('Rua das Flores', '123', 'Sala 101', 'São Paulo', 'SP', '12345678'),
    ('Avenida Central', '456', 'Andar 5', 'Santos', 'SP', '23456789'),
    ('Praça do Comércio', '789', NULL, 'Cubatão', 'SP', '34567890'),
    ('Travessa da Amizade', '321', 'Loja 12', 'Cubatão', 'SP', '45678901'),
    ('Alameda dos Sonhos', '987', NULL, 'Cubatão', 'SP', '56789012');


INSERT INTO Fornecedor (id_identificacao, id_contato, id_endereco)
VALUES
    (6, 1, 6),
    (7, 2, 7),
    (8, 3, 8),
    (9, 4, 9),
    (10, 5, 10);

INSERT INTO Identificacao (tipo_de_pessoa, cpf, nome_completo, data_nasc, cnpj, razao_social, nome_fantasia)
VALUES
    ('Pessoa Física', '12345678901', 'João da Silva', '1985-05-15', NULL, NULL, NULL),
    ('Pessoa Jurídica', NULL, NULL, NULL, '12345678901234', 'Eletrônicos BRASIL Ltda.', NULL),
    ('Pessoa Física', '98765432101', 'Maria Oliveira', '1990-08-30', NULL, NULL, NULL),
    ('Pessoa Jurídica', NULL, NULL, NULL, '98765432101234', 'SeusProdutos S.A.', 'Distribuidora'),
    ('Pessoa Física', '54321678901', 'Carlos Santos', '1982-03-20', NULL, NULL, NULL);


INSERT INTO Contato (email, telefone)
VALUES
    ('fornecepeças@gmail.com', '1122334455'),
    ('tudoparaseuecommerce@outlook.com', '9988776655'),
    ('vendasja@gmail.com', '2133445566'),
    ('contato@vendacomonunca.com.br', '1199887766'),
    ('contato@meuprodutoseulucro.com.br', '1144332211');

INSERT INTO Endereco (logradouro, numero, complemento, cidade, estado, cep)
VALUES
    ('Rua das Flores', '123', 'Sala 101', 'São Paulo', 'SP', '12345678'),
    ('Avenida Central', '456', 'Andar 5', 'Santos', 'SP', '23456789'),
    ('Praça do Comércio', '789', NULL, 'Cubatão', 'SP', '34567890'),
    ('Travessa da Amizade', '321', 'Loja 12', 'Cubatão', 'SP', '45678901'),
    ('Alameda dos Sonhos', '987', NULL, 'Cubatão', 'SP', '56789012');

-- Inserções fictícias na tabela Identificacao
INSERT INTO Identificacao (tipo_de_pessoa, cpf, nome_completo, data_nasc, cnpj, razao_social, nome_fantasia)
VALUES
    ('Pessoa Física', '45665445321', 'Joana da Silva', '1990-02-25', NULL, NULL, NULL),
    ('Pessoa Jurídica', NULL, NULL, NULL, '94878956525448', 'TechSupplies Ltda.', NULL),
    ('Pessoa Física', '16484564597', 'Lucas Oliveira', '1988-11-10', NULL, NULL, NULL),
    ('Pessoa Jurídica', NULL, NULL, NULL, '66664666585855', 'Global Distribuidora', 'Comercial'),
    ('Pessoa Física', '58585858585', 'Amanda Santos', '1985-07-18', NULL, NULL, NULL);

-- Inserções fictícias na tabela Contato
INSERT INTO Contato (email, telefone)
VALUES
    ('joana@gmail.com', '9497686549'),
    ('lucas@techsupplies.com', '1564869652'),
    ('vendas@outlook.com', '1548485123'),
    ('contato@globaldist.com', '1235153215'),
    ('amanda@meuproduto.com', '4654654521');

-- Inserções fictícias na tabela Endereco
INSERT INTO Endereco (logradouro, numero, complemento, cidade, estado, cep)
VALUES
    ('Rua das Flores', '123', 'Apto 302', 'São Paulo', 'SP', '12345678'),
    ('Avenida Central', '456', 'Andar 10', 'Santos', 'SP', '23456789'),
    ('Praça do Comércio', '789', NULL, 'São Paulo', 'SP', '34567890'),
    ('Travessa da Amizade', '321', 'Loja 5', 'São Paulo', 'SP', '45678901'),
    ('Alameda dos Sonhos', '987', NULL, 'Cubatão', 'SP', '56789012');

INSERT INTO Vendedor (id_identificacao, id_endereco, id_contato)
VALUES
    (16, 11, 6),
    (17, 12, 7),
    (18, 13, 8),
    (19, 14, 9),
    (20, 15, 10);

INSERT INTO ProdutoVendedor (id_produto, id_vendedor, quantidade)
VALUES
    (1, 6, 10),
    (2, 7, 5),
    (3, 8, 8),
    (4, 9, 15),
    (5, 10, 3);

INSERT INTO ProdutoPedido (id_produto, id_pedido, quantidade, status_produto)
VALUES
    (1, 1, 2, 'Disponível'),
    (2, 3, 3, 'Disponível'),
    (3, 2, 1, 'Sem estoque'),
    (4, 5, 5, 'Disponível'),
    (5, 1, 2, 'Disponível');

INSERT INTO ProdutoEstoque (id_produto, id_estoque)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 3),
    (5, 4);

INSERT INTO ProdutoFornecedor (id_produto, id_fornecedor, quantidade)
VALUES
    (1, 1, 100),
    (2, 2, 50),
    (3, 1, 80),
    (4, 3, 120),
    (5, 4, 30);