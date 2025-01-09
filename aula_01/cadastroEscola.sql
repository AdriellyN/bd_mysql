CREATE DATABASE db_cadastroEscola;

USE db_cadastroEscola;

CREATE TABLE tb_alunos(
	id bigint auto_increment,
	nomeCompleto varchar(255) NOT NULL,
	dataNascimento date NOT NULL,
    nomeResponsavel varchar(255) NOT NULL,
    nota decimal(3,1),
    matricula boolean NOT NULL,
    primary key(id)
);

SELECT * FROM tb_alunos;

INSERT INTO tb_alunos (nomeCompleto, dataNascimento, nomeResponsavel, nota, matricula)
VALUES ('João Gomes Silva', '2001-03-22', 'Lucia Gomes', 5.5, true),
		('Maria Clara Santos', '2000-11-15', 'Carlos Santos', 7.6, true),
		('Pedro Henrique Lima', '2002-05-10', 'Ana Lima', 4.0, true),
		('Juliana Oliveira', '1999-09-30', 'Roberto Oliveira', 10.0, true),
		('Lucas Almeida', '2003-01-12', 'Fernanda Almeida', 8.5, true),
		('Beatriz Costa', '2001-06-18', 'Julio Costa', 9.5, true),
		('Gabriel Ferreira', '2000-12-02', 'Marta Ferreira', 4.5, true),
		('Sofia Martins', '2002-07-25', 'Ricardo Martins', 9.0, true);
        
SELECT * FROM tb_alunos WHERE nota >= 7.0;

SELECT * FROM tb_alunos WHERE nota < 7.0;

UPDATE tb_alunos SET nota = 6.5, nomeResponsavel = 'Hugo Lima' WHERE id = 3;

