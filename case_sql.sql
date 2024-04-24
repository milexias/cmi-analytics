-- Criação da tabela "clientes"
DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes(
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    email VARCHAR(100),
    data_cadastro DATE
);

-- Inserção de dados na tabela "clientes"
INSERT INTO clientes (id, nome, idade, email, data_cadastro) VALUES(1, "Alexia", 25, "alexia@gmail.com","2024-04-01");
INSERT INTO clientes (id, nome, idade, email, data_cadastro) VALUES(2, "Pamela", 41, "pamela@gmail.com","2024-04-01");
INSERT INTO clientes (id, nome, idade, email, data_cadastro) VALUES(3, "Otto", 26, "otto@gmail.com","2024-04-01");
INSERT INTO clientes (id, nome, idade, email, data_cadastro) VALUES(4, "Carol", 32, "carol@gmail.com","2024-04-01");
INSERT INTO clientes (id, nome, idade, email, data_cadastro) VALUES(5, "Patricia", 19, "patricia@gmail.com","2024-04-01");
INSERT INTO clientes (id, nome, idade, email, data_cadastro) VALUES(6, "Rodrigo", 31, "rodrigo@gmail.com","2024-04-01");
INSERT INTO clientes (id, nome, idade, email, data_cadastro) VALUES(7, "Francisco", 36, "francisco@gmail.com","2024-04-01");

-- Nome e a idade dos clientes com mais de 30 anos
SELECT nome, idade FROM clientes WHERE idade > 30;

-- Número total de clientes na tabela
SELECT COUNT(id) FROM clientes;

-- Atualizar o email de um cliente específico
UPDATE clientes SET email = "francisco@gmail.com" WHERE nome = "Francisco";

-- Remover um cliente da tabela
DELETE FROM clientes WHERE id = 2;

-- Criação da tabela "pedidos"
DROP TABLE IF EXISTS pedidos;
CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT REFERENCES clientes(id),
    produto TEXT,
    quantidade INT
);

-- Inserção de dados na tabela "compras"
INSERT INTO pedidos (id, cliente_id, produto, quantidade) VALUES (1, 5, "Mouse Ergonomico", 1);
INSERT INTO pedidos (id, cliente_id, produto, quantidade) VALUES (2, 3, "Teclado Ergonomico", 1);
INSERT INTO pedidos (id, cliente_id, produto, quantidade) VALUES (3, 4, "Fone de Ouvido ANC", 2);
INSERT INTO pedidos (id, cliente_id, produto, quantidade) VALUES (4, 1, "Mouse Ergonomico", 1);

-- Consulta para exibir o nome do cliente, o produto e a quantidade
SELECT clientes.nome, pedidos.produto
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;

-- Consulta para exibir o nome do cliente, o produto e a quantidade (incluindo clientes sem compras)
SELECT clientes.nome, pedidos.produto, pedidos.quantidade
FROM pedidos
RIGHT JOIN clientes ON pedidos.id = clientes.id;
