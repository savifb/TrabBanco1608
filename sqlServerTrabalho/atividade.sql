
-- Criação das tabelas
CREATE TABLE Cliente (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL
);

CREATE TABLE Categoria (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Fornecedor (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(255) NOT NULL
);

CREATE TABLE Produto (
    id INT PRIMARY KEY IDENTITY,
    nome VARCHAR(255) NOT NULL,
    categoria_id INT,
    fornecedor_id INT,
    preco DECIMAL(10, 2) NOT NULL,
    quantidade_estoque INT DEFAULT 0,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id),
    FOREIGN KEY (fornecedor_id) REFERENCES Fornecedor(id)
);


CREATE TABLE Pedido (
    id INT PRIMARY KEY IDENTITY,
    cliente_id INT NOT NULL,
    data_pedido DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(id)
);

CREATE TABLE ItemPedido (
    id INT PRIMARY KEY IDENTITY,
    pedido_id INT NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES Pedido(id),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

CREATE TABLE Manutencao (
    id INT PRIMARY KEY IDENTITY,
    produto_id INT NOT NULL,
    data DATE NOT NULL,
    descricao VARCHAR(255),
    FOREIGN KEY (produto_id) REFERENCES Produto(id)
);

-- Inserção de dados
INSERT INTO Cliente (nome, endereco) VALUES 
('João Silva', 'Rua A, 123'),
('Maria Oliveira', 'Avenida B, 456'),
('Pedro Santos', 'Travessa C, 789'),
('Ana Paula', 'Rua D, 101'),
('Carlos Pereira', 'Avenida E, 202'),
('Fernanda Costa', 'Rua F, 303'),
('Jorge Lima', 'Avenida G, 404'),
('Luiza Mendes', 'Travessa H, 505'),
('Mariana Rocha', 'Rua I, 606'),
('Paulo Neves', 'Avenida J, 707'),
('Lucas Pereira', 'Rua K, 808'),
('Gabriela Santos', 'Avenida L, 909'),
('Rafael Almeida', 'Travessa M, 1010'),
('Juliana Costa', 'Rua N, 1111'),
('Bruno Silva', 'Avenida O, 1212');

INSERT INTO Categoria (nome) VALUES 
('Eletrônicos'),
('Roupas'),
('Móveis'),
('Alimentos'),
('Livros'),
('Brinquedos'),
('Beleza'),
('Saúde');

INSERT INTO Fornecedor (nome) VALUES 
('Fornecedor A'),
('Fornecedor B'),
('Fornecedor C'),
('Fornecedor D'),
('Fornecedor E'),
('Fornecedor F'),
('Fornecedor G'),
('Fornecedor H');

INSERT INTO Produto (nome, categoria_id, fornecedor_id, preco, quantidade_estoque) VALUES 
('Celular', 1, 1, 1500.00, 10),
('Laptop', 1, 2, 3000.00, 5),
('Camisa', 2, 3, 50.00, 100),
('Sofá', 3, 4, 2000.00, 2),
('Arroz', 4, 1, 20.00, 200),
('Televisão', 1, 5, 2500.00, 8),
('Mesa', 3, 6, 1500.00, 15),
('Cadeira', 3, 7, 300.00, 30),
('Computador', 1, 8, 3500.00, 4),
('Livro de Programação', 5, 2, 100.00, 50),
('Brinquedo', 6, 3, 80.00, 25),
('Shampoo', 7, 4, 30.00, 60),
('Medicamento', 8, 5, 50.00, 100),
('Tênis', 2, 6, 120.00, 40),
('Sofá-Cama', 3, 7, 2500.00, 5),
('Micro-ondas', 1, 8, 600.00, 20),
('Geladeira', 1, 1, 4000.00, 3),
('Cadeira de Escritório', 3, 2, 500.00, 12),
('TV Smart', 1, 3, 3500.00, 7);

INSERT INTO Pedido (cliente_id, data_pedido) VALUES 
(1, '2024-01-10'),
(2, '2024-01-15'),
(3, '2024-01-20'),
(4, '2024-01-25'),
(5, '2024-02-01'),
(6, '2024-02-05'),
(7, '2024-02-10'),
(8, '2024-02-15'),
(9, '2024-02-20'),
(10, '2024-03-01'),
(11, '2024-03-05'),
(12, '2024-03-10'),
(13, '2024-03-15'),
(14, '2024-03-20'),
(15, '2024-04-01');

INSERT INTO ItemPedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES 
(1, 1, 2, 1500.00),
(1, 3, 1, 50.00),
(2, 2, 1, 3000.00),
(3, 4, 1, 2000.00),
(4, 5, 5, 20.00),
(5, 6, 1, 2500.00),
(6, 7, 2, 1500.00),
(7, 8, 1, 300.00),
(8, 9, 1, 3500.00),
(9, 10, 3, 100.00),
(10, 11, 5, 80.00),
(11, 12, 4, 30.00),
(12, 13, 6, 50.00),
(13, 14, 2, 120.00),
(14, 15, 1, 2500.00),
(15, 16, 1, 600.00),
(1, 17, 1, 4000.00),
(2, 18, 1, 500.00),
(3, 19, 1, 3500.00);

INSERT INTO Manutencao (produto_id, data, descricao) VALUES 
(1, '2024-01-12', 'Troca de tela'),
(2, '2024-01-18', 'Atualização de software'),
(4, '2024-01-28', 'Limpeza'),
(6, '2024-02-10', 'Verificação de qualidade'),
(7, '2024-02-12', 'Troca de peças'),
(10, '2024-02-15', 'Substituição de bateria'),
(13, '2024-03-05', 'Limpeza geral'),
(14, '2024-03-10', 'Reparo de fecho'),
(16, '2024-04-05', 'Troca de compressor'),
(17, '2024-04-10', 'Reparo de motor'),
(18, '2024-04-15', 'Reparo de estrutura');
