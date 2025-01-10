CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
	id int auto_increment,
	classe varchar(50) NOT NULL,
	descricao_classe varchar(255) NOT NULL,
    primary key(id)
);

CREATE TABLE tb_personagens(
	id int auto_increment,
    nome varchar(255),
    poder_ataque int NOT NULL,
    poder_defesa int NOT NULL,
    arma_principal varchar (50),
    habilidade_especifica varchar (255),
    categoriaid int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (categoriaid) REFERENCES tb_classes(id) 
);

SELECT * FROM tb_personagens;

INSERT INTO tb_classes (classe, descricao_classe)
VALUES ('Guerreiro(a)', 'Alta resistência, força física e habilidades de combate corpo a corpo'),
		('Mago', 'Inteligência, habilidades mágicas poderosas e baixo poder de defesa física.'),
		('Ladino', 'Agilidade, furtividade e ataques rápidos e precisos.'),
		('Caçadora', 'Especialista em combate à distância, rastreamento, sobrevivência e uso de armadilhas.'),
		('Duelista', 'Habilidade excepcional em combate 1v1, rapidez, destreza e precisão com armas leves.');
        
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, arma_principal, habilidade_especifica, categoriaid)
VALUES ('Thorin', 2300, 1800, 'Espada longa', 'Força e ética inabalável', 1),
		('Merlin', 2000, 1500, 'Cajado arcano', 'Conjuração de feitiços poderosos', 2),
		('Kael', 1700, 1500, 'Adaga afiada', 'Ataques furtivos e evasão', 3),
		('Sylas', 1900, 1600, 'Arco longo', 'Rastreio e precisão letal', 4),
		('Ronan', 1800, 2000, 'Espada curvada', 'Especialista em esquiva', 5),
		('Lyria', 2100, 1800, 'Varinha mágica', 'Manipulação de energia elementar', 2),
		('Varek', 2100, 1900, 'Martelo de guerra', 'Destruição de armaduras e defesa impenetrável', 1),
		('Caden', 1600, 1400, 'Besta', 'Precisão letal e armadilhas traiçoeiras', 4);


SELECT * FROM tb_personagens WHERE poder_ataque >= 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 and 2000;

SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT * FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.categoriaid = tb_classes.id;

SELECT * FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.categoriaid = tb_classes.id
WHERE tb_classes.classe = 'Mago';

