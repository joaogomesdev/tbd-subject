--Create Database

CREATE DATABASE Revisoes_Automoveis
GO
USE Revisoes_Automoveis
GO

--Criar Tabelas
CREATE TABLE Automovel(
	matricula VARCHAR(8) CONSTRAINT ck_automovel_matricula CHECK (matricula LIKE '[0-9][0-9]-[A-Z][A-Z]-[0-9][0-9]' OR matricula LIKE '[0-9][0-9]-[0-9][0-9]-[A-Z][A-Z]' OR matricula LIKE '[A-Z][A-Z]-[0-9][0-9]-[0-9][0-9]') CONSTRAINT pk_automovel_matricula PRIMARY KEY,
	marca VARCHAR(40) CONSTRAINT nn_automovel_marca NOT NULL,
	cilindrada INTEGER CONSTRAINT ck_automovel_cilindrada CHECK (cilindrada BETWEEN 500 AND 6000),
	ano_fabrico INTEGER CONSTRAINT ck_automovel_ano_fabrico CHECK (ano_fabrico > 1900),
	preco_venda DECIMAL(8,2) CONSTRAINT ck_automovel_preco_venda CHECK (preco_venda > 0)
)

CREATE TABLE Cliente(
	id_cliente INTEGER IDENTITY(0,1) CONSTRAINT pk_cliente_id_cliente PRIMARY KEY,
	nome VARCHAR(80) CONSTRAINT nn_cliente_nome NOT NULL,
	nr_identificacao_civil INTEGER CONSTRAINT ck_cliente_nr_identificacao_civil CHECK (nr_identificacao_civil > 0 AND nr_identificacao_civil LIKE '[0-9][0-9][0-9][0-9][0-9][0-9]') NULL,
	nif INTEGER CONSTRAINT ck_cliente_nif CHECK (nif >= 100000000) CONSTRAINT nn_automovel_ano_fabrico NOT NULL,
	data_nascimento DATE CONSTRAINT nn_cliente_data_nascimento NOT NULL --'AAAA-MM-DD'
)

CREATE TABLE Revisao(
	matricula VARCHAR(8) CONSTRAINT FK_Revisao_Automovel REFERENCES Automovel(matricula),
	data_hora_marcacao DATETIME, CONSTRAINT ck_hora_marcacao CHECK (data_hora_marcacao LIKE 'AAAA-MM-DD [HH:MM[:SS[.mmm]]]') --'2021-04-16 21:46'
	estado VARCHAR(1) CONTRAINT CK_Revisao_estado CHECK(estado LIKE '[SN]') ---estado LIKE '[S]' OR estado LIKE '[N]'
	CONSTRAINT PK_Revisao(matricula, data_hora_marcacao)
	)

