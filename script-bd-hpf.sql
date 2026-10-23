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

