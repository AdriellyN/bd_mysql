CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
	id int auto_increment,
	tipo varchar (100) NOT NULL,
	receita_obrigatoria boolean NOT NULL,
    primary key(id)
);

CREATE TABLE tb_produtos(
	id int auto_increment,
    nome varchar(255) NOT NULL,
    estoque int NOT NULL,
    laboratorio varchar (255) NOT NULL,
    data_validade date NOT NULL,
    valor decimal (6,2) NOT NULL,
    categoriaid int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id) 
);

INSERT INTO tb_categorias (tipo, receita_obrigatoria)
VALUES ('Vitamina', false),
		('Medicamento de venda livre', false),
		('Medicamento controlado', true),
		('Produto de higiene pessoal', false),
		('Antibiótico', true);
        

INSERT INTO tb_produtos (nome, estoque, laboratorio, data_validade, valor, categoriaid)
VALUES ('Rivotril 2,5 mg', 442 , 'Cimed', '2026-12-11', 29.09, 3),
	('Vitamina C 500mg', 1200, 'Pharmalab', '2027-03-15', 15.50, 1),
	('Paracetamol 500mg', 850, 'NeoQuímica', '2026-08-25', 7.30, 2),
	('Morfina 10mg', 320, 'Eurofarma', '2025-10-10', 45.00, 3),
	('Shampoo Anticaspa', 540, 'Procter & Gamble', '2027-01-30', 22.90, 4),
	('Amoxicilina 500mg', 650, 'EMS', '2026-07-01', 20.00, 5),
	('Vitamina D 1000 UI', 950, 'Aché', '2027-06-20', 68.40, 1),
	('Diazepam 10mg', 430, 'EMS', '2025-11-15', 25.50, 3),
	('Sabonete Líquido Neutro', 700, 'Granado', '2027-05-10', 14.90, 4);

SELECT * FROM tb_produtos;

SELECT nome, laboratorio, CONCAT('R$ ', FORMAT(valor, 2, 'pt_BR')) AS Valor FROM tb_produtos;

SELECT * FROM tb_produtos WHERE valor >= 50.00;

SELECT * FROM tb_produtos WHERE valor BETWEEN 5.00 AND 60.00;

SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

SELECT * FROM tb_produtos WHERE laboratorio LIKE '%ph%';

SELECT * FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

SELECT * FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id
WHERE tb_categorias.receita_obrigatoria = true;

SELECT * FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id
WHERE tb_produtos.data_validade > '2026-02-01';