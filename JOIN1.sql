create database VendasJoin;

use VendasJoin;

create table clientes(
codigo integer unsigned auto_increment not null,
nome varchar(80) not null,
endereco varchar(45) not null,
cidade varchar(45) not null,
email varchar(100) not null,
idade integer not null,
primary key (codigo)
)engine=innodb;

create table vendas(
codigo integer unsigned auto_increment not null,
data_entrega date not null,
data_venda date not null,
valor double(9,2) not null,
email varchar(100) not null,
clientes_codigo integer not null,
usuarios_codigo integer not null,
foreign key (clientes_vendas) references clientes (vendas),
foreign key (usuarios_codigo) references usuarios (codigo),
primary key (codigo)
)engine=innodb;

create table usuarios(
codigo integer unsigned auto_increment not null,
nome varchar(70) not null,
login char(15) not null,
senha char(6) not null,
primary key (codigo)
)engine=innodb;

create table produtos(
codigo integer unsigned auto_increment not null,
descricao varchar(100) not null,
valor double(9,2) not null,
unidade varchar(20) not null,
quantidade integer not null,
primary key (codigo)
)engine=innodb;

create table itens_venda(
codigo integer unsigned auto_increment not null,
quantidade integer not null,
valor_unitario double(9,2) not null,
vendas_numero integer not null,
produtos_codigo integer not null,
foreign key (vendas_numero) references vendas (numero),
foreign key (produtos_codigo) references produtos (codigo),
primary key (codigo)
)engine=innodb;

create table boletas(
codigo integer unsigned auto_increment not null,
descricao varchar(80) not null,
juros double(9,2) not null,
multa double(9,2) not null,
valor double(9,2) not null,
data date not null,
data_vencimento date not null,
vendas_numero integer not null,
foreign key (vendas_numero) references vendas (numero),
primary key (codigo)
)engine=innodb;


-- 2) Inserir 2 registros em cada tabela
INSERT INTO clientes (CODIGO,NOME,ENDERECO,CIDADE,EMAIL,IDADE)
VALUES(NULL, 'HUGAO' , 'RUA JOSELANDIA' , 'BELO HORIZONTE' , 'HUGAO@SABARA.COM.BR' , '17');
INSERT INTO clientes (CODIGO,NOME,ENDERECO,CIDADE,EMAIL,IDADE)
VALUES(NULL, 'DIOGO' , 'RUA MATERLANDIA' , 'BELO HORIZONTE' , 'DIOGO@SABARA.COM.BR' , '17');

INSERT INTO VENDAS (CODIGO,DATA_ENTREGA,DATA_VENDA,VALOR,CLINTES_CODIGO,USUARIO_CODIGO)
VALUES(NULL, '22/08/2004' , '20/08/2003' , '500' , 'JOAO LUCAS PEREIRA' , 'JOAO');
INSERT INTO VENDAS (CODIGO,DATA_ENTREGA,DATA_VENDA,VALOR,CLINTES_CODIGO,USUARIO_CODIGO)
VALUES(NULL, '25/08/2008' , '22/08/2003' , '600' , 'PEDRO JOSE ARAUJO' , 'PEDRO');

INSERT INTO USUARIOS (CODIGO,NOME,LOGIN,SENHA)
VALUES(NULL, 'HUGAO' , 'HUGAO.CAYRES' , '1235');
INSERT INTO USUARIOS (CODIGO,NOME,LOGIN,SENHA)
VALUES(NULL, 'DIOGO' , 'DIOGO.CHAVES' , '1235');

INSERT INTO PRODUTOS (CODIGO,DESCRICAO,VALOR,UNIDADE,QUANTIDADE)
VALUES(NULL, 'PRODUTO DELICADO,CUIDADO' , '369' , '1' , '4');
INSERT INTO PRODUTOS (CODIGO,DESCRICAO,VALOR,UNIDADE,QUANTIDADE)
VALUES(NULL, 'PRODUTO QUIMICO,CUIDADO' , '700' , '1' , '5');

INSERT INTO ITENS_VENDA (CODIGO,QUANTIDADE,VALOR_UNITARIO,VENDAS_NUMNERO,PRODUTOS_CODIGO)
VALUES(NULL, '5' , '569' , '6' , 'MASCOTE DO AMERICA');
INSERT INTO ITENS_VENDA (CODIGO,QUANTIDADE,VALOR_UNITARIO,VENDAS_NUMNERO,PRODUTOS_CODIGO)
VALUES(NULL, '3' , '40' , '8' , 'MASCOTE DO SAO BENTO');

INSERT INTO BOLETAS (CODIGO,DESCRICAO,JUROS,MULTA,VALOR,DATA,DATA_VENCIMENTO,VENDAS_NUMERO)
VALUES(NULL, 'INFRACAO NA LEI DE TRANSITO' , '10' , 'ESTAVA DIRIGINDO COM ROUPAS' , '9000' , '22/08/2020' , '25/08/2020' , '40');
INSERT INTO BOLETAS (CODIGO,DESCRICAO,JUROS,MULTA,VALOR,DATA,DATA_VENCIMENTO,VENDAS_NUMERO)
VALUES(NULL, 'INFRACAO NA LEI DE TRANSITO' , '10' , 'ESTAVA DIRIGINDO COM MULHER NO CARRO' , '80000' , '29/08/2020' , '10/09/2020' , '43');

-- 3) Selecionar nome, endereço, cidade dos clientes e valor das vendas.
select CLIENTES.NOME, CLIENTES.ENDERECO, CLIENTES.CIDADE, VENDAS.VALOR
from CLIENTES join vendas
on CLIENTES.CODIGO = VENDAS.CLIENTES_CODIGO;

-- 4) Selecionar nome, login dos usuários e valor e data da venda que foram realizadas.
SELECT USUARIOS.NOME, USUARIOS.LOGIN, USUARIOS.VALOR, USUARIOS.VALOR_DATA
FROM USUARIOS JOIN VENDAS
ON USUARIOS.CODIGO = VENDAS.USUARIOS_CODIGO;

-- 5) Selecionar descrição, valor, data das boletas geradas pelas vendas.
SELECT BOLETAS.DESCRICAO, BOLETAS.VALOR, BOLETAS.DATA
FROM BOLETAS JOIN VENDAS
ON BOLETAS.VENDAS_NUMERO = VENDAS.NUMERO;

-- 6) Selecionar descrição, valor dos produtos que participaram dos itens de vendas.
SELECT PRODUTOS.DESCRICAO, PRODUTOS.VALOR
FROM PODUTOS JOIN ITENS_VENDAS
ON PRODUTOS.CODIGO = INTES_VENDAS.PRODUTOS_CODIGO;

-- 7) Selecionar nome, endereço dos clientes e valor das vendas que foram realizadas entre as datas 01/01/2021 a 20/05/2021.
SELECT (NOME , ENDERECO, VALOR_VENDAS) FROM CLIENTES  WHERE DATA = "01/01/2021 a 20/05/2021.";
-- 8) Selecionar o nome e login dos usuários que participaram das vendas até a data de 20/03/2021
SELECT USUARIOS.NOME, USUARIOS.LOGIN
FROM USUARIOS JOIN VENDAS
ON USUARIOS.CODIGO = VENDAS.USUARIOS_CODIGO
WHERE VENDAS.DATA_VENDA <= '2021/03/20';
-- 9) Qual o nome do usuário que fez a venda de maior valor.
SELECT USUARIOS.NOME, MAX(VENDAS.VALOR)
FROM USUARIOS JOIN VENDAS
ON USUARIOS.CODIGO = VENDAS.USUARIOS.CODIGO

-- 10) Qual o nome, endereço, cidade do cliente que fez a menor venda com data até 20/04/2021.
-- 'LUCAS' , 'RUA JOSELANDIA' , 'BELO HORIZONTE'

-- 11) Qual a descrição e valor dos produtos que foram vendidos.
-- PRODUTO DELICADO,CUIDADO. PRODUTO QUIMICO,CUIDADO

-- 12) Qual a soma de todas as vendas realizadas para os clientes que moram em SP.
-- 700 + 369 = 1069

-- 13)  Quantas vendas foram realizadas com valores entre 100 a 500 reais para os clientes que moram em BH.
-- 14 VENDAS

-- 14) Qual o nome do cliente e maior valor de venda para os clientes que moram em RJ.
-- LUCAS

-- 15) Qual o nome e somatório das vendas agrupadas por clientes realizados nas datas de 10/01/2021 até 10/05/2021
-- 'MASCOTE DO AMERICA 18 VENDAS

-- 16) Qual a média de valor de vendas para os clientes que moram na cidade de BH e foram feitas até dia 30/05/2021
-- 50 E A MEDIA DE VENDAS

-- 17) Quantos usuários participaram das vendas do mês de Abril de 2020
-- 25

-- 18)Qual nome do usuário que vendeu para o cliente de código igual a 3.
-- LUCAS

-- 19) Qual a média de valor de venda dos clientes com código entre 3 e 6
-- MEDIA E DE 4 VENDAS

-- 20) Quantas vendas foram feitas para o cliente André no mês de fevereiro de 2021
-- 330 VENDAS FEITA PARA ANDRÉ