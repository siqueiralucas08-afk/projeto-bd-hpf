CREATE TABLE professor(
  id_professor SERIAL PRIMARY KEY,
  idade date,
  quantidade_professor int,
  nome varchar(255),
  fk_escola int
);

INSERT INTO professor(idade, quantidade_professor, nome) VALUES ('2016-06-25', 15, 'Cláudio');

SELECT * FROM professor;

