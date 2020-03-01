DROP DATABASE IF EXISTS locadora;
CREATE DATABASE locadora;

USE locadora;

CREATE TABLE cliente(
codigo_cli 		INT PRIMARY KEY auto_increment,
cpf_cli 		CHAR(11) UNIQUE,
nome_cli 		VARCHAR(20) NOT NULL,
data_cadastro	DATE,
cidade_cli		VARCHAR(20), 
UF_cli			CHAR(2) DEFAULT 'CE'
);

CREATE TABLE categoria(
codigo				INT auto_increment,
nome_categoria		VARCHAR(20) NOT NULL,
CONSTRAINT pk_categoria PRIMARY KEY (codigo)
);

CREATE TABLE classe(
codigo			INT auto_increment,
nome_classe		VARCHAR(20) NOT NULL,
preco_classe	NUMERIC(5,2) NOT NULL,
CONSTRAINT pk_classe PRIMARY KEY (codigo)
);

CREATE TABLE titulo(
codigo				INT PRIMARY KEY auto_increment,
nome_titulo			VARCHAR(50) NOT NULL,
ano					NUMERIC(4),
codigo_categoria	INT NOT NULL,
codigo_classe		INT,
CONSTRAINT fk_titulo_categoria FOREIGN KEY (codigo_categoria)
	REFERENCES categoria(codigo)
    ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_titulo_classe FOREIGN KEY (codigo_classe)
	REFERENCES classe(codigo)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE filme(
codigo 				INT PRIMARY KEY auto_increment,
codigo_titulo		INT,
nome_distribuidor 	VARCHAR(20),
CONSTRAINT fk_filme_titulo	FOREIGN KEY (codigo_titulo)
	REFERENCES titulo(codigo)
    ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE emprestimo_devolucao(
codigo_cli				INT , -- auto_increment??
codigo_filme			INT,  -- auto_increment??
data_emprestimo			DATE NOT NULL,
data_devolucao_prevista	DATE,
data_devolucao_efetiva	DATE,
valor_multa				NUMERIC(4,2) DEFAULT 0,
CONSTRAINT pk_emprestimo_dev PRIMARY KEY (codigo_cli, codigo_filme, data_emprestimo),
CONSTRAINT fk_emp_dev_cliente FOREIGN KEY (codigo_cli)
	REFERENCES cliente(codigo_cli)
    ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT fk_emp_dev_filme FOREIGN KEY (codigo_filme)
	REFERENCES filme(codigo)
    ON DELETE CASCADE ON UPDATE CASCADE
);




