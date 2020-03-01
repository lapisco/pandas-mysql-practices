/*
DELETE FROM <tabela>
WHERE <condicao>

Apaga linhas da tabela
Apagamos tabela com o DROP
*/
DELETE FROM DEPENDENTE
WHERE nome_dependente = 'Alice' AND fcpf = '333445555';

-- CUIDADO! Sem o WHERE todas as linhas são apagadas!



/*
UPDATE <tabela> 
SET <atributos,>
WHERE <condicao>
*/
UPDATE projeto
SET plocalizacao = 'New York', dnum = 5
WHERE pnumero = 10;

-- CUIDADO! Sem o WHERE todas as linhas são alteradas!
