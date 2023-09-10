CREATE TABLE Caminhao (
 placa INT NOT NULL,
 marca INT,
 modelo INT,
 ano_fabricacao INT
);

ALTER TABLE Caminhao ADD CONSTRAINT PK_Caminhao PRIMARY KEY (placa);


CREATE TABLE Categoria (
 codigo_categoria INT NOT NULL,
 descricao_fixa INT
);

ALTER TABLE Categoria ADD CONSTRAINT PK_Categoria PRIMARY KEY (codigo_categoria);


CREATE TABLE Cidade (
 codigo_ibge INT NOT NULL,
 nome INT,
 uf INT
);

ALTER TABLE Cidade ADD CONSTRAINT PK_Cidade PRIMARY KEY (codigo_ibge);


CREATE TABLE Cliente (
 codigo_cliente INT NOT NULL,
 nome INT
);

ALTER TABLE Cliente ADD CONSTRAINT PK_Cliente PRIMARY KEY (codigo_cliente);


CREATE TABLE Distancia (
 codigo_ibge INT NOT NULL,
 codigo_ibge_0 INT NOT NULL,
 distancia INT
);

ALTER TABLE Distancia ADD CONSTRAINT PK_Distancia PRIMARY KEY (codigo_ibge,codigo_ibge_0);


CREATE TABLE Endereco (
 rua INT,
 numero INT,
 complemento INT,
 bairro INT,
 cep INT,
 codigo_ibge INT NOT NULL
);


CREATE TABLE Entrega (
 numero INT NOT NULL,
 data_saida INT,
 data_chegada INT,
 valor INT,
 codigo_ibge INT NOT NULL,
 placa INT,
 codigo_cliente INT NOT NULL,
 codigo_ibge_0 INT NOT NULL
);

ALTER TABLE Entrega ADD CONSTRAINT PK_Entrega PRIMARY KEY (numero);


CREATE TABLE Item (
 codigo_item INT NOT NULL,
 descricao INT,
 peso INT,
 dimensao INT,
 codigo_categoria INT NOT NULL
);

ALTER TABLE Item ADD CONSTRAINT PK_Item PRIMARY KEY (codigo_item);


CREATE TABLE ItemEntrega (
 numero INT NOT NULL,
 codigo_item INT NOT NULL,
 valorDeclarado INT
);

ALTER TABLE ItemEntrega ADD CONSTRAINT PK_ItemEntrega PRIMARY KEY (numero,codigo_item);


CREATE TABLE Motorista (
 numero_cnh INT NOT NULL,
 nome INT,
 data_contratacao INT,
 salario INT
);

ALTER TABLE Motorista ADD CONSTRAINT PK_Motorista PRIMARY KEY (numero_cnh);


CREATE TABLE MotoristaEntrega (
 numero INT NOT NULL,
 numero_cnh INT NOT NULL
);

ALTER TABLE MotoristaEntrega ADD CONSTRAINT PK_MotoristaEntrega PRIMARY KEY (numero,numero_cnh);


CREATE TABLE PessoaFisica (
 codigo_cliente INT NOT NULL,
 rg INT,
 cpf INT,
 orgaoEmissorRg INT
);

ALTER TABLE PessoaFisica ADD CONSTRAINT PK_PessoaFisica PRIMARY KEY (codigo_cliente);


CREATE TABLE PessoaJuridica (
 codigo_cliente INT NOT NULL,
 cnpj INT,
 inscricao_estadual INT,
 ufInscricaoEstadual INT
);

ALTER TABLE PessoaJuridica ADD CONSTRAINT PK_PessoaJuridica PRIMARY KEY (codigo_cliente);


CREATE TABLE Seguradora (
 numero_susep INT NOT NULL,
 nome INT
);

ALTER TABLE Seguradora ADD CONSTRAINT PK_Seguradora PRIMARY KEY (numero_susep);


CREATE TABLE Telefone  (
 ddd INT,
 numero INT,
 descricao INT,
 codigo_cliente INT NOT NULL
);


CREATE TABLE Apolice (
 numero_seq INT NOT NULL,
 numero_susep INT NOT NULL,
 valorPremio INT,
 valorFranquia INT,
 numero INT NOT NULL,
 codigo_cliente INT NOT NULL
);

ALTER TABLE Apolice ADD CONSTRAINT PK_Apolice PRIMARY KEY (numero_seq,numero_susep);


ALTER TABLE Distancia ADD CONSTRAINT FK_Distancia_0 FOREIGN KEY (codigo_ibge) REFERENCES Cidade (codigo_ibge);
ALTER TABLE Distancia ADD CONSTRAINT FK_Distancia_1 FOREIGN KEY (codigo_ibge_0) REFERENCES Cidade (codigo_ibge);


ALTER TABLE Endereco ADD CONSTRAINT FK_Endereco_0 FOREIGN KEY (codigo_ibge) REFERENCES Cidade (codigo_ibge);


ALTER TABLE Entrega ADD CONSTRAINT FK_Entrega_0 FOREIGN KEY (codigo_ibge) REFERENCES Cidade (codigo_ibge);
ALTER TABLE Entrega ADD CONSTRAINT FK_Entrega_1 FOREIGN KEY (placa) REFERENCES Caminhao (placa);
ALTER TABLE Entrega ADD CONSTRAINT FK_Entrega_2 FOREIGN KEY (codigo_cliente) REFERENCES Cliente (codigo_cliente);
ALTER TABLE Entrega ADD CONSTRAINT FK_Entrega_3 FOREIGN KEY (codigo_ibge_0) REFERENCES Cidade (codigo_ibge);


ALTER TABLE Item ADD CONSTRAINT FK_Item_0 FOREIGN KEY (codigo_categoria) REFERENCES Categoria (codigo_categoria);


ALTER TABLE ItemEntrega ADD CONSTRAINT FK_ItemEntrega_0 FOREIGN KEY (numero) REFERENCES Entrega (numero);
ALTER TABLE ItemEntrega ADD CONSTRAINT FK_ItemEntrega_1 FOREIGN KEY (codigo_item) REFERENCES Item (codigo_item);


ALTER TABLE MotoristaEntrega ADD CONSTRAINT FK_MotoristaEntrega_0 FOREIGN KEY (numero) REFERENCES Entrega (numero);
ALTER TABLE MotoristaEntrega ADD CONSTRAINT FK_MotoristaEntrega_1 FOREIGN KEY (numero_cnh) REFERENCES Motorista (numero_cnh);


ALTER TABLE PessoaFisica ADD CONSTRAINT FK_PessoaFisica_0 FOREIGN KEY (codigo_cliente) REFERENCES Cliente (codigo_cliente);


ALTER TABLE PessoaJuridica ADD CONSTRAINT FK_PessoaJuridica_0 FOREIGN KEY (codigo_cliente) REFERENCES Cliente (codigo_cliente);


ALTER TABLE Telefone  ADD CONSTRAINT FK_Telefone _0 FOREIGN KEY (codigo_cliente) REFERENCES Cliente (codigo_cliente);


ALTER TABLE Apolice ADD CONSTRAINT FK_Apolice_0 FOREIGN KEY (numero_susep) REFERENCES Seguradora (numero_susep);
ALTER TABLE Apolice ADD CONSTRAINT FK_Apolice_1 FOREIGN KEY (numero) REFERENCES Entrega (numero);
ALTER TABLE Apolice ADD CONSTRAINT FK_Apolice_2 FOREIGN KEY (codigo_cliente) REFERENCES PessoaJuridica (codigo_cliente);


