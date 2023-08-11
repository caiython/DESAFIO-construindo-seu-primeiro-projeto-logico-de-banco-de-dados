-- Criação do banco de dados para o cenário de E-Commerce
CREATE DATABASE ecommerce;
USE ecommerce;

-- Criação da tabela Identificacao
CREATE TABLE Identificacao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_de_pessoa ENUM('Pessoa Jurídica', 'Pessoa Física') DEFAULT 'Pessoa Física',
    
    -- Preenchimento caso Pessoa Física
    cpf CHAR(11),
    nome_completo VARCHAR(150),
    data_nasc DATE,
    
    -- Preenchimento caso Pessoa Jurídica
    cnpj VARCHAR(15),
    razao_social VARCHAR(255),
    nome_fantasia VARCHAR(255),
    
    CONSTRAINT cpf_unico_identificacao UNIQUE (cpf),
    CONSTRAINT cnpj_unico_identificacao UNIQUE (cnpj)
);

ALTER TABLE Identificacao AUTO_INCREMENT = 1;

-- Criação da tabela Endereco
CREATE TABLE Endereco (
	id INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(50) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(50),
    cidade VARCHAR(30) NOT NULL,
    estado CHAR(2) NOT NULL,
    cep CHAR(8) NOT NULL
);

ALTER TABLE Endereco AUTO_INCREMENT = 1;

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_identificacao INT NOT NULL,
    id_endereco INT NOT NULL,
    CONSTRAINT fk_identificacao_cliente FOREIGN KEY (id_identificacao) REFERENCES Identificacao(id)
		ON DELETE CASCADE,
    CONSTRAINT fk_endereco_cliente FOREIGN KEY (id_endereco) REFERENCES Endereco(id)
		ON DELETE CASCADE
);

ALTER TABLE Cliente AUTO_INCREMENT = 1;

-- Criação da tabela DimensoesProduto
CREATE TABLE DimensoesProduto (
	id INT PRIMARY KEY AUTO_INCREMENT,
    altura FLOAT,
    largura FLOAT,
    comprimento FLOAT
);

ALTER TABLE DimensoesProduto AUTO_INCREMENT = 1;

-- Criação da tabela Produto
CREATE TABLE Produto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    preco DECIMAL(10, 2),
    descricao TEXT,
    id_dimensoes INT,
    CONSTRAINT fk_dimensoes_produto FOREIGN KEY (id_dimensoes) REFERENCES DimensoesProduto(id)
		ON DELETE SET NULL
        ON UPDATE CASCADE
);

ALTER TABLE Produto AUTO_INCREMENT = 1;

-- Criação da tabela PagamentoPedido
CREATE TABLE PagamentoPedido (
	id INT PRIMARY KEY AUTO_INCREMENT,
    valor_pagamento FLOAT NOT NULL,
    valor_frete FLOAT DEFAULT 10,
    metodo_pagamento ENUM('Cartão', 'Dois Cartões', 'Boleto', 'Pix') DEFAULT 'Cartão',
    status_pagamento ENUM('Pendente', 'Processando', 'Confirmado' , 'Cancelado') DEFAULT 'Pendente'
);

ALTER TABLE PagamentoPedido AUTO_INCREMENT = 1;

-- Criação da tabela
CREATE TABLE Entrega (
	id INT PRIMARY KEY AUTO_INCREMENT,
    codigo_rastreio VARCHAR(50),
    localizacao_atual VARCHAR(100),
    nome_transportador VARCHAR(100),
    tipo_envio ENUM('Normal', 'Expresso', 'Outro') DEFAULT 'Normal',
    data_hora_envio DATETIME,
	data_hora_entrega DATETIME,
    status_entrega ENUM('Aguardando Pagamento', 'Em trânsito', 'Entregue', 'Atrasado', 'Outro') DEFAULT 'Aguardando Pagamento',
    observacoes TEXT,
    assinatura_recebedor BLOB
);

ALTER TABLE Entrega AUTO_INCREMENT = 1;

-- Criação da tabela Pedido
CREATE TABLE Pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    status_do_pedido ENUM('Cancelado', 'Finalizado', 'Em processo') DEFAULT 'Em processo',
    descricao VARCHAR(255),
    data_hora_pedido DATETIME DEFAULT NOW(),
    id_cliente INT,
    id_pagamento INT,
    id_entrega INT,
    CONSTRAINT fk_cliente_pedido FOREIGN KEY (id_cliente) REFERENCES Cliente(id)
		ON DELETE SET NULL,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pagamento) REFERENCES PagamentoPedido(id)
		ON DELETE SET NULL,
	CONSTRAINT fk_id_entrega FOREIGN KEY (id_entrega) REFERENCES Entrega(id)
		ON DELETE SET NULL
);

ALTER TABLE Pedido AUTO_INCREMENT = 1;

-- Criação da tabela estoque
CREATE TABLE Estoque (
	id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT DEFAULT 0,
    id_endereco INT NOT NULL,
    CONSTRAINT fk_endereco_estoque FOREIGN KEY (id_endereco) REFERENCES Endereco(id)
);

ALTER TABLE Estoque AUTO_INCREMENT = 1;

-- Criação da tabela ContatoFornecedor
CREATE TABLE Contato (
	id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    telefone CHAR(11) NOT NULL
);

ALTER TABLE Contato AUTO_INCREMENT = 1;

-- Criação da tabela Fornecedor
CREATE TABLE Fornecedor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_identificacao INT NOT NULL,
    id_contato INT NOT NULL,
    id_endereco INT NOT NULL,
    CONSTRAINT fk_identificacao_fornecedor FOREIGN KEY (id_identificacao) REFERENCES Identificacao(id)
		ON DELETE CASCADE,
    CONSTRAINT fk_contato_fornecedor FOREIGN KEY (id_contato) REFERENCES Contato(id)
		ON DELETE CASCADE,
    CONSTRAINT fk_endereco_fornecedor FOREIGN KEY (id_endereco) REFERENCES Endereco(id)
		ON DELETE CASCADE
);

ALTER TABLE Fornecedor AUTO_INCREMENT = 1;

-- Criação da tabela Vendedor
CREATE TABLE Vendedor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_identificacao INT NOT NULL,
    id_endereco INT NOT NULL,
    id_contato INT NOT NULL,
    CONSTRAINT fk_identificacao_vendedor FOREIGN KEY (id_identificacao) REFERENCES Identificacao(id)
		ON DELETE CASCADE,
    CONSTRAINT fk_endereco_vendedor FOREIGN KEY (id_endereco) REFERENCES Endereco(id)
		ON DELETE CASCADE,
    CONSTRAINT fk_contato_vendedor FOREIGN KEY (id_contato) REFERENCES Contato(id)
		ON DELETE CASCADE
);

ALTER TABLE Vendedor AUTO_INCREMENT = 1;

-- Criação da tabela ProdutoVendedor
CREATE TABLE ProdutoVendedor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    id_vendedor INT NOT NULL,
    quantidade INT DEFAULT 1,
    CONSTRAINT fk_produto_produtovendedor FOREIGN KEY (id_produto) REFERENCES Produto(id)
		ON DELETE CASCADE,
    CONSTRAINT fk_vendedor_produtovendedor FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id)
		ON DELETE CASCADE
);

CREATE TABLE ProdutoPedido (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    id_pedido INT NOT NULL,
    quantidade INT DEFAULT 1,
    status_produto ENUM('Disponível', 'Sem estoque') DEFAULT 'Disponível',
    CONSTRAINT fk_produto_produtopedido FOREIGN KEY (id_produto) REFERENCES Produto(id)
		ON DELETE CASCADE,
    CONSTRAINT fk_pedido_produtopedido FOREIGN KEY (id_pedido) REFERENCES Pedido(id)
		ON DELETE CASCADE
);

CREATE TABLE ProdutoEstoque (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    id_estoque INT NOT NULL,
    CONSTRAINT fk_produto_produtoestoque FOREIGN KEY (id_produto) REFERENCES Produto(id)
		ON DELETE CASCADE,
    CONSTRAINT fk_estoque_produtoestoque FOREIGN KEY (id_estoque) REFERENCES Estoque(id)
		ON DELETE CASCADE
);

CREATE TABLE ProdutoFornecedor (
	id INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    id_fornecedor INT NOT NULL,
    quantidade INT NOT NULL,
    CONSTRAINT fk_produto_produtofornecedor FOREIGN KEY (id_produto) REFERENCES Produto(id)
		ON DELETE CASCADE,
    CONSTRAINT fk_fornecedor_produtofornecedor FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id)
		ON DELETE CASCADE
);


