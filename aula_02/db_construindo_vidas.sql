CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias(
	id int auto_increment,
	tipo varchar (100) NOT NULL,
	aluguel_venda varchar (50) NOT NULL,
    primary key(id)
);

CREATE TABLE tb_produtos(
	id int auto_increment,
    nome_produto varchar(255) NOT NULL,
    disponibilidade_estoque int NOT NULL,
    lote varchar (255),
    marca varchar(50) NOT NULL,
    valor decimal (6,2) NOT NULL,
    categoriaid int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id) 
);

INSERT INTO tb_categorias (tipo, aluguel_venda)
VALUES ('Material de construção', 'Venda'),
		('Material para revestimento', 'Venda'),
		('Ferragens', 'Venda'),
		('Ferramentas', 'Aluguel'),
		('Maquinário pesado', 'Aluguel');
        

INSERT INTO tb_produtos (nome_produto, disponibilidade_estoque, lote, marca, valor, categoriaid)
VALUES ('Cimento Portland', 5042 , 'C684297', 'Votoran', 29.90, 1),
	('Tinta Acrílica', 320, 'T984321', 'Coral', 79.90, 2),
	('Bloco de Concreto', 15000, 'B567984', 'Votoran', 4.50, 1),
	('Parafuso Autobrocante', 5000, 'F123456', 'Gerdau', 4.80, 3),
	('Lixadeira Orbital', 5, 'M785421', 'Tssaper', 161.90, 5),
	('Serra Circular', 10, 'S456789', 'Makita', 349.90, 5),
	('Tubos PVC 50mm', 2000, 'T563421', 'Amanco', 7.90, 1),
	('Cimento Queimado', 1200, 'C823417', 'Imperial', 23.90, 2);

SELECT * FROM tb_produtos;

SELECT nome_produto, marca, CONCAT('R$ ', FORMAT(valor, 2, 'pt_BR')) AS Valor FROM tb_produtos;

SELECT * FROM tb_produtos WHERE valor >= 100.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 70.00 AND 150.00;

SELECT * FROM tb_produtos WHERE nome_produto LIKE '%C%';

SELECT * FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

SELECT * FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id
WHERE tb_categorias.tipo = 'Ferragens';
