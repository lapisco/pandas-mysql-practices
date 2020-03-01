-- Considerando que o banco é novo
INSERT INTO cliente (cpf_cli, nome_cli) VALUES ('01252571243', 'Maria'); -- codigo 1
INSERT INTO cliente (cpf_cli, nome_cli, cidade_cli, data_cadastro) 
VALUES ('00052421243', 'Antonio Carlos', 'Acopiara', '2019-06-11'); -- cod 2


INSERT INTO classe 	(nome_classe, preco_classe)	VALUES ('Lançamento', 7.50); -- codigo 1
INSERT INTO classe 	(nome_classe, preco_classe)	VALUES ('Catálogo', 5.50); -- codigo 2
INSERT INTO categoria (nome_categoria) 			VALUES ('Ação'); -- codigo 1
INSERT INTO categoria (nome_categoria) 			VALUES ('Romance'); -- codigo 2

INSERT INTO titulo (nome_titulo, ano, codigo_categoria, codigo_classe) 
VALUES ('Men in Black: International', 2019, 1, 1); -- codigo 1

INSERT INTO filme (codigo_titulo, nome_distribuidor) VALUES (1, 'Alpha Filmes'); -- codigo 1


INSERT INTO emprestimo_devolucao (codigo_cli, codigo_filme, data_emprestimo, data_devolucao_prevista)
VALUES (1, 1, '2019-7-4', '2019-7-11');

-- Segunda inserção
INSERT INTO titulo (nome_titulo, ano, codigo_categoria, codigo_classe) 
VALUES ('Orgulho e Preconceito', 2006, 1, 2); -- codigo 2

INSERT INTO filme (codigo_titulo, nome_distribuidor) VALUES (2, 'Focus Filmes'); -- codigo 2

INSERT INTO emprestimo_devolucao (codigo_cli, codigo_filme, data_emprestimo, data_devolucao_prevista)
VALUES (1, 2, '2019-7-4', '2019-7-11');

INSERT INTO emprestimo_devolucao (codigo_cli, codigo_filme, data_emprestimo, data_devolucao_prevista)
VALUES (2, 2, '2020-1-4', '2020-1-11');


/*
DELETE FROM <tabela>
WHERE <condicao>

Apaga linhas da tabela
Apagamos tabela com o DROP
*/
DELETE FROM emprestimo_devolucao WHERE codigo_filme = 1;
-- CUIDADO! Sem o WHERE todas as linhas são apagadas!

-- Se apagar uma linha de uma tabela referenciada por outra?
DELETE FROM filme WHERE codigo = 2;

-- Vai depender do ON DELETE CASCADE na criação da tabela


/*
UPDATE <tabela> 
SET <atributos,>
WHERE <condicao>
*/
UPDATE classe
SET preco_classe = 9.50
WHERE codigo = 1; -- "Lançamento"

-- CUIDADO! Sem o WHERE todas as linhas são alteradas!