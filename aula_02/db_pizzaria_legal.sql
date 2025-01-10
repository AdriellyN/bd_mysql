CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
	id int auto_increment,
	tamanho varchar(50) NOT NULL,
	descricao varchar(255) NOT NULL,
    primary key(id)
);

INSERT INTO tb_categorias (tamanho, descricao)
VALUES ('Individual', '20 a 25 cm de diâmetro, ideal para 1 pessoa.'),
		('Pequena', '25 a 30 cm de diâmetro, serve 1 pessoa ou 2.'),
		('Média', '30 a 35 cm de diâmetro, serve de 2 a 3 pessoas.'),
		('Grande', '35 a 40 cm de diâmetro, ideal para 3 a 4 pessoas.'),
		('Tamanho família', '45 a 50 cm de diâmetro, serve até 6 pessoas.');
        

CREATE TABLE tb_pizzas(
	id int auto_increment,
    sabor varchar(255) NOT NULL,
    ingredientes varchar(255) NOT NULL,
    vegetariana boolean NOT NULL,
    valor decimal (5,2) NOT NULL,
    categoriaid int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id) 
);

INSERT INTO tb_pizzas (sabor, ingredientes, vegetariana, valor, categoriaid)
VALUES ('Margherita', 'Molho de tomate, mozzarela, manjericão e azeite de oliva', true, 45.90, 1),
	('Calabresa', 'Molho de tomate, queijo muçarela, calabresa fatiada, cebola e azeitonas', false, 38.90, 2),
	('Portuguesa', 'Molho de tomate, queijo muçarela, presunto, ovos, cebola, pimentão, azeitonas e ervilhas', false, 42.50, 3),
	('4 Queijos', 'Molho de tomate, queijo muçarela, queijo parmesão, queijo gorgonzola e queijo provolone', true, 46.80, 2),
	('Frango com Catupiry', 'Molho de tomate, queijo muçarela, frango desfiado, catupiry, milho e azeitonas', false, 41.00, 4),
	('Vegetariana', 'Molho de tomate, queijo muçarela, cogumelos, abobrinha, pimentão, azeitonas e cebola', true, 43.90, 3),
	('Marinara', 'Molho de tomate, alho, azeite de oliva, orégano e manjericão', true, 35.90, 1),
	('Napolitana', 'Molho de tomate, mozzarella de búfala, tomate fresco, manjericão e azeite de oliva', true, 49.90, 5);

SELECT * FROM tb_pizzas;

SELECT sabor, ingredientes, CONCAT('R$ ', FORMAT(valor, 2, 'pt_BR')) AS Valor FROM tb_pizzas;

SELECT * FROM tb_pizzas WHERE valor >= 45.00;

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE sabor LIKE '%M%';

SELECT * FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoriaid = tb_categorias.id;

SELECT * FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoriaid = tb_categorias.id
WHERE tb_categorias.tamanho = 'Individual';

