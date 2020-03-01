-- Recriar o banco
-- Primeira e segunda insercao
INSERT INTO titulo (nome_titulo, ano, codigo_categoria, codigo_classe) 
VALUES ('Como Eu Era Antes de Você', 2016, 2, 2);


INSERT INTO cliente (cpf_cli, nome_cli, cidade_cli, data_cadastro) 
VALUES ('02252571243', 'André', 'Acopiara', '2006-01-10');
INSERT INTO cliente (cpf_cli, nome_cli, cidade_cli, data_cadastro) 
VALUES ('00052571243', 'Gustavo', 'Iguatu', '2010-05-20');
INSERT INTO cliente (cpf_cli, nome_cli, cidade_cli, data_cadastro) 
VALUES ('10252821243', 'Francisca Maria', 'Acopiara', '2019-02-02');
INSERT INTO cliente (cpf_cli, nome_cli, cidade_cli, data_cadastro) 
VALUES ('90252421203', 'Francisca Clara', 'Acopiara', '2019-06-25');


/*
*********************************
SELECT <atributos>
FROM <tabela>
WHERE <condicao>
*/
-- Selecionar o nome de todos os clientes da locadora.
SELECT nome_cli FROM cliente;

-- Selecionar o nome e o cpf de todos os clientes da locadora.
SELECT nome_cli, cpf_cli FROM cliente;

-- Selecionar todos os atributos dos clientes.
SELECT * FROM cliente;

-- Retornar o nome de todos os clientes que moram em Acopiara.
SELECT nome_cli FROM cliente WHERE cidade_cli = "Acopiara";

-- Encontre o nome de todos os clientes da cidade de Acopiara que 
-- tenham data de cadastro no ano de 2019 .
SELECT nome_cli FROM locadora.cliente WHERE cidade_cli = 'Acopiara' AND
data_cadastro BETWEEN '2019-01-01' AND '2019-12-31';




/*
*********************************
Expressões aritméticas 
*/
-- Verifique como ficariam os preços de filmes se aumentássemos em 5%.
SELECT nome_classe, preco_classe * 1.05 FROM classe;
-- Não altera o valor na tabela!



/*
*********************************
Combinando Tabelas
Produto cartesiano e INNER JOIN
*/
-- Retornar os nomes dos titulos e das suas categorias
SELECT * FROM titulo; -- So possui o nome do titulo
SELECT * FROM categoria; -- So possui o nome da categoria

SELECT nome_titulo, nome_categoria FROM titulo, categoria 
WHERE titulo.codigo_categoria = categoria.codigo; -- (PK == FK)

-- INNER JOIN
SELECT nome_titulo, nome_categoria 
FROM titulo INNER JOIN categoria 
ON titulo.codigo_categoria = categoria.codigo;


/*
*********************************
Apelido - aliases (AS)
*/
SELECT nome_classe, preco_classe * 1.05 AS 'Aumento' 
FROM classe;

SELECT nome_titulo, nome_categoria FROM titulo t INNER JOIN categoria c
ON t.codigo_categoria = c.codigo;



/*
*********************************
Comparando strings com LIKE
*/
SELECT nome_cli, cpf_cli FROM cliente
WHERE nome_cli like 'Fra%';

SELECT nome_cli, cpf_cli FROM cliente
WHERE nome_cli like '____a'; -- 4 underlines



/*
*********************************
Operador IN e NOT IN
*/
-- Retornar os títulos das categorias: drama, terror, romance
SELECT t.nome_titulo as titulo, c.nome_categoria as categoria
FROM titulo t
INNER JOIN categoria c ON c.codigo = t.codigo_categoria
WHERE c.nome_categoria IN ('Drama', 'Terror', 'Romance');



/*
*********************************
ORDER BY 
*/
SELECT nome_titulo, ano FROM titulo
ORDER BY nome_titulo DESC; -- DESC



/*
*********************************
Funções de agregação (avg, sum, min, max, count)
*/
-- Quantidade de filmes
SELECT COUNT(*) as 'quantidade de clientes' FROM cliente;



/*
*********************************
GROUP BY
*/
-- Retornar a quantidade de títulos por categoria
SELECT COUNT(t.codigo) AS "Quantidade de Títulos", c.nome_categoria
FROM titulo t
INNER JOIN categoria c ON t.codigo_categoria = c.codigo
GROUP BY c.nome_categoria;

-- Retornar a quantidade de títulos 
SELECT COUNT(t.codigo) AS "Quantidade de Títulos"
FROM titulo t
INNER JOIN categoria c ON t.codigo_categoria = c.codigo;


 
/*
*********************************
Consulta aninhada
*/
SELECT nova_tabela.nome_cli AS 'nome cliente', nova_tabela.quantidade
FROM 
	(SELECT c.nome_cli, COUNT(ed.data_emprestimo) AS QUANTIDADE
	 FROM cliente c
     INNER JOIN emprestimo_devolucao ed ON c.codigo_cli = ed.codigo_cli
     GROUP BY c.nome_cli) AS nova_tabela
WHERE nova_tabela.quantidade >= 2;