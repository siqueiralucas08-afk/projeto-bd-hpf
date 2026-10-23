CREATE TABLE turma_disciplina_professor (
    id_turma SERIAL PRIMARY KEY,
    id_disciplina BIGINT,
    id_professor BIGINT,
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma),
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina),
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

INSERT INTO turma_disciplina_professor (id_disciplina, id_professor) VALUES
(1, 1),
(2, 2),
(3, 3);

CREATE TABLE professor (
    id_professor SERIAL PRIMARY KEY,
    data VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(255),
    id_escola BIGINT NOT NULL,
    FOREIGN KEY (id_escola) REFERENCES escola(id_escola)
);

INSERT INTO professor (data, cpf, data_nascimento, email, id_escola) VALUES
('Ana Souza', '111.111.111-11', '1985-04-12', 'ana@example.com', 1),
('Carlos Lima', '222.222.222-22', '1979-08-23', 'carlos@example.com', 2),
('Mariana Alves', '333.333.333-33', '1990-01-15', 'mariana@example.com', 3);

CREATE TABLE historico_presenca (
    id_professor SERIAL PRIMARY KEY,
    data DATE NOT NULL,
    hora_entrada TIMESTAMP,
    hora_saida TIMESTAMP,
    entrada_aluno TIMESTAMP,
    saida_aluno TIMESTAMP,
    status_presenca VARCHAR(20),
    id_aluno BIGINT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

INSERT INTO historico_presenca (data, hora_entrada, hora_saida, entrada_aluno, saida_aluno, status_presenca, id_aluno) VALUES
('2026-02-02', '2026-02-02 07:00:00', '2026-02-02 12:00:00', '2026-02-02 07:05:00', '2026-02-02 11:55:00', 'Presente', 1),
('2026-02-03', '2026-02-03 07:00:00', '2026-02-03 12:00:00', '2026-02-03 07:10:00', '2026-02-03 11:50:00', 'Presente', 2),
('2026-02-04', '2026-02-04 07:00:00', '2026-02-04 12:00:00', NULL, NULL, 'Ausente', 3);

CREATE TABLE escola (
    id_escola SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18),
    telefone VARCHAR(20)
);

INSERT INTO escola (nome, endereco, cnpj, telefone) VALUES
('Escola Municipal Primavera', 'Rua das Flores, 100', '12.345.678/0001-90', '(45) 3333-1000'),
('Escola Municipal Horizonte', 'Avenida Brasil, 200', '23.456.789/0001-01', '(45) 3333-2000'),
('Escola Municipal Saber', 'Rua das Araucárias, 300', '34.567.890/0001-12', '(45) 3333-3000');

CREATE TABLE aluno_responsavel (
    id_aluno BIGINT,
    id_responsavel BIGINT,
    parentesco VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_responsavel) REFERENCES responsavel(id_responsavel)
);

INSERT INTO aluno_responsavel (id_aluno, id_responsavel, parentesco) VALUES
(1, 1, 'Pai'),
(2, 2, 'Mãe'),
(3, 3, 'Pai');

CREATE TABLE disciplina (
    id_disciplina SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL
);

INSERT INTO disciplina (nome, carga_horaria) VALUES
('Matemática', 160),
('Português', 120),
('Ciências', 80);

CREATE TABLE aluno (
    id_aluno SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    data_nascimento DATE NOT NULL,
    link_foto VARCHAR(255),
    id_turma BIGINT NOT NULL,
    FOREIGN KEY (id_turma) REFERENCES turma(id_turma)
);

INSERT INTO aluno (nome, cpf, data_nascimento, link_foto, id_turma) VALUES
('Pedro Santos', '444.444.444-44', '2018-03-10', 'fotos/pedro.jpg', 1),
('Julia Costa', '555.555.555-55', '2017-07-21', 'fotos/julia.jpg', 2),
('Lucas Oliveira', '666.666.666-66', '2016-11-05', 'fotos/lucas.jpg', 3);

CREATE TABLE turma (
    id_turma SERIAL PRIMARY KEY,
    serie VARCHAR(100) NOT NULL,
    quantidade_aluno INT,
    chamada INT,
    ano_letivo INT NOT NULL,
    id_escola BIGINT NOT NULL
    FOREIGN KEY (id_escola) REFERENCES escola(id_escola)
);

INSERT INTO turma (serie, quantidade_aluno, chamada, ano_letivo, id_escola) VALUES
('1º Ano A', 1, 1, 2026, 1),
('2º Ano A', 1, 1, 2026, 2),
('3º Ano A', 1, 1, 2026, 3);

CREATE TABLE matricula (
    id_matricula SERIAL PRIMARY KEY,
    numero_matricula VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    comprovante_residencia VARCHAR(255),
    data_matricula TIMESTAMP,
    status VARCHAR(50),
    id_aluno BIGINT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

INSERT INTO matricula (numero_matricula, cpf, nome, comprovante_residencia, data_matricula, status, id_aluno) VALUES
('MAT2026001', '444.444.444-44', 'Pedro Santos', 'comprovantes/pedro.pdf', '2026-01-10 09:00:00', 'Ativa', 1),
('MAT2026002', '555.555.555-55', 'Julia Costa', 'comprovantes/julia.pdf', '2026-01-11 10:00:00', 'Ativa', 2),
('MAT2026003', '666.666.666-66', 'Lucas Oliveira', 'comprovantes/lucas.pdf', '2026-01-12 11:00:00', 'Ativa', 3);

CREATE TABLE responsavel (
  id_responsavel SERIAL PRIMARY KEY,
  nome VARCHAR(255) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  telefone VARCHAR (20) NOT NULL,
  email VARCHAR(255)
);

INSERT INTO responsavel (nome, cpf, telefone, email) VALUES
('Paulo Santos', '777.777.777-77', '(45) 99999-1001', 'paulo@example.com'),
('Fernanda Costa', '888.888.888-88', '(45) 99999-1002', 'fernanda@example.com'),
('Norberto Oliveira', '999.999.999-99', '(45) 99999-1003', 'norberto@example.com');

