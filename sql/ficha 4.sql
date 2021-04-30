CREATE DATABASE Automoveis
GO
USE Automoveis
GO

--Criar Tabelas
CREATE TABLE Automovel(
	matricula VARCHAR(8) CONSTRAINT CK_automovel_matricula CHECK (matricula LIKE '[0-9][0-9]-[A-Z][A-Z]-[0-9][0-9]' OR matricula LIKE '[0-9][0-9]-[0-9][0-9]-[A-Z][A-Z]' OR matricula LIKE '[A-Z][A-Z]-[0-9][0-9]-[0-9][0-9]') CONSTRAINT pk_automovel_matricula PRIMARY KEY,
	marca VARCHAR(40) CONSTRAINT NN_automovel_marca NOT NULL,
	cilindrada INTEGER CONSTRAINT CK_automovel_cilindrada CHECK (cilindrada BETWEEN 500 AND 6000),
	ano_fabrico INTEGER CONSTRAINT CK_automovel_ano_fabrico CHECK (ano_fabrico > 1900),
	preco_venda DECIMAL(8,2) CONSTRAINT CK_automovel_preco_venda CHECK (preco_venda > 0)
)

CREATE TABLE Cliente(
	id_cliente INTEGER IDENTITY(1,1) CONSTRAINT PK_cliente_id_cliente PRIMARY KEY,
	nome VARCHAR(80) CONSTRAINT NN_cliente_nome NOT NULL,
	nr_identificacao_civil INTEGER CONSTRAINT CK_cliente_nr_identificacao_civil CHECK (nr_identificacao_civil > 0 AND NR_identificacao_civil LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]') NULL,
	nif INTEGER CONSTRAINT CK_cliente_nif CHECK (nif >= 100000000) CONSTRAINT nn_automovel_ano_fabrico NOT NULL,
	data_nascimento DATE CONSTRAINT NN_cliente_data_nascimento NOT NULL --'AAAA-MM-DD'
)
GO
CREATE  UNIQUE   NONCLUSTERED INDEX ix_cliente_nr_identificacao_civil
ON Cliente ( nr_identificacao_civil )
WHERE nr_identificacao_civil IS NOT NULL

GO
CREATE TABLE Revisao(
	matricula VARCHAR(8) CONSTRAINT FK_Revisao_Automovel REFERENCES Automovel(matricula),
	data_hora_marcacao DATETIME, CONSTRAINT CK_hora_marcacao CHECK (data_hora_marcacao LIKE 'AAAA-MM-DD [HH:MM[:SS[.mmm]]]'), --'2021-04-16 21:46'
	estado VARCHAR(1) CONSTRAINT CK_Revisao_estado CHECK(estado LIKE '[SN]') CONSTRAINT PK_Revisao PRIMARY KEY(matricula, data_hora_marcacao) ---estado LIKE '[S]' OR estado LIKE '[N]'
	)

CREATE TABLE Automovel_Cliente(
	matricula varchar(8) CONSTRAINT FK_Automovel_Cliente_Automovel FOREIGN KEY REFERENCES Automovel(matricula),
	cliente INTEGER CONSTRAINT FK_Automovel_Cliente_Cliente FOREIGN KEY REFERENCES Cliente(id_cliente) CONSTRAINT PK_Automovel_Cliente PRIMARY KEY (matricula, cliente)
)

GO

INSERT INTO Automovel (matricula, marca, cilindrada, ano_fabrico, preco_venda)
	VALUES ('45-PD-98', 'Mercedes', 2300, 2000, 34050),
		   ('65-87-GR', 'Nissan', 1700, 2009, 23490.5),
		   ('42-90-AS', 'Kia', 1300, 2008, 20870),
		   ('BL-87-23', 'Volkswagen', 1100, 2017, 15600.75),
		   ('83-QD-27', 'BMW', 2100, 2014, 35600),
		   ('XO-65-98', 'Toyota', 2100, 2010, 15940);

INSERT INTO Cliente (nome, nr_identificacao_civil, nif, data_nascimento)
	VALUES ('Sérgio Conceição', 987345, 105098124, '1974-11-15'),
		   ('António Oliveira', 937587, 104052455, '1952-10-06'),
		   ('Fernando Santos', NULL, 102000906, '1954-10-10'),
		   ('Artur Jorge', 7098428, 100829087, '1946-02-13'),
		   ('Jesualdo Ferreira ', NULL, 107559969, '1946-05-24');

INSERT INTO Automovel_Cliente (matricula, cliente)
	VALUES ('65-87-GR',1),
		   ('83-QD-27',4),
		   ('42-90-AS',2),
		   ('45-PD-98',1),
		   ('XO-65-98 ',5),
		   ('BL-87-23 ',3)

INSERT INTO Revisao(matricula, data_hora_marcacao, estado)
	VALUES ('65-87-GR', '2018-10-04 09:00', 'N'),
		   ('83-QD-27', '2018-11-04 14:45', 'N'),
		   ('42-90-AS', '2018-10-23 10:50', 'N'),
		   ('XO-65-98', '2018-12-01 18:30', 'N'),
		   ('65-87-GR', '2018-06-07 10:50', 'S'),
		   ('XO-65-98', '2016-11-22 12:20', 'S');