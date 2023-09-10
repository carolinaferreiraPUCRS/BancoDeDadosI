CREATE TABLE Caminhao (
 placa CHAR(10) NOT NULL,
 marca_caminhao VARCHAR(15) NOT NULL,
 modelo VARCHAR(15) NOT NULL,
 ano_fabricacao NUMERIC(4) NOT NULL
);

ALTER TABLE Caminhao ADD CONSTRAINT PK_Caminhao PRIMARY KEY (placa);


CREATE TABLE Categoria (
 codigo_categoria NUMERIC(6) NOT NULL,
 descricao_cat VARCHAR(100) NOT NULL
);

ALTER TABLE Categoria ADD CONSTRAINT PK_Categoria PRIMARY KEY (codigo_categoria);


CREATE TABLE Cidade (
 codigo_ibge NUMERIC(6) NOT NULL,
 nome_cidade VARCHAR(30) NOT NULL,
 uf CHAR(2) NOT NULL
);

ALTER TABLE Cidade ADD CONSTRAINT PK_Cidade PRIMARY KEY (codigo_ibge);


CREATE TABLE Cliente (
 codigo_cliente NUMERIC(6) NOT NULL,
 nome_cliente VARCHAR(100) NOT NULL
);

ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (codigo_cliente);


CREATE TABLE Distancia (
 codigo_ibge NUMERIC(6) NOT NULL,
 codigo_ibge_0 NUMERIC(6) NOT NULL,
 distancia_cid NUMERIC(8,2) NOT NULL
);

ALTER TABLE Distancia ADD CONSTRAINT PK_Distancia PRIMARY KEY (codigo_ibge,codigo_ibge_0);


CREATE TABLE Endereco (
 rua VARCHAR(80) NOT NULL,
 numero NUMERIC(4) NOT NULL,
 complemento VARCHAR(20),
 bairro VARCHAR(20) NOT NULL,
 cep NUMERIC(8) NOT NULL,
 codigo_ibge NUMERIC(6) NOT NULL
);


CREATE TABLE Entrega (
 numero_ent NUMERIC(20) NOT NULL,
 data_saida DATE WITH TIME ZONE NOT NULL,
 data_chegada DATE WITH TIME ZONE NOT NULL,
 valor_ent NUMERIC(10,2) NOT NULL,
 codigo_cliente NUMERIC(6) NOT NULL,
 codigo_ibge NUMERIC(6) NOT NULL,
 placa CHAR(10) NOT NULL,
 codigo_ibge_0 NUMERIC(6) NOT NULL
);

ALTER TABLE Entrega ADD CONSTRAINT PK_Entrega PRIMARY KEY (numero_ent);


CREATE TABLE Item (
 codigo_item NUMERIC(20) NOT NULL,
 descricao_item VARCHAR(100),
 peso_item VARCHAR(7),
 dimensao_item VARCHAR(7),
 codigo_categoria NUMERIC(6) NOT NULL
);

ALTER TABLE Item ADD CONSTRAINT PK_Item PRIMARY KEY (codigo_item);


CREATE TABLE ItemEntrega (
 numero_ent NUMERIC(20) NOT NULL,
 codigo_item NUMERIC(20) NOT NULL,
 valorDeclarado NUMERIC(10,2)
);

ALTER TABLE ItemEntrega ADD CONSTRAINT PK_ItemEntrega PRIMARY KEY (numero_ent,codigo_item);


CREATE TABLE Motorista (
 numero_cnh NUMERIC(11) NOT NULL,
 nome_motorista VARCHAR(100) NOT NULL,
 data_contratacao DATE NOT NULL,
 salario_mot NUMERIC(6,2) NOT NULL
);

ALTER TABLE Motorista ADD CONSTRAINT PK_Motorista PRIMARY KEY (numero_cnh);


CREATE TABLE MotoristaEntrega (
 numero_ent NUMERIC(20) NOT NULL,
 numero_cnh NUMERIC(11) NOT NULL
);

ALTER TABLE MotoristaEntrega ADD CONSTRAINT PK_MotoristaEntrega PRIMARY KEY (numero_ent,numero_cnh);


CREATE TABLE PessoaFisica (
 codigo_cliente NUMERIC(6) NOT NULL,
 rg CHAR(10) NOT NULL,
 cpf CHAR(11) NOT NULL,
 orgaoEmissorRg CHAR(6) NOT NULL
);

ALTER TABLE PessoaFisica ADD CONSTRAINT PK_PessoaFisica PRIMARY KEY (codigo_cliente);


CREATE TABLE PessoaJuridica (
 codigo_cliente NUMERIC(6) NOT NULL,
 cnpj CHAR(14) NOT NULL,
 inscricao_estadual CHAR(9) NOT NULL,
 ufInscricaoEstadual CHAR(10) NOT NULL
);

ALTER TABLE PessoaJuridica ADD CONSTRAINT PK_PessoaJuridica PRIMARY KEY (codigo_cliente);


CREATE TABLE Seguradora (
 numero_susep NUMERIC(10) NOT NULL,
 nome_seg VARCHAR(30) NOT NULL
);

ALTER TABLE Seguradora ADD CONSTRAINT PK_Seguradora PRIMARY KEY (numero_susep);


CREATE TABLE Telefone  (
 ddd NUMERIC(2) NOT NULL,
 tel_numero NUMERIC(9) NOT NULL,
 tel_descricao VARCHAR(10),
 codigo_cliente NUMERIC(6) NOT NULL
);


CREATE TABLE Trecho (
 id_trecho NUMERIC(10) NOT NULL,
 duracao_trecho NUMERIC(4) NOT NULL,
 distancia_trecho NUMERIC(8,2) NOT NULL
);

ALTER TABLE Trecho ADD CONSTRAINT PK_Trecho PRIMARY KEY (id_trecho);


CREATE TABLE Compoe (
 numero_ent NUMERIC(20) NOT NULL,
 id_trecho NUMERIC(10) NOT NULL,
 valor_extra NUMERIC(10,2)
);

ALTER TABLE Compoe ADD CONSTRAINT PK_Compoe PRIMARY KEY (numero_ent,id_trecho);


CREATE TABLE AparelhoPedagio (
 id_aparelho NUMERIC(6) NOT NULL,
 placa CHAR(10) NOT NULL,
 marca_aparelho VARCHAR(15) NOT NULL,
 valor_aparelho NUMERIC(5,2) NOT NULL
);

ALTER TABLE AparelhoPedagio ADD CONSTRAINT PK_AparelhoPedagio PRIMARY KEY (id_aparelho,placa);


CREATE TABLE Apolice (
 numero_seq NUMERIC(6) NOT NULL,
 numero_susep NUMERIC(10) NOT NULL,
 valorPremio NUMERIC(10,2) NOT NULL,
 valorFranquia NUMERIC(10,2) NOT NULL,
 numero_ent NUMERIC(20) NOT NULL,
 codigo_cliente NUMERIC(6)
);

ALTER TABLE Apolice ADD CONSTRAINT PK_Apolice PRIMARY KEY (numero_seq,numero_susep);


ALTER TABLE Distancia ADD CONSTRAINT FK_Distancia_0 FOREIGN KEY (codigo_ibge) REFERENCES Cidade (codigo_ibge);
ALTER TABLE Distancia ADD CONSTRAINT FK_Distancia_1 FOREIGN KEY (codigo_ibge_0) REFERENCES Cidade (codigo_ibge);


ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_0 FOREIGN KEY (codigo_ibge) REFERENCES Cidade (codigo_ibge);


ALTER TABLE Entrega ADD CONSTRAINT FK_Entrega_0 FOREIGN KEY (codigo_cliente) REFERENCES Cliente (codigo_cliente);
ALTER TABLE Entrega ADD CONSTRAINT FK_Entrega_1 FOREIGN KEY (codigo_ibge) REFERENCES Cidade (codigo_ibge);
ALTER TABLE Entrega ADD CONSTRAINT FK_Entrega_2 FOREIGN KEY (placa) REFERENCES Caminhao (placa);
ALTER TABLE Entrega ADD CONSTRAINT FK_Entrega_3 FOREIGN KEY (codigo_ibge_0) REFERENCES Cidade (codigo_ibge);


ALTER TABLE Item ADD CONSTRAINT FK_Item_0 FOREIGN KEY (codigo_categoria) REFERENCES Categoria (codigo_categoria);


ALTER TABLE ItemEntrega ADD CONSTRAINT FK_ItemEntrega_0 FOREIGN KEY (numero_ent) REFERENCES Entrega (numero_ent);
ALTER TABLE ItemEntrega ADD CONSTRAINT FK_ItemEntrega_1 FOREIGN KEY (codigo_item) REFERENCES Item (codigo_item);


ALTER TABLE MotoristaEntrega ADD CONSTRAINT FK_MotoristaEntrega_0 FOREIGN KEY (numero_ent) REFERENCES Entrega (numero_ent);
ALTER TABLE MotoristaEntrega ADD CONSTRAINT FK_MotoristaEntrega_1 FOREIGN KEY (numero_cnh) REFERENCES Motorista (numero_cnh);


ALTER TABLE PessoaFisica ADD CONSTRAINT FK_PessoaFisica_0 FOREIGN KEY (codigo_cliente) REFERENCES Cliente (codigo_cliente);


ALTER TABLE PessoaJuridica ADD CONSTRAINT FK_PessoaJuridica_0 FOREIGN KEY (codigo_cliente) REFERENCES Cliente (codigo_cliente);


ALTER TABLE Telefone  ADD CONSTRAINT FK_Telefone _0 FOREIGN KEY (codigo_cliente) REFERENCES Cliente (codigo_cliente);


ALTER TABLE Compoe ADD CONSTRAINT FK_Compoe_0 FOREIGN KEY (numero_ent) REFERENCES Entrega (numero_ent);
ALTER TABLE Compoe ADD CONSTRAINT FK_Compoe_1 FOREIGN KEY (id_trecho) REFERENCES Trecho (id_trecho);


ALTER TABLE AparelhoPedagio ADD CONSTRAINT FK_AparelhoPedagio_0 FOREIGN KEY (placa) REFERENCES Caminhao (placa);


ALTER TABLE Apolice ADD CONSTRAINT FK_Apolice_0 FOREIGN KEY (numero_susep) REFERENCES Seguradora (numero_susep);
ALTER TABLE Apolice ADD CONSTRAINT FK_Apolice_1 FOREIGN KEY (numero_ent) REFERENCES Entrega (numero_ent);
ALTER TABLE Apolice ADD CONSTRAINT FK_Apolice_2 FOREIGN KEY (codigo_cliente) REFERENCES PessoaJuridica (codigo_cliente);


