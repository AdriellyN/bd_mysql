CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
	id bigint auto_increment,
	nome_produto varchar(255) NOT NULL,
	categoria varchar(50) NOT NULL,
	valor decimal (8,2) NOT NULL,
    estoque int NOT NULL,
    descricao varchar(255),
    ativo boolean NOT NULL,
    primary key(id)
);

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos (nome_produto, categoria, valor, estoque, descricao, ativo)
VALUES ('Camiseta Estampada', 'Roupas', 49.90, 150, 'Camiseta de algodão com estampa', true),
		('Tênis Esportivo', 'Calçados', 199.90, 75, 'Tênis leve para corrida', true),
		('Smartphone XPro', 'Eletrônicos', 2499.00, 30, 'Smartphone com câmera de alta resolução', true),
		('Mixer Turbo', 'Eletrodomésticos', 149.90, 50, 'Mixer potente para preparar smoothies', true),
		('Mochila Adventure', 'Acessórios', 89.90, 100, 'Mochila impermeável para trilhas', true),
		('Relógio Inteligente', 'Eletrônicos', 899.90, 60, 'Relógio com monitoramento de saúde', true),
		('Fone de Ouvido Bluetooth', 'Acessórios', 199.90, 120, 'Fones sem fio com alta qualidade de som', true),
		('Bola de Futebol', 'Esportes', 79.90, 80, 'Bola de futebol oficial para jogos', true);
        
SELECT * FROM tb_produtos WHERE valor > 500.00;

SELECT * FROM tb_produtos WHERE valor <= 500.00;

UPDATE tb_produtos SET valor = 145.50, estoque = 49 WHERE id = 4;

