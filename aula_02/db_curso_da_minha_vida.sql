CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias(
	id int auto_increment,
	setor varchar (100) NOT NULL,
	area varchar (50) NOT NULL,
    primary key(id)
);

CREATE TABLE tb_cursos(
	id int auto_increment,
    nome varchar(255) NOT NULL,
    duracao_meses int NOT NULL,
    valor_total decimal(7,2) NOT NULL,
    certificado boolean NOT NULL,
    categoriaid int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoriaid) REFERENCES tb_categorias(id) 
);

INSERT INTO tb_categorias (setor, area)
VALUES ('Construção', 'Exatas'),
		('Tecnologia da Informação', 'Exatas'),
		('Saúde', 'Biológicas'),
		('Educação', 'Humanas'),
		('Comunicação', 'Humanas');
        

INSERT INTO tb_cursos (nome, duracao_meses, valor_total, certificado, categoriaid)
VALUES ('Leitura e interpretação de projetos', 3, 700.00, true, 1),
	('Desenvolvimento de Software', 6, 1200.00, true, 2),
	('Cuidados com a Saúde Mental', 2, 450.00, true, 3),
	('Pedagogia e Didática para Ensino a Distância', 4, 800.00, true, 4),
	('Comunicação Digital e Marketing de Influência', 3, 600.00, true, 5),
	('Gestão de Obras e Projetos', 5, 1100.00, true, 1),
	('Introdução à Inteligência Artificial', 4, 950.00, true, 2),
	('Primeiros Socorros e Emergências', 1, 250.00, true, 3);

SELECT * FROM tb_cursos;

SELECT nome, duracao_meses, CONCAT('R$ ', FORMAT(valor_total, 2, 'pt_BR')) AS Valor FROM tb_cursos;

SELECT * FROM tb_cursos WHERE valor_total >= 500.00;

SELECT * FROM tb_cursos WHERE valor_total BETWEEN 600.00 AND 1000.00;

SELECT * FROM tb_cursos WHERE nome LIKE '%j%';

SELECT * FROM tb_cursos INNER JOIN tb_categorias 
ON tb_cursos.categoriaid = tb_categorias.id;

SELECT * FROM tb_cursos INNER JOIN tb_categorias 
ON tb_cursos.categoriaid = tb_categorias.id
WHERE tb_categorias.area = 'Exatas';
