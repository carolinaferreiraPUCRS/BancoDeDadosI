CREATE TABLE caminhoes (
 placa CHAR(10) NOT NULL,
 marca_caminhao VARCHAR(15) NOT NULL,
 modelo VARCHAR(15) NOT NULL,
 ano_fabricacao NUMERIC(4) NOT NULL,
 CONSTRAINT PK_caminhoes PRIMARY KEY (placa)
);

INSERT INTO caminhoes(placa,marca_caminhao,modelo,ano_fabricacao)
VALUES('CBG-111','Iveco','Tector','2015');

INSERT INTO caminhoes(placa,marca_caminhao,modelo,ano_fabricacao)
VALUES('CYN-222','Hyundai','Prava','2010');

INSERT INTO caminhoes(placa,marca_caminhao,modelo,ano_fabricacao)
VALUES('ABC-123','Hyundai','Prava','2009');

INSERT INTO caminhoes(placa,marca_caminhao,modelo,ano_fabricacao)
VALUES('DFG-567','Iveco','Tector','2017');

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

CREATE TABLE cidades (
 codigo_ibge NUMERIC(6) NOT NULL,
 nome_cidade VARCHAR(30) NOT NULL,
 uf CHAR(2) NOT NULL,
 CONSTRAINT PK_cidades PRIMARY KEY (codigo_ibge)
);

INSERT INTO cidades(codigo_ibge,nome_cidade,uf)
VALUES(112233,'Bom Repouso','MA');

INSERT INTO cidades(codigo_ibge,nome_cidade,uf)
VALUES(445566,'Paraty','RJ');


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

CREATE TABLE distancias (
 codigo_ibge NUMERIC(6) NOT NULL,
 codigo_ibge_0 NUMERIC(6),
 distancia_cid NUMERIC(8,2) NOT NULL,
 CONSTRAINT PK_distancias PRIMARY KEY (codigo_ibge,codigo_ibge_0)
);

INSERT INTO distancias(codigo_ibge,distancia_cid)
VALUES(112233,200);

INSERT INTO distancias(codigo_ibge,distancia_cid)
VALUES(445566,3000);

CREATE TABLE enderecos (
 rua VARCHAR(80) NOT NULL,
 numero NUMERIC(4) NOT NULL,
 complemento VARCHAR(20),
 bairro VARCHAR(20) NOT NULL,
 cep NUMERIC(8) NOT NULL,
 codigo_ibge NUMERIC(6) NOT NULL
);

INSERT INTO enderecos(rua,numero,complemento,bairro,cep,codigo_ibge)
VALUES('Sao Pedro',40,'Casa','Centro',98765432,112233);

INSERT INTO enderecos(rua,numero,bairro,cep,codigo_ibge)
VALUES('Barao',156,'Beira Mar',11112222,445566);

CREATE TABLE entregas (
 numero_ent NUMERIC(20) NOT NULL,
 data_saida DATE NOT NULL,
 data_chegada DATE NOT NULL,
 valor_ent NUMERIC(10,2) NOT NULL,
 codigo_cliente NUMERIC(6) NOT NULL,
 codigo_ibge NUMERIC(6) NOT NULL,
 placa CHAR(10) NOT NULL,
 CONSTRAINT PK_entregas PRIMARY KEY (numero_ent)
);

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa)
VALUES(123,to_date('20/11/2022','dd/mm/yyyy'),to_date('21/11/2022','dd/mm/yyyy'),70,2121,445566,'CYN-222');

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa)
VALUES(124,to_date('15/10/2022','dd/mm/yyyy'),to_date('25/11/2022','dd/mm/yyyy'),5000,3232,112233,'CBG-111');

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa)
VALUES(125,to_date('31/10/2022','dd/mm/yyyy'),to_date('04/11/2022','dd/mm/yyyy'),8000,1111,112233,'ABC-123');

INSERT INTO entregas(numero_ent,data_saida,data_chegada,valor_ent,codigo_cliente,codigo_ibge,placa)
VALUES(126,to_date('20/11/2022','dd/mm/yyyy'),to_date('29/11/2022','dd/mm/yyyy'),4000,2222,112233,'DFG-567');

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
VALUES(66778899001,'Sergio Souza',,to_date('13/05/2015','dd/mm/yyyy'),2000);

CREATE TABLE motoristas_entregas (
 numero_ent NUMERIC(20) NOT NULL,
 numero_cnh NUMERIC(11) NOT NULL,
 CONSTRAINT PK_motoristas_entregas PRIMARY KEY (numero_ent,numero_cnh)
);

INSERT INTO motoristas_entregas(numero_ent,numero_cnh)
VALUES(123,11223344556);

INSERT INTO motoristas_entregas(numero_ent,numero_cnh)
VALUES(124,66778899001);


CREATE TABLE pessoas_fisicas (
 codigo_cliente NUMERIC(6) NOT NULL,
 rg CHAR(20) NOT NULL,
 cpf CHAR(20) NOT NULL,
 orgaoEmissorRg CHAR(6) NOT NULL,
 CONSTRAINT PK_pessoas_fisicas PRIMARY KEY (codigo_cliente)
);

INSERT INTO pessoas_fisicas(codigo_cliente,rg,cpf,orgaoEmissorRg)
VALUES(2121,'6110896545','048.000.678-09','SSP/SP');

INSERT INTO pessoas_fisicas(codigo_cliente,rg,cpf,orgaoEmissorRg)
VALUES(3232,'3458769021','234.768.907-56','SSP/MG');

CREATE TABLE pessoas_juridicas (
 codigo_cliente NUMERIC(6) NOT NULL,
 cnpj CHAR(14) NOT NULL,
 inscricao_estadual CHAR(9) NOT NULL,
 ufInscricaoEstadual CHAR(10) NOT NULL,
 CONSTRAINT PK_pessoas_juridicas PRIMARY KEY (codigo_cliente)
);

INSERT INTO pessoas_juridicas(codigo_cliente,cnpj,inscricao_estadual,ufInscricaoEstadual)
VALUES(1111,'11122233344456','388.108.598.269','SP');

INSERT INTO pessoas_juridicas(codigo_cliente,cnpj,inscricao_estadual,ufInscricaoEstadual)
VALUES(2222,'22335566778890','508.178.669.260','RS');

CREATE TABLE seguradoras (
 numero_susep NUMERIC(30) NOT NULL,
 nome_seg VARCHAR(30) NOT NULL,
 CONSTRAINT PK_seguradoras PRIMARY KEY (numero_susep)
);

INSERT INTO seguradoras(numero_susep,nome_seg)
VALUES(0306920209907750369000,'Seguro Fácil');

INSERT INTO seguradoras(numero_susep,nome_seg)
VALUES(56398202288455678965333,'SeqAqui');

CREATE TABLE telefones (
 ddd NUMERIC(2) NOT NULL,
 tel_numero NUMERIC(9) NOT NULL,
 tel_descricao VARCHAR(10),
 codigo_cliente NUMERIC(6) NOT NULL
);

INSERT INTO telefones(ddd,tel_numero,tel_descricao,codigo_cliente)
VALUES(68,997584243,'Numero Residencia',3232);

INSERT INTO telefones(ddd,tel_numero,codigo_cliente)
VALUES(24,999765530,2121);

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

CREATE TABLE apolices (
 numero_seq NUMERIC(6) NOT NULL,
 numero_susep NUMERIC(10) NOT NULL,
 valorPremio NUMERIC(10,2) NOT NULL,
 valorFranquia NUMERIC(10,2) NOT NULL,
 numero_ent NUMERIC(20) NOT NULL,
 codigo_cliente NUMERIC(6),
 CONSTRAINT PK_apolices PRIMARY KEY (numero_seq,numero_susep)
);

INSERT INTO apolices(numero_seq,numero_susep,valorPremio,valorFranquia,numero_ent,codigo_cliente)
VALUES(1234,0306920209907750369000,560,7000,125,1111);

INSERT INTO apolices(numero_seq,numero_susep,valorPremio,valorFranquia,numero_ent,codigo_cliente)
VALUES(3456,56398202288455678965333,440,6900,126,2222);

ALTER TABLE distancias ADD CONSTRAINT FK_distancias_0 FOREIGN KEY (codigo_ibge) REFERENCES cidades (codigo_ibge);
ALTER TABLE distancias ADD CONSTRAINT FK_distancias_1 FOREIGN KEY (codigo_ibge_0) REFERENCES cidades (codigo_ibge);


ALTER TABLE enderecos ADD CONSTRAINT FK_enderecos_0 FOREIGN KEY (codigo_ibge) REFERENCES cidades (codigo_ibge);


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


