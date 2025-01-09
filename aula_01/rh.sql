CREATE DATABASE db_rh;

USE db_rh;

CREATE TABLE tb_funcionarios(
	id bigint auto_increment,
	nome varchar(255) NOT NULL,
	data_admissao date NOT NULL,
    data_demissao date,
	cargo varchar(50) NOT NULL,
	salario decimal (8,2) NOT NULL,
    ativo boolean NOT NULL,
    primary key(id)
);

SELECT * FROM tb_funcionarios;

INSERT INTO tb_funcionarios (nome, data_admissao, data_demissao, cargo, salario, ativo)
VALUES ('João da Silva', '2024-02-01', NULL, 'Desenvolvedor JavaScript Junior', 2000.00, true),
		('Maria Oliveira', '2023-06-15', NULL, 'Analista de Recursos Humanos', 4500.00, true),
		('Carlos Pereira', '2024-05-23', '2024-01-30', 'Gerente de Projetos', 7000.00, false),
		('Ana Souza', '2023-03-10', NULL, 'Assistente de Marketing Digital', 1800.00, true),
		('Luís Mendes', '2023-09-01', NULL, 'Engenheiro de Dados', 8000.00, true);
        
SELECT * FROM tb_funcionarios WHERE salario > 2000.00;

SELECT * FROM tb_funcionarios WHERE salario <= 2000.00;

UPDATE tb_funcionarios SET cargo = 'Coordenador(a) de Recursos Humanos', salario = 5200.00 WHERE id = 2;

