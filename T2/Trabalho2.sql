CREATE TABLE caminhoes (
 placa CHAR(10) NOT NULL,
 marca_caminhao VARCHAR(15) NOT NULL,
 modelo VARCHAR(15) NOT NULL,
 ano_fabricacao NUMERIC(4) NOT NULL,
 CONSTRAINT PK_caminhoes PRIMARY KEY (placa)
);

INSERT INTO caminhoes(placa,marca_caminhao,modelo,ano_fabricacao)
VALUES('CBG-111','Iveco','Tector',2015);

INSERT INTO caminhoes(placa,marca_caminhao,modelo,ano_fabricacao)
VALUES('CYN-222','Hyundai','Prava',2010);

INSERT INTO caminhoes(placa,marca_caminhao,modelo,ano_fabricacao)
VALUES('ABC-123','Hyundai','Prava',2009);

INSERT INTO caminhoes(placa,marca_caminhao,modelo,ano_fabricacao)
VALUES('DFG-567','Iveco','Tector',2017);

SELECT * FROM caminhoes;

CREATE TABLE categorias (
 codigo_categoria NUMERIC(6) NOT NULL,
 descricao_cat VARCHAR(100) NOT NULL,
 CONSTRAINT PK_categorias PRIMARY KEY (codigo_categoria)
);

INSERT INTO categorias(codigo_categoria,descricao_cat)
VALUES(111,'Eletrodomestico');

INSERT INTO categorias(codigo_categoria,descricao_cat)
VALUES(222,'Estetica');

SELECT * FROM categorias;

CREATE TABLE cidades (
 codigo_ibge NUMERIC(6) NOT NULL,
 nome_cidade VARCHAR(30) NOT NULL,
 uf CHAR(2) NOT NULL,
 CONSTRAINT PK_cidades PRIMARY KEY (codigo_ibge)
);

ALTER TABLE cidades ADD coodigoo_cliente NUMERIC(6);

UPDATE cidades SET coodigoo_cliente=2121 WHERE nome_cidade='Paraty';
UPDATE cidades SET coodigoo_cliente=3232 WHERE nome_cidade='Porto Alegre';
UPDATE cidades SET coodigoo_cliente=1111 WHERE nome_cidade='Caxias do Sul';
UPDATE cidades SET coodigoo_cliente=2222 WHERE nome_cidade='Indaiatuba';

UPDATE cidades SET nome_cidade='Porto Alegre' WHERE nome_cidade='Bom Repouso';
UPDATE cidades SET uf='RS' WHERE uf='MA';

INSERT INTO cidades(codigo_ibge,nome_cidade,uf)
VALUES(112233,'Porto Alegre','RS');

INSERT INTO cidades(codigo_ibge,nome_cidade,uf)
VALUES(445566,'Paraty','RJ');

INSERT INTO cidades(codigo_ibge,nome_cidade,uf)
VALUES(335567,'Caxias do Sul','RS');

INSERT INTO cidades(codigo_ibge,nome_cidade,uf)
VALUES(335568,'Indaiatuba','SP');

SELECT * FROM cidades;

CREATE TABLE clientes (
 codigo_cliente NUMERIC(6) NOT NULL,
 nome_cliente VARCHAR(100) NOT NULL,
 CONSTRAINT PK_clientes PRIMARY KEY (codigo_cliente)
);

INSERT INTO clientes(codigo_cliente,nome_cliente)
VALUES(2121,'Carolina Ferreira');

INSERT INTO clientes(codigo_cliente,nome_cliente)
VALUES(3232,'Andre Goncalves');

INSERT INTO clientes(codigo_cliente,nome_cliente)
VALUES(1111,'Corpo Company');

INSERT INTO clientes(codigo_cliente,nome_cliente)
VALUES(2222,'HOUSING');

SELECT * FROM clientes;

CREATE TABLE distancias (
 codigo_ibge NUMERIC(6) NOT NULL,
 codigo_ibge_0 NUMERIC(6),
 distancia_cid NUMERIC(8,2) NOT NULL,
 CONSTRAINT PK_distancias PRIMARY KEY (codigo_ibge,codigo_ibge_0)
);

INSERT INTO distancias(codigo_ibge,codigo_ibge_0,distancia_cid)
VALUES(112233,112233,200);

INSERT INTO distancias(codigo_ibge,codigo_ibge_0,distancia_cid)
VALUES(445566,445566,3000);

SELECT * FROM distancias;

CREATE TABLE enderecos (
 rua VARCHAR(80) NOT NULL,
 numero NUMERIC(4) NOT NULL,
 complemento VARCHAR(20),
 bairro VARCHAR(20) NOT NULL,
 cep NUMERIC(8) NOT NULL,
 codigo_ibge NUMERIC(6) NOT NULL
);

ALTER TABLE enderecos ADD codigoo_cliente NUMERIC(6);

UPDATE enderecos SET codigoo_cliente=2121 WHERE rua='Sao Pedro';
UPDATE enderecos SET codigoo_cliente=3232 WHERE rua='Barao';
UPDATE enderecos SET codigoo_cliente=1111 WHERE rua='Barco';
UPDATE enderecos SET codigoo_cliente=2222 WHERE rua='Meia';


INSERT INTO enderecos(rua,numero,complemento,bairro,cep,codigo_ibge)
VALUES('Sao Pedro',40,'Casa','Centro',98765432,112233);

INSERT INTO enderecos(rua,numero,bairro,cep,codigo_ibge)
VALUES('Barao',156,'Beira Mar',11112222,445566);

INSERT INTO enderecos(rua,numero,bairro,cep,codigo_ibge)
VALUES('Barco',168,'Mar',11112225,335567);

INSERT INTO enderecos(rua,numero,bairro,cep,codigo_ibge)
VALUES('Meia',180,'Marco',11112255,335568);

SELECT * FROM enderecos;

CREATE TABLE entregas (
 numero_ent NUMERIC(20) NOT NULL,
 data_saida DATE NOT NULL,
 data_chegada DATE NOT NULL,
 valor_ent NUMERIC(10,2) NOT NULL,
 codigo_cliente NUMERIC(6) NOT NULL,
 codigo_ibge NUMERIC(6) NOT NULL,
 placa CHAR(10) NOT NULL,
 codigo_ibge_0 NUMERIC(6),
 CONSTRAINT PK_entregas PRIMARY KEY (numero_ent)
);
ALTER TABLE entregas ADD numeroo_seq NUMERIC(6);

UPDATE entregas SET numeroo_seq=1234 WHERE numero_ent=125;
UPDATE entregas SET numeroo_seq=1234 WHERE numero_ent=127;
UPDATE entregas SET numeroo_seq=1234 WHERE numero_ent=128;
UPDATE entregas SET numeroo_seq=1234 WHERE numero_ent=129;
UPDATE entregas SET numeroo_seq=1234 WHERE numero_ent=130;
UPDATE entregas SET numeroo_seq=1234 WHERE numero_ent=131;
UPDATE entregas SET numeroo_seq=3456 WHERE numero_ent=126;



UPDATE entregas SET codigo_ibge_0=335568 WHERE numero_ent = 128; 

DELETE FROM entregas WHERE numero_ent=127;

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa,codigo_ibge_0)
VALUES(123,to_date('21/11/2022','dd/mm/yyyy'),to_date('21/11/2022','dd/mm/yyyy'),70,2121,445566,'CYN-222',445566);

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa,codigo_ibge_0)
VALUES(124,to_date('15/10/2022','dd/mm/yyyy'),to_date('25/11/2022','dd/mm/yyyy'),5000,3232,112233,'CBG-111',112233);

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa,codigo_ibge_0)
VALUES(125,to_date('31/10/2022','dd/mm/yyyy'),to_date('04/11/2022','dd/mm/yyyy'),8000,1111,112233,'ABC-123',112233);

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa,codigo_ibge_0)
VALUES(127,to_date('31/10/2022','dd/mm/yyyy'),to_date('04/11/2022','dd/mm/yyyy'),8000,1111,335567,'ABC-123',112233);

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa,codigo_ibge_0)
VALUES(128,to_date('31/10/2022','dd/mm/yyyy'),to_date('04/11/2022','dd/mm/yyyy'),8000,1111,335568,'ABC-123',112233);

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa,codigo_ibge_0)
VALUES(129,to_date('31/10/2022','dd/mm/yyyy'),to_date('04/11/2022','dd/mm/yyyy'),8000,1111,112233,'ABC-123',112233);

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa,codigo_ibge_0)
VALUES(130,to_date('31/10/2022','dd/mm/yyyy'),to_date('04/11/2022','dd/mm/yyyy'),8000,1111,112233,'ABC-123',112233);

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa,codigo_ibge_0)
VALUES(131,to_date('31/10/2022','dd/mm/yyyy'),to_date('04/11/2022','dd/mm/yyyy'),8000,1111,112233,'ABC-123',112233);

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa,codigo_ibge_0)
VALUES(126,to_date('20/11/2022','dd/mm/yyyy'),to_date('29/11/2022','dd/mm/yyyy'),4000,2222,112233,'DFG-567',112233);

SELECT * FROM entregas;

CREATE TABLE itens (
 codigo_item NUMERIC(20) NOT NULL,
 descricao_item VARCHAR(100),
 peso_item VARCHAR(7),
 dimensao_item VARCHAR(7),
 codigo_categoria NUMERIC(6) NOT NULL,
 CONSTRAINT PK_itens PRIMARY KEY (codigo_item)
);

INSERT INTO itens(codigo_item,descricao_item,peso_item,dimensao_item,codigo_categoria)
VALUES(12345,'Geladeira 2 Portas','100kg','30x250',111);

INSERT INTO itens(codigo_item,descricao_item,codigo_categoria)
VALUES(11223,'Sabonete de Rosto',222);

SELECT * FROM itens;

CREATE TABLE itens_entregas (
 numero_ent NUMERIC(20) NOT NULL,
 codigo_item NUMERIC(20) NOT NULL,
 valorDeclarado NUMERIC(10,2),
 CONSTRAINT PK_itens_entregas PRIMARY KEY (numero_ent,codigo_item)
);

INSERT INTO itens_entregas(numero_ent,codigo_item,valorDeclarado)
VALUES(124,12345,4900);

INSERT INTO itens_entregas(numero_ent,codigo_item,valorDeclarado)
VALUES(123,11223,60);

INSERT INTO itens_entregas(numero_ent,codigo_item,valorDeclarado)
VALUES(125,11223,60);

INSERT INTO itens_entregas(numero_ent,codigo_item,valorDeclarado)
VALUES(126,11223,60);

INSERT INTO itens_entregas(numero_ent,codigo_item,valorDeclarado)
VALUES(128,12345,65);

SELECT * FROM itens_entregas;

CREATE TABLE motoristas (
 numero_cnh NUMERIC(11) NOT NULL,
 nome_motorista VARCHAR(100) NOT NULL,
 data_contratacao DATE NOT NULL,
 salario_mot NUMERIC(6,2) NOT NULL,
 CONSTRAINT PK_motoristas PRIMARY KEY (numero_cnh)
);

INSERT INTO motoristas(numero_cnh,nome_motorista,data_contratacao,salario_mot)
VALUES(11223344556,'Diego Bastos',to_date('10/09/2019','dd/mm/yyyy'),2000);

INSERT INTO motoristas(numero_cnh,nome_motorista,data_contratacao,salario_mot)
VALUES(66778899001,'Sergio Souza',to_date('13/05/2015','dd/mm/yyyy'),2000);

SELECT * FROM motoristas;

CREATE TABLE motoristas_entregas (
 numero_ent NUMERIC(20) NOT NULL,
 numero_cnh NUMERIC(11) NOT NULL,
 CONSTRAINT PK_motoristas_entregas PRIMARY KEY (numero_ent,numero_cnh)
);

INSERT INTO motoristas_entregas(numero_ent,numero_cnh)
VALUES(123,11223344556);

INSERT INTO motoristas_entregas(numero_ent,numero_cnh)
VALUES(124,66778899001);

INSERT INTO motoristas_entregas(numero_ent,numero_cnh)
VALUES(125,66778899001);

INSERT INTO motoristas_entregas(numero_ent,numero_cnh)
VALUES(126,66778899001);

INSERT INTO motoristas_entregas(numero_ent,numero_cnh)
VALUES(127,66778899001);

INSERT INTO motoristas_entregas(numero_ent,numero_cnh)
VALUES(128,66778899001);

INSERT INTO motoristas_entregas(numero_ent,numero_cnh)
VALUES(129,66778899001);

INSERT INTO motoristas_entregas(numero_ent,numero_cnh)
VALUES(130,66778899001);

INSERT INTO motoristas_entregas(numero_ent,numero_cnh)
VALUES(131,66778899001);

SELECT * FROM motoristas_entregas;

CREATE TABLE pessoas_fisicas (
 codigo_cliente NUMERIC(6) NOT NULL,
 rg CHAR(20) NOT NULL,
 cpf CHAR(20) NOT NULL,
 orgaoEmissorRg CHAR(6) NOT NULL,
 CONSTRAINT PK_pessoas_fisicas PRIMARY KEY (codigo_cliente)
);

INSERT INTO pessoas_fisicas(codigo_cliente,rg,cpf,orgaoEmissorRg)
VALUES(2121,'6110896545','04800067809','SSP/SP');

INSERT INTO pessoas_fisicas(codigo_cliente,rg,cpf,orgaoEmissorRg)
VALUES(3232,'3458769021','23476890756','SSP/MG');

SELECT * FROM pessoas_fisicas;

CREATE TABLE pessoas_juridicas (
 codigo_cliente NUMERIC(6) NOT NULL,
 cnpj CHAR(14) NOT NULL,
 inscricao_estadual CHAR(9) NOT NULL,
 ufInscricaoEstadual CHAR(10) NOT NULL,
 CONSTRAINT PK_pessoas_juridicas PRIMARY KEY (codigo_cliente)
);

INSERT INTO pessoas_juridicas(codigo_cliente,cnpj,inscricao_estadual,ufInscricaoEstadual)
VALUES(1111,'11122233344456','388108598','SP');

INSERT INTO pessoas_juridicas(codigo_cliente,cnpj,inscricao_estadual,ufInscricaoEstadual)
VALUES(2222,'22335566778890','50.178669','RS');

SELECT * FROM pessoas_juridicas;

CREATE TABLE seguradoras (
 numero_susep NUMERIC(30) NOT NULL,
 nome_seg VARCHAR(30) NOT NULL,
 CONSTRAINT PK_seguradoras PRIMARY KEY (numero_susep)
);

INSERT INTO seguradoras(numero_susep,nome_seg)
VALUES(03069202,'Seguro Fácil');

INSERT INTO seguradoras(numero_susep,nome_seg)
VALUES(56398202,'SeqAqui');

SELECT * FROM seguradoras;

CREATE TABLE telefones (
 ddd NUMERIC(2) NOT NULL,
 tel_numero NUMERIC(9) NOT NULL,
 tel_descricao VARCHAR(10),
 codigo_cliente NUMERIC(6) NOT NULL
);

INSERT INTO telefones(ddd,tel_numero,tel_descricao,codigo_cliente)
VALUES(68,997584243,'Residencia',3232);

INSERT INTO telefones(ddd,tel_numero,codigo_cliente)
VALUES(24,999765530,2121);

SELECT * FROM telefones;

CREATE TABLE trechos (
 id_trecho NUMERIC(10) NOT NULL,
 duracao_trecho CHAR(5) NOT NULL,
 distancia_trecho NUMERIC(8,2) NOT NULL,
 CONSTRAINT PK_trechos PRIMARY KEY (id_trecho)
);

INSERT INTO trechos(id_trecho,duracao_trecho,distancia_trecho)
VALUES(25,'2h',100);
 
INSERT INTO trechos(id_trecho,duracao_trecho,distancia_trecho)
VALUES(49,'1h',30);

SELECT * FROM trechos;

CREATE TABLE trechos_entregas (
 numero_ent NUMERIC(20) NOT NULL,
 id_trecho NUMERIC(10) NOT NULL,
 valor_extra NUMERIC(10,2),
 CONSTRAINT PK_trechos_entregas PRIMARY KEY (numero_ent,id_trecho)
);

INSERT INTO trechos_entregas(numero_ent,id_trecho,valor_extra)
VALUES(123,49,20);

INSERT INTO trechos_entregas(numero_ent,id_trecho)
VALUES(124,25);

INSERT INTO trechos_entregas(numero_ent,id_trecho,valor_extra)
VALUES(125,49,50);

INSERT INTO trechos_entregas(numero_ent,id_trecho,valor_extra)
VALUES(126,25,15);

INSERT INTO trechos_entregas(numero_ent,id_trecho,valor_extra)
VALUES(127,49,30);

INSERT INTO trechos_entregas(numero_ent,id_trecho,valor_extra)
VALUES(128,25,20);

SELECT * FROM trechos_entregas;

CREATE TABLE aparelhos_pedagio (
 id_aparelho NUMERIC(6) NOT NULL,
 placa CHAR(10) NOT NULL,
 marca_aparelho VARCHAR(15) NOT NULL,
 valor_aparelho NUMERIC(5,2) NOT NULL,
 CONSTRAINT PK_aparelhos_pedagio PRIMARY KEY (id_aparelho,placa)
);

INSERT INTO aparelhos_pedagio(id_aparelho,placa,marca_aparelho,valor_aparelho)
VALUES(15,'CYN-222','PagFlash',30);

INSERT INTO aparelhos_pedagio(id_aparelho,placa,marca_aparelho,valor_aparelho)
VALUES(28,'CBG-111','PagFlash',35);

INSERT INTO aparelhos_pedagio(id_aparelho,placa,marca_aparelho,valor_aparelho)
VALUES(29,'ABC-123','PagFlash',32);

INSERT INTO aparelhos_pedagio(id_aparelho,placa,marca_aparelho,valor_aparelho)
VALUES(30,'DFG-567','PagFlash',33);

SELECT * FROM aparelhos_pedagio;

CREATE TABLE apolices (
 numero_seq NUMERIC(6) NOT NULL,
 numero_susep NUMERIC(10) NOT NULL,
 valorPremio NUMERIC(10,2) NOT NULL,
 valorFranquia NUMERIC(10,2) NOT NULL,
 numero_ent NUMERIC(20) NOT NULL,
 codigo_cliente NUMERIC(6),
 CONSTRAINT PK_apolices PRIMARY KEY (numero_seq,numero_susep)
);

UPDATE apolices SET valorPremio=560000 WHERE valorPremio=560;

INSERT INTO apolices(numero_seq,numero_susep,valorPremio,valorFranquia,numero_ent,codigo_cliente)
VALUES(1234,030692020,560,7000,125,1111);

INSERT INTO apolices(numero_seq,numero_susep,valorPremio,valorFranquia,numero_ent,codigo_cliente)
VALUES(3456,56398202,440,6900,126,2222);

SELECT * FROM apolices;

SELECT
    CLT.nome_cliente,
    CID.nome_cidade,
    CID.uf,
    ERT.numero_ent,
    ERT.data_saida,
    ERT.data_chegada
FROM clientes CLT
INNER JOIN pessoas_fisicas CPF
    ON CLT.codigo_cliente = CPF.codigo_cliente
INNER JOIN enderecos EDD
    ON CLT.codigo_cliente = EDD.codigoo_cliente
INNER JOIN cidades CID
    ON CID.codigo_ibge = EDD.codigo_ibge
INNER JOIN entregas ERT
    ON ERT.codigo_cliente = CLT.codigo_cliente
ORDER BY CLT.nome_cliente ASC;

SELECT
    CLT.nome_cliente,
    CID.nome_cidade,
    CID.uf,
    ERT.numero_ent,
    ERT.data_saida,
    ERT.data_chegada
FROM clientes CLT
INNER JOIN pessoas_fisicas CPF
    ON CLT.codigo_cliente = CPF.codigo_cliente
INNER JOIN enderecos EDD
    ON CLT.codigo_cliente = EDD.codigoo_cliente
INNER JOIN cidades CID
    ON CID.codigo_ibge = EDD.codigo_ibge
INNER JOIN entregas ERT
    ON ERT.codigo_cliente = CLT.codigo_cliente
ORDER BY ERT.data_saida DESC;

SELECT
    CLT.nome_cliente,
    ERT.numero_ent,
    ERT.data_saida,
    CAM.placa,
    MOT.nome_motorista,
    CAT.codigo_categoria,
    CAT.descricao_cat
FROM clientes CLT
INNER JOIN entregas ERT
    ON CLT.codigo_cliente = ERT.codigo_cliente
INNER JOIN itens_entregas ITE
    ON ITE.numero_ent = ERT.numero_ent
INNER JOIN motoristas_entregas MTE
    ON MTE.numero_ent = ERT.numero_ent
INNER JOIN motoristas MOT
    ON MOT.numero_cnh = MTE.numero_cnh
INNER JOIN caminhoes CAM
    ON CAM.placa = ERT.placa
INNER JOIN itens IT
    ON IT.codigo_item = ITE.codigo_item
INNER JOIN categorias CAT
    ON CAT.codigo_categoria = IT.codigo_categoria
INNER JOIN enderecos EDC
    ON EDC.codigoo_cliente = CLT.codigo_cliente
INNER JOIN cidades CID
    ON CID.codigo_ibge = EDC.codigo_ibge
INNER JOIN apolices APS
    ON APS.numero_seq = ERT.numeroo_seq
WHERE 
ERT.data_chegada >to_date('01/01/2022','dd/mm/yyyy') 
AND CID.uf ='RS' 
AND APS.valorPremio > 100.000;


SELECT
    CLT.nome_cliente,
    ERT.numero_ent,
    APS.valorFranquia
FROM clientes CLT
INNER JOIN pessoas_juridicas CPJ
    ON CLT.codigo_cliente = CPJ.codigo_cliente
INNER JOIN entregas ERT
    ON ERT.codigo_cliente = CLT.codigo_cliente
INNER JOIN apolices APS
    ON APS.codigo_cliente = CLT.codigo_cliente
INNER JOIN enderecos EDC
    ON EDC.codigoo_cliente = CLT.codigo_cliente
INNER JOIN cidades CID
    ON CID.codigo_ibge = EDC.codigo_ibge
WHERE CID.uf = 'RS' AND ERT.numero_ent > 5;

SELECT
    CLT.nome_cliente,
    CID.nome_cidade,
    CID.uf,
    ERT.numero_ent,
    ERT.data_saida,
    ERT.data_chegada,
    APD.marca_aparelho,
    TCH.valor_extra
FROM clientes CLT
INNER JOIN entregas ERT
    ON ERT.codigo_cliente = CLT.codigo_cliente
INNER JOIN cidades CID
    ON CID.codigo_ibge = ERT.codigo_ibge
INNER JOIN aparelhos_pedagio APD
    ON APD.placa = ERT.placa
INNER JOIN trechos_entregas TCH
    ON TCH.numero_ent = ERT.numero_ent
ORDER BY CLT.nome_cliente ASC;


ALTER TABLE distancias ADD CONSTRAINT FK_distancias_0 FOREIGN KEY (codigo_ibge) REFERENCES cidades (codigo_ibge);
ALTER TABLE distancias ADD CONSTRAINT FK_distancias_1 FOREIGN KEY (codigo_ibge_0) REFERENCES cidades (codigo_ibge);


ALTER TABLE enderecos ADD CONSTRAINT FK_enderecos_0 FOREIGN KEY (codigo_ibge) REFERENCES cidades (codigo_ibge);
ALTER TABLE enderecos ADD CONSTRAINT FK_enderecos_1 FOREIGN KEY (codigoo_cliente) REFERENCES clientes (codigo_cliente);

ALTER TABLE entregas ADD CONSTRAINT FK_entregas_0 FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo_cliente);
ALTER TABLE entregas ADD CONSTRAINT FK_entregas_1 FOREIGN KEY (codigo_ibge) REFERENCES cidades (codigo_ibge);
ALTER TABLE entregas ADD CONSTRAINT FK_entregas_2 FOREIGN KEY (placa) REFERENCES caminhoes (placa);
ALTER TABLE entregas ADD CONSTRAINT FK_entregas_3 FOREIGN KEY (codigo_ibge_0) REFERENCES cidades (codigo_ibge);


ALTER TABLE itens ADD CONSTRAINT FK_itens_0 FOREIGN KEY (codigo_categoria) REFERENCES categorias (codigo_categoria);


ALTER TABLE itens_entregas ADD CONSTRAINT FK_itens_entregas_0 FOREIGN KEY (numero_ent) REFERENCES entregas (numero_ent);
ALTER TABLE itens_entregas ADD CONSTRAINT FK_itens_entregas_1 FOREIGN KEY (codigo_item) REFERENCES itens (codigo_item);


ALTER TABLE motoristas_entregas ADD CONSTRAINT FK_motoristas_entregas_0 FOREIGN KEY (numero_ent) REFERENCES entregas (numero_ent);
ALTER TABLE motoristas_entregas ADD CONSTRAINT FK_motoristas_entregas_1 FOREIGN KEY (numero_cnh) REFERENCES motoristas (numero_cnh);


ALTER TABLE pessoas_fisicas ADD CONSTRAINT FK_pessoas_fisicas_0 FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo_cliente);


ALTER TABLE pessoas_juridicas ADD CONSTRAINT FK_pessoas_juridicas_0 FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo_cliente);


ALTER TABLE telefones ADD CONSTRAINT FK_telefones_0 FOREIGN KEY (codigo_cliente) REFERENCES clientes (codigo_cliente);


ALTER TABLE trechos_entregas ADD CONSTRAINT FK_trechos_entregas_0 FOREIGN KEY (numero_ent) REFERENCES entregas (numero_ent);
ALTER TABLE trechos_entregas ADD CONSTRAINT FK_trechos_entregas_1 FOREIGN KEY (id_trecho) REFERENCES trechos (id_trecho);


ALTER TABLE aparelhos_pedagio ADD CONSTRAINT FK_aparelhos_pedagio_0 FOREIGN KEY (placa) REFERENCES caminhoes (placa);


ALTER TABLE apolices ADD CONSTRAINT FK_apolices_0 FOREIGN KEY (numero_susep) REFERENCES seguradoras (numero_susep);
ALTER TABLE apolices ADD CONSTRAINT FK_apolices_1 FOREIGN KEY (numero_ent) REFERENCES entregas (numero_ent);
ALTER TABLE apolices ADD CONSTRAINT FK_apolices_2 FOREIGN KEY (codigo_cliente) REFERENCES pessoas_juridicas (codigo_cliente);


