CREATE TABLE Aluno (
 id_aluno NUMERIC(6) NOT NULL,
 cpf_aluno NUMERIC(11) NOT NULL,
 nome_aluno VARCHAR(100) NOT NULL,
 data_nascimento DATE NOT NULL,
 sexo CHAR(1) NOT NULL
);

ALTER TABLE Aluno ADD CONSTRAINT PK_Aluno PRIMARY KEY (id_aluno);


CREATE TABLE Aparelho (
 id_aparelho NUMERIC(3) NOT NULL,
 nome_aparelho VARCHAR(100) NOT NULL,
 descricao_localidade VARCHAR(500) NOT NULL,
 foto INT
);

ALTER TABLE Aparelho ADD CONSTRAINT PK_Aparelho PRIMARY KEY (id_aparelho);


CREATE TABLE Professor (
 id_professor NUMERIC(4) NOT NULL,
 nome_prof VARCHAR(100) NOT NULL
);

ALTER TABLE Professor ADD CONSTRAINT PK_Professor PRIMARY KEY (id_professor);


CREATE TABLE Treino (
 id_treino NUMERIC(8) NOT NULL,
 data_inicio DATE NOT NULL,
 data_termino DATE NOT NULL,
 id_aluno NUMERIC(6) NOT NULL,
 id_professor NUMERIC(4) NOT NULL
);

ALTER TABLE Treino ADD CONSTRAINT PK_Treino PRIMARY KEY (id_treino);


CREATE TABLE Avaliacao (
 id_avaliacao NUMERIC(7) NOT NULL,
 imc NUMERIC(3,1) NOT NULL,
 altura NUMERIC(3,2) NOT NULL,
 peso NUMERIC(4,1) NOT NULL,
 perimetro_quadriceps NUMERIC(3),
 perimetro_biceps NUMERIC(3),
 perimetro_cintura NUMERIC(3),
 perimetro_peito NUMERIC(3),
 data DATE NOT NULL,
 id_professor NUMERIC(4) NOT NULL,
 id_aluno NUMERIC(6) NOT NULL
);

ALTER TABLE Avaliacao ADD CONSTRAINT PK_Avaliacao PRIMARY KEY (id_avaliacao);


CREATE TABLE Serie (
 id_serie CHAR(1) NOT NULL,
 id_treino NUMERIC(8) NOT NULL,
 descricao VARCHAR(500) NOT NULL
);

ALTER TABLE Serie ADD CONSTRAINT PK_Serie PRIMARY KEY (id_serie,id_treino);


CREATE TABLE AparelhoSerie (
 id_serie CHAR(1) NOT NULL,
 id_treino NUMERIC(8) NOT NULL,
 id_aparelho NUMERIC(3) NOT NULL,
 carga NUMERIC(3),
 num_repeticoes NUMERIC(2) NOT NULL,
 tempo_descanso NUMERIC(3),
 id_professor NUMERIC(4) NOT NULL
);

ALTER TABLE AparelhoSerie ADD CONSTRAINT PK_AparelhoSerie PRIMARY KEY (id_serie,id_treino,id_aparelho);


ALTER TABLE Treino ADD CONSTRAINT FK_Treino_0 FOREIGN KEY (id_aluno) REFERENCES Aluno (id_aluno);
ALTER TABLE Treino ADD CONSTRAINT FK_Treino_1 FOREIGN KEY (id_professor) REFERENCES Professor (id_professor);


ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_0 FOREIGN KEY (id_professor) REFERENCES Professor (id_professor);
ALTER TABLE Avaliacao ADD CONSTRAINT FK_Avaliacao_1 FOREIGN KEY (id_aluno) REFERENCES Aluno (id_aluno);


ALTER TABLE Serie ADD CONSTRAINT FK_Serie_0 FOREIGN KEY (id_treino) REFERENCES Treino (id_treino);


ALTER TABLE AparelhoSerie ADD CONSTRAINT FK_AparelhoSerie_0 FOREIGN KEY (id_serie,id_treino) REFERENCES Serie (id_serie,id_treino);
ALTER TABLE AparelhoSerie ADD CONSTRAINT FK_AparelhoSerie_1 FOREIGN KEY (id_aparelho) REFERENCES Aparelho (id_aparelho);
ALTER TABLE AparelhoSerie ADD CONSTRAINT FK_AparelhoSerie_2 FOREIGN KEY (id_professor) REFERENCES Professor (id_professor);


