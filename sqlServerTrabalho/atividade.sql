
create database lojadoSavio;

use lojadoSavio;

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

--1  Escreva uma consulta para listar todos os clientes e os pedidos que fizeram

SELECT * from Cliente as c
INNER JOIN Pedido as p
ON c.id = p.cliente_id

--2. Escreva uma consulta para listar todos os pedidos e os produtos que foram incluídos em cada pedido.
SELECT pe.id ,pr.nome, ItemPedido.id
FROM Pedido as pe 
INNER JOIN ItemPedido
on pe.id = ItemPedido.id
INNER JOIN Produto as pr
on ItemPedido.produto_id = pr.id

--3. Escreva uma consulta para listar todos os produtos e suas respectivas categorias e fornecedores.
SELECT * from Produto
inner join Categoria
on Produto.categoria_id = Categoria.id
inner join Fornecedor 
on Produto.fornecedor_id = Fornecedor.id

--4. Escreva uma consulta para listar todos os produtos que não estão associados a nenhuma categoria.
SELECT * FROM Produto AS P
INNER JOIN Categoria AS C
ON P.categoria_id = C.id
WHERE C.nome IS NULL;

--5  Escreva uma consulta para listar todos os clientes que fizeram compras em janeiro de 2024
SELECT * FROM Cliente AS C
INNER JOIN Pedido AS P 
ON C.id = P.cliente_id
WHERE P.data_pedido LIKE '2024-01%'

--6 6. Escreva uma consulta para listar todos os produtos comprados pelo cliente com o nome 'João Silva'.
SELECT p.nome, c.nome, pe.data_pedido FROM Produto as p
INNER JOIN ItemPedido as item
on item.produto_id = p.id
inner join Pedido as pe 
on pe.id = pedido_id	
inner join Cliente as c
on c.id =  pe.cliente_id
where c.nome = 'João Silva'

--7. Escreva uma consulta para listar todos os pedidos com produtos e quantidades, ordenados pela data do pedido.
SELECT Produto.nome, ItemPedido.quantidade, Cliente.nome, Pedido.data_pedido
from Produto
inner join ItemPedido 
on ItemPedido.produto_id = produto_id
inner join Pedido
on pedido_id = ItemPedido.pedido_id
inner join Cliente
on cliente_id = Pedido.cliente_id
ORDER BY Pedido.data_pedido asc

--8. Escreva uma consulta para listar todos os produtos e a quantidade de pedidos em que foram incluídos.
SELECT Produto.nome, COUNT(ItemPedido.id) AS QUANTIDADEPEDIDOS
FROM Produto
INNER JOIN ItemPedido 
ON produto_id = ItemPedido.produto_id
group by Produto.nome

--9. Escreva uma consulta para listar todos os fornecedores que fornecem produtos com preço superior a 500.
SELECT Fornecedor.nome as NomeFornecedor , Produto.nome as Produto , Produto.preco
from Produto
inner join Fornecedor
on fornecedor_id = Produto.fornecedor_id
where Produto.preco > 500

--10. Escreva uma consulta para listar todos os produtos que não foram incluídos em nenhum pedido.
SELECT Produto.nome
from Produto
left join ItemPedido
on produto_id = ItemPedido.produto_id
where pedido_id is null 

--11. Escreva uma consulta para listar todos os produtos e as manutenções realizadas em cada um.
SELECT Produto.nome, Manutencao.produto_id, Manutencao.data, Manutencao.descricao
from Produto
inner join Manutencao
on Manutencao.produto_id = Produto.id

--12. Escreva uma consulta para listar todos os produtos que têm quantidade em estoque e preço acima de 100.
SELECT Produto.nome, Produto.quantidade_estoque, Produto.preco
from Produto
where preco > 100 and Produto.quantidade_estoque > 0

--13. Escreva uma consulta para listar todos os clientes que fizeram pedidos no mês de janeiro de 2024
SELECT * FROM Cliente AS C
INNER JOIN Pedido AS P 
ON C.id = P.cliente_id
WHERE P.data_pedido LIKE '2024-01%'

--14. Escreva uma consulta para listar todos os produtos que pertencem às categorias 'Eletrônicos' e 'Roupas'.
select Produto.nome , Categoria.nome
from Produto
inner join Categoria 
on categoria_id = Produto.categoria_id
where Categoria.nome = 'Eletrônicos' OR Categoria.nome = 'Roupas'

--15. Escreva uma consulta para listar todos os produtos que não foram fornecidos pelo fornecedor com o nome 'Fornecedor B'.
select Produto.nome, Fornecedor.nome
from Produto
inner join Fornecedor 
on Produto.fornecedor_id = fornecedor_id
where Fornecedor.nome != 'Fornecedor B'

--16. Escreva uma consulta para listar o produto mais caro de cada categoria. -- DÚVIDA -- PEDIR AO PROFESSOR
SELECT Produto.nome AS Produto, Categoria.nome AS Categoria, Produto.preco AS Preco
FROM Produto
INNER JOIN Categoria 
ON Produto.categoria_id = Categoria.id
WHERE Produto.preco = (
    SELECT MAX(p.preco)
    FROM Produto p
    WHERE p.categoria_id = Produto.categoria_id
);

--17. Escreva uma consulta para listar todos os clientes que não fizeram pedidos no último mês. -- DÚVIDA -- PEDIR AO PROFESSOR
SELECT Cliente.nome, Pedido.data_pedido as DataUltimoPedido
from Cliente
inner join Pedido
on Cliente.id = Pedido.cliente_id
where Pedido.data_pedido < 

--18 Escreva uma consulta para listar os pedidos que contêm mais de 3 produtos.
SELECT Pedido.id, COUNT(ItemPedido.produto_id) AS QUANTIDADEPRODUTOS
from Pedido
inner join ItemPedido 
on Pedido.id = ItemPedido.pedido_id
group by Pedido.id
having COUNT(ItemPedido.produto_id) > 3

--19. Escreva uma consulta para listar todos os produtos que foram comprados por todos os clientes. -- duvida 
SELECT Produto.nome
FROM Produto
WHERE NOT EXISTS (
    SELECT 1
    FROM Cliente
    WHERE NOT EXISTS (
        SELECT 1
        FROM Pedido
        INNER JOIN ItemPedido ON Pedido.id = ItemPedido.pedido_id
        WHERE ItemPedido.produto_id = Produto.id
        AND Pedido.cliente_id = Cliente.id
    )
);

--20. Escreva uma consulta para listar todos os produtos que não têm manutenção registrada
SELECT Produto.nome
FROM Produto
inner join Manutencao on Manutencao.produto_id = Produto.id
where Manutencao.produto_id is null

--21 21. Escreva uma consulta para listar todos os pedidos com o total gasto em cada um.
SELECT Pedido.id AS PedidoID, SUM(ItemPedido.quantidade * Produto.preco) AS TotalGasto
FROM Pedido
INNER JOIN ItemPedido ON Pedido.id = ItemPedido.pedido_id
INNER JOIN Produto ON ItemPedido.produto_id = Produto.id
GROUP BY Pedido.id;

--22. Quantidade total de produtos vendidos por categoria

SELECT Categoria.nome AS CategoriaNome, SUM(ItemPedido.quantidade) AS QuantidadeTotalVendida
FROM Categoria
INNER JOIN Produto ON Categoria.id = Produto.categoria_id
INNER JOIN ItemPedido ON Produto.id = ItemPedido.produto_id
INNER JOIN Pedido ON ItemPedido.pedido_id = Pedido.id
GROUP BY Categoria.nom