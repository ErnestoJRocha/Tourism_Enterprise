USE master;

--DropDB Gestão_Excursões
IF DB_ID('Gestao_Excursoes') is NOT NULL 
DROP DATABASE Gestao_Excursoes;

--Criar DB Gestão_Excursões
CREATE DATABASE Gestao_Excursoes;
GO

USE Gestao_Excursoes

CREATE TABLE Motorista (
	carta_conducao nvarchar(20),
	categoria nvarchar(15),
	come nvarchar(20)
	PRIMARY KEY (carta_conducao)
);

CREATE table Autocarros(
  cod_matricula nvarchar(10),
  marca NVARCHAR (20),
  carta_conducao nvarchar(20),
  num_lugares Int,
  ano int, 
  autonomia Int,
  wc bit,
  aluguer Int,
  PRIMARY KEY (cod_matricula),
  FOREIGN KEY (carta_conducao) REFERENCES Motorista
);

 CREATE TABLE Hospedes (
  nif nvarchar(10),
  nome nvarchar(30),
  idade int,
  email nvarchar(30),
  num_telefone nvarchar(15),
  num_quarto nvarchar (3)
  PRIMARY KEY (nif)
);

CREATE TABLE Guia (
  cod_guia int IDENTITY(1, 1),
  nome nvarchar(20),
  nif nvarchar (10),
  morada nvarchar(50),
  email nvarchar(15),
  num_telefone nvarchar(15),
  PRIMARY KEY (cod_Guia)
);

  CREATE TABLE Epoca (
  epoca nvarchar(10) NOT NULL,
  preco int
  PRIMARY KEY (epoca)
);

CREATE TABLE Excursao_Tipo(
  tipo_excursao nvarchar(50),
	trajecto nvarchar(50),
	preco_base int,
	epoca nvarchar(10),
	FOREIGN KEY (epoca) REFERENCES Epoca,
	PRIMARY KEY (tipo_excursao)
);

CREATE TABLE Excursao (
  cod_excursao int IDENTITY (1, 1),
  nome nvarchar(20),
  data_de_partida Date,
  data_de_chegada Date,
  horario_partida time,
  horario_chegada time,
  cod_guia int,
  tipo_excursao nvarchar(50),
  cod_matricula nvarchar(10), 
  nif_hospede nvarchar(10),
  PRIMARY KEY (cod_excursao),
  FOREIGN KEY (tipo_excursao) REFERENCES Excursao_Tipo,
  FOREIGN KEY (cod_guia) REFERENCES Guia,
  FOREIGN KEY (cod_matricula) REFERENCES Autocarros,
  FOREIGN KEY (nif_hospede) REFERENCES Hospedes
);

CREATE TABLE Excursao_Guia (
	cod_excursao int,
	cod_guia int,
	FOREIGN KEY (cod_excursao) REFERENCES Excursao,
	FOREIGN KEY (cod_guia) REFERENCES Guia,
);

CREATE TABLE Excursao_Hospede(
	cod_excursao int,
	nif_hospede nvarchar(10),
	FOREIGN KEY (cod_excursao) REFERENCES Excursao,
	FOREIGN KEY (nif_hospede) REFERENCES Hospedes
);


