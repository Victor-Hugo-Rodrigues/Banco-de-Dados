CREATE DATABASE ESCOLA;

USE ESCOLA;

CREATE TABLE ALUNO
(
    ID INT PRIMARY KEY IDENTITY(1,1),
    nome VARCHAR(255),
    email VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(15)
);


CREATE TABLE LIVRO
(
    Cod_Livro INT PRIMARY KEY,
    Título VARCHAR(255),
    Autor VARCHAR(255),
    Cod_Sessao INT
);

INSERT INTO LIVRO
    (Cod_Livro, Título, Autor, Cod_Sessao)
VALUES
    (01, 'Modelo Conceitual e Diagramas ER', 'Pressman, Roger S.', 03),
    (02, 'Livro 2: Modelo Relacional e Algebra Relacional', 'Heuser, Carlos Alberto', 01),
    (03, 'Livro 3: Linguagem SQL', 'Beighley, Lynn', 02);


CREATE TABLE SESSAO
(
    Código INT PRIMARY KEY,
    Descricao VARCHAR(255),
    Localizacao VARCHAR(255)
);

INSERT INTO SESSAO
    (Código, Descricao, Localizacao)
VALUES
    (01, 'Sessão1', 'Partilheira1'),
    (02, 'Sessão2', 'Partilheira2'),
    (03, 'Sessão3', 'Partilheira3');


CREATE TABLE LIVRO_EMPRESTIMO
(
    Cod_Livro INT,
    Cod_Emprestimo INT,
    Data_hora DATETIME,
    Aluno_Matricial INT
);


INSERT INTO LIVRO_EMPRESTIMO
    (Cod_Livro, Cod_Emprestimo)
VALUES
    (03, 01),
    (03, 02);


INSERT INTO ALUNO
    (ID, nome, email, Endereço, telefone)
VALUES
    (01, 'João Carlos', 'Jcarlos@gmail.com', 'Rua do Sol', '(11)7825-4495'),
    (02, 'José Vitor', 'Jvitor@gmail.com', 'Rua da Saudade', '(11)7825-6589'),
    (03, 'Paulo André', 'Pandr@gmail.com', 'Rua 13 de maio', '(11)7825-4489');


CREATE TABLE Dados_devolucao
(
    Código INT PRIMARY KEY,
    Data_hora DATETIME
);

INSERT INTO Dados_devolucao
    (Código, Data_hora)
VALUES
    (01, '2022-03-15 00:00:00'),
    (02, '2022-03-18 00:00:00'),
    (03, '2022-03-20 00:00:00');

ALTER TABLE LIVRO_EMPRESTIMO
ADD CONSTRAINT FK_Aluno_LivroEmprestimo FOREIGN KEY (Aluno_Matricial)
REFERENCES ALUNO (ID);


ALTER TABLE LIVRO_EMPRESTIMO
ADD CONSTRAINT FK_Livro_LivroEmprestimo FOREIGN KEY (Cod_Livro)
REFERENCES LIVRO (Cod_Livro);