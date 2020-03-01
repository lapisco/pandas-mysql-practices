/*
Comando de inserção
*/
-- conhecendo a ordem dos atributos
INSERT INTO classe VALUES (1, 'Lançamento', 7.50);

-- sem conhecer a ordem
INSERT INTO classe (nome_classe, preco_classe) VALUES ('Lançamento', 7.50);
INSERT INTO classe (nome_classe, preco_classe) VALUES ('Catálogo', 6.50);

-- E se executar esse depois?
INSERT INTO classe VALUES (1, 'Lançamento', 7.50);



/*
Tabela com FK
FOREIGN KEY (codigo_categoria) REFERENCES categoria(codigo)
FOREIGN KEY (codigo_classe) REFERENCES classe(codigo)
*/
INSERT INTO titulo (nome_titulo, ano, codigo_categoria, codigo_classe) 
VALUES ('Men in Black: International', 2019, 1, 1);

INSERT INTO categoria (nome_categoria) VALUES ('Ação'); 
-- cod_cat = 1 e cod_classe = 1
INSERT INTO titulo (nome_titulo, ano, codigo_categoria, codigo_classe) 
VALUES ('Men in Black: International', 2019, 1, 1);

