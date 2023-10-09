-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql - banco local - ambiente de desenvolvimento
*/

CREATE DATABASE GkExperience;

USE GkExperience;

CREATE TABLE areaAtuacao (
	id int PRIMARY KEY ,
	areaAtuacao varchar(20)
);

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
	fkAreaAtuacao int ,
	FOREIGN KEY (fkAreaAtuacao) REFERENCES areaAtuacao(id)
);


CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

CREATE TABLE quizAcertos (
	idQuizAcertos INT PRIMARY KEY AUTO_INCREMENT,
	pontuacao int,
	diaRealizado date, 
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

CREATE VIEW usuariosAvisos AS
SELECT
  usuario.nome,
  areaAtuacao.areaAtuacao,
  aviso.titulo,
  aviso.descricao
FROM
  usuario
  INNER JOIN aviso ON usuario.id = aviso.fk_usuario
  INNER JOIN areaAtuacao ON usuario.fkAreaAtuacao = areaAtuacao.id;

  SELECT * FROM usuariosAvisos;

CREATE VIEW rankingAcertos AS
SELECT
  usuario.nome,
  quizAcertos.pontuacao,
  quizAcertos.diaRealizado
FROM
  quizAcertos
INNER JOIN usuario ON quizAcertos.fk_usuario = usuario.id
ORDER BY
  quizAcertos.pontuacao DESC;


