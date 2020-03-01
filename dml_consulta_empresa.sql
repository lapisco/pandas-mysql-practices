/*
*********************************
SELECT <atributos>
FROM <tabela>
WHERE <condicao>
*/
SELECT * FROM funcionario WHERE dnr = 5;

-- C1: Obtenha a data de nascimento e o endereço do(s) funcionário(s) cujo 
-- nome seja `John B Smith'.
SELECT	data_nasc, endereco
FROM	FUNCIONARIO
WHERE	Pnome = 'John'
AND	Minicial = 'B'
AND	Unome = 'Smith';


/*
*********************************
Comando DISTINCT
*/
SELECT salario FROM funcionario;

-- C2: Recuperar todos os valores de salário sem repetição
SELECT DISTINCT salario FROM funcionario;

/*
*********************************
Comando UNION
*/
-- C3: Obter o cpf dos empregados do departamento 5 e do seus supervisores.
SELECT * FROM funcionario; -- Todos funcionarios

(SELECT cpf
FROM	funcionario
WHERE	dnr = 5)
UNION
(SELECT cpf_supervisor
FROM	funcionario
WHERE	dnr = 5);


/*
Combinando Tabelas
Produto cartesiano e INNER JOIN
*/
-- C4: Obtenha o nome e endereço de todos os empregados que trabalham para o 
-- departamento de `Pesquisa'.
SELECT * FROM funcionario; -- Só inf. do func. N tem o nome do departamento.
SELECT * FROM departamento;
-- O que conecta as 2 tabelas?

SELECT	pnome, unome, endereco
FROM 	departamento, funcionario
WHERE	dnumero = dnr
AND	dnome = 'Pesquisa';




-- Apelido
SELECT pnome, unome
FROM	funcionario AS f, dependente AS d
WHERE	f.cpf = d.fcpf
AND	d.sexo = 'M';

















-- LIKE
SELECT pnome, unome, endereco
FROM	funcionario
WHERE	endereco LIKE '%Houston%';




-- ORDER BY
SELECT pnome, unome, salario
FROM	funcionario
WHERE	dnr = 5
ORDER BY	salario;


