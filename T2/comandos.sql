CREATE TABLE caminhoes (
 placa CHAR(10) NOT NULL,
 marca_caminhao VARCHAR(15) NOT NULL,
 modelo VARCHAR(15) NOT NULL,
 ano_fabricacao NUMERIC(4) NOT NULL
);

ALTER TABLE caminhoes ADD CONSTRAINT PK_caminhoes PRIMARY KEY (placa);


CREATE TABLE categorias (
 codigo_categoria NUMERIC(6) NOT NULL,
 descricao_cat VARCHAR(100) NOT NULL
);

ALTER TABLE categorias ADD CONSTRAINT PK_categorias PRIMARY KEY (codigo_categoria);


CREATE TABLE cidades (
 codigo_ibge NUMERIC(6) NOT NULL,
 nome_cidade VARCHAR(30) NOT NULL,
 uf CHAR(2) NOT NULL
);

ALTER TABLE cidades ADD CONSTRAINT PK_cidades PRIMARY KEY (codigo_ibge);


CREATE TABLE clientes (
 codigo_cliente NUMERIC(6) NOT NULL,
 nome_cliente VARCHAR(100) NOT NULL
);

ALTER TABLE clientes ADD CONSTRAINT PK_clientes PRIMARY KEY (codigo_cliente);


CREATE TABLE distancias (
 codigo_ibge NUMERIC(6) NOT NULL,
 codigo_ibge_0 NUMERIC(6) NOT NULL,
 distancia_cid NUMERIC(8,2) NOT NULL
);

ALTER TABLE distancias ADD CONSTRAINT PK_distancias PRIMARY KEY (codigo_ibge,codigo_ibge_0);


CREATE TABLE enderecos (
 rua VARCHAR(80) NOT NULL,
 numero NUMERIC(4) NOT NULL,
 complemento VARCHAR(20),
 bairro VARCHAR(20) NOT NULL,
 cep NUMERIC(8) NOT NULL,
 codigo_ibge NUMERIC(6) NOT NULL
);


CREATE TABLE entregas (
 numero_ent NUMERIC(20) NOT NULL,
 data_saida DATE WITH TIME ZONE NOT NULL,
 data_chegada DATE WITH TIME ZONE NOT NULL,
 valor_ent NUMERIC(10,2) NOT NULL,
 codigo_cliente NUMERIC(6) NOT NULL,
 codigo_ibge NUMERIC(6) NOT NULL,
 placa CHAR(10) NOT NULL,
 codigo_ibge_0 NUMERIC(6) NOT NULL
);

ALTER TABLE entregas ADD CONSTRAINT PK_entregas PRIMARY KEY (numero_ent);


CREATE TABLE itens (
 codigo_item NUMERIC(20) NOT NULL,
 descricao_item VARCHAR(100),
 peso_item VARCHAR(7),
 dimensao_item VARCHAR(7),
 codigo_categoria NUMERIC(6) NOT NULL
);

ALTER TABLE itens ADD CONSTRAINT PK_itens PRIMARY KEY (codigo_item);


CREATE TABLE itens_entregas (
 numero_ent NUMERIC(20) NOT NULL,
 codigo_item NUMERIC(20) NOT NULL,
 valorDeclarado NUMERIC(10,2)
);

ALTER TABLE itens_entregas ADD CONSTRAINT PK_itens_entregas PRIMARY KEY (numero_ent,codigo_item);


CREATE TABLE motoristas (
 numero_cnh NUMERIC(11) NOT NULL,
 nome_motorista VARCHAR(100) NOT NULL,
 data_contratacao DATE NOT NULL,
 salario_mot NUMERIC(6,2) NOT NULL
);

ALTER TABLE motoristas ADD CONSTRAINT PK_motoristas PRIMARY KEY (numero_cnh);


CREATE TABLE motoristas_entregas (
 numero_ent NUMERIC(20) NOT NULL,
 numero_cnh NUMERIC(11) NOT NULL
);

ALTER TABLE motoristas_entregas ADD CONSTRAINT PK_motoristas_entregas PRIMARY KEY (numero_ent,numero_cnh);


CREATE TABLE pessoas_fisicas (
 codigo_cliente NUMERIC(6) NOT NULL,
 rg CHAR(20) NOT NULL,
 cpf CHAR(20) NOT NULL,
 orgaoEmissorRg CHAR(6) NOT NULL
);

ALTER TABLE pessoas_fisicas ADD CONSTRAINT PK_pessoas_fisicas PRIMARY KEY (codigo_cliente);


CREATE TABLE pessoas_juridicas (
 codigo_cliente NUMERIC(6) NOT NULL,
 cnpj CHAR(14) NOT NULL,
 inscricao_estadual CHAR(9) NOT NULL,
 ufInscricaoEstadual CHAR(10) NOT NULL
);

ALTER TABLE pessoas_juridicas ADD CONSTRAINT PK_pessoas_juridicas PRIMARY KEY (codigo_cliente);


CREATE TABLE seguradoras (
 numero_susep NUMERIC(30) NOT NULL,
 nome_seg VARCHAR(30) NOT NULL
);

ALTER TABLE seguradoras ADD CONSTRAINT PK_seguradoras PRIMARY KEY (numero_susep);


CREATE TABLE telefones (
 ddd NUMERIC(2) NOT NULL,
 tel_numero NUMERIC(9) NOT NULL,
 tel_descricao VARCHAR(10),
 codigo_cliente NUMERIC(6) NOT NULL
);


CREATE TABLE trechos (
 id_trecho NUMERIC(10) NOT NULL,
 duracao_trecho CHAR(5) NOT NULL,
 distancia_trecho NUMERIC(8,2) NOT NULL
);

ALTER TABLE trechos ADD CONSTRAINT PK_trechos PRIMARY KEY (id_trecho);


CREATE TABLE trechos_entregas (
 numero_ent NUMERIC(20) NOT NULL,
 id_trecho NUMERIC(10) NOT NULL,
 valor_extra NUMERIC(10,2)
);

ALTER TABLE trechos_entregas ADD CONSTRAINT PK_trechos_entregas PRIMARY KEY (numero_ent,id_trecho);


CREATE TABLE aparelhos_pedagio (
 id_aparelho NUMERIC(6) NOT NULL,
 placa CHAR(10) NOT NULL,
 marca_aparelho VARCHAR(15) NOT NULL,
 valor_aparelho NUMERIC(5,2) NOT NULL
);

ALTER TABLE aparelhos_pedagio ADD CONSTRAINT PK_aparelhos_pedagio PRIMARY KEY (id_aparelho,placa);


CREATE TABLE apolices (
 numero_seq NUMERIC(6) NOT NULL,
 numero_susep NUMERIC(30) NOT NULL,
 valorPremio NUMERIC(10,2) NOT NULL,
 valorFranquia NUMERIC(10,2) NOT NULL,
 numero_ent NUMERIC(20) NOT NULL,
 codigo_cliente NUMERIC(6)
);

ALTER TABLE apolices ADD CONSTRAINT PK_apolices PRIMARY KEY (numero_seq,numero_susep);


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


