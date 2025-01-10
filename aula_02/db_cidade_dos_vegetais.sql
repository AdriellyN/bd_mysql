CREATE DATABASE db_cidade_dos_vegetais;

USE db_cidade_dos_vegetais;

CREATE TABLE tb_categorias(
	id int auto_increment,
	categoria varchar (100) NOT NULL,
	descricao varchar (255) NOT NULL,
    primary key(id)
);

CREATE TABLE tb_produtos(
	id int auto_increment,
    nome varchar(255) NOT NULL,
    estoque int NOT NULL,
    data_validade date NOT NULL,
    valor decimal (6,2) NOT NULL,
    categoriaid int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id) 
);

INSERT INTO tb_categorias (categoria, descricao)
VALUES ('Fruta', 'Rico em vitaminas e fibras'),
		('Verdura', 'Rico em vitaminas e nutrientes'),
		('Legume', 'Alto valor nutricional'),
		('Tubérculo', 'Rico em amido e carboidratos'),
		('Cogumelo', 'Rico em proteínas e nutrientes essenciais');
        

INSERT INTO tb_produtos (nome, estoque, data_validade, valor, categoriaid)
VALUES ('Tomate', 520 , '2025-03-11', 5.89, 1),
	('Banana', 800, '2025-04-15', 3.49, 1),
	('Alface', 300, '2025-01-30', 2.99, 2),
	('Cenoura', 650, '2025-03-25', 4.29, 3),
	('Batata', 1200, '2025-06-10', 3.19, 4),
	('Pepino', 450, '2025-05-20', 3.99, 3),
	('Cogumelo Champignon', 180, '2025-07-05', 16.50, 5),
	('Abobrinha', 400, '2025-08-01', 5.49, 3);

SELECT * FROM tb_produtos;

SELECT nome, estoque, CONCAT('R$ ', FORMAT(valor, 2, 'pt_BR')) AS Valor FROM tb_produtos;

SELECT * FROM tb_produtos WHERE valor >= 5.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 15.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT * FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoriaid = tb_categorias.id
WHERE tb_categorias.categoria = 'Cogumelo';
