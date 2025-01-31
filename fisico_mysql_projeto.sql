CREATE DATABASE bd_faculdade;
USE bd_faculdade;

CREATE TABLE alunos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento_aluno DATE NOT NULL,
    cpf_aluno VARCHAR(14) NOT NULL
);
    
CREATE TABLE professores(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_professor VARCHAR(100) UNIQUE NOT NULL,
    data_nascimento_professor DATE NOT NULL,
    cpf_professor VARCHAR(15) NOT NULL
    );
    
CREATE TABLE disciplina(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_disciplina VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,
    id_professor INT,
    FOREIGN KEY (id_professor) REFERENCES professores(id) ON DELETE CASCADE
    );
    
CREATE TABLE cursos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(100) NOT NULL,
    carga_horaria_curso INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id) ON DELETE CASCADE
    );
    
CREATE TABLE turno(
	id INT AUTO_INCREMENT PRIMARY KEY,
    turno VARCHAR(100) NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id) ON DELETE CASCADE
    );
    
CREATE TABLE salas(
	nome_sala VARCHAR(100) NOT NULL,
	numero_sala INT NOT NULL,
	capacidade_maxima INT NOT NULL
	);

CREATE TABLE telefone(
	id INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(15) NOT NULL,
    id_aluno INT,
    id_professor INT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id) ON DELETE CASCADE,
    FOREIGN KEY (id_professor) REFERENCES professores(id) ON DELETE CASCADE
    );

CREATE TABLE email(
	id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    id_aluno INT,
    id_professor INT,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id) ON DELETE CASCADE,
    FOREIGN KEY (id_professor) REFERENCES professores(id) ON DELETE CASCADE
	);
    
CREATE TABLE historico(
	status_aluno VARCHAR(50),
	nota_aluno INT(10),
	semestre VARCHAR(50),
    id_aluno INT,
    id_disciplina INT,
	FOREIGN KEY (id_aluno) REFERENCES alunos(id) ON DELETE CASCADE,
	FOREIGN KEY (id_disciplina) REFERENCES disciplina(id) ON DELETE CASCADE
	);

CREATE TABLE cursos_disciplinas(
	id_aluno INT,
    id_curso INT,
	PRIMARY KEY (id_aluno, id_curso),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id),
    FOREIGN KEY (id_curso) REFERENCES cursos(id)
    );

ALTER TABLE alunos MODIFY cpf_aluno VARCHAR(15);

INSERT INTO alunos(nome_aluno, data_nascimento_aluno, cpf_aluno)
VALUES ('Isabela', '2005-01-02', '296.872.178-12');

INSERT INTO professores(nome_professor, data_nascimento_professor, cpf_professor)
VALUES ('hugo', '1999-03-03', '765.763.763-23');

INSERT INTO disciplina(nome_disciplina, carga_horaria)
VALUES ('matematica', '3200');

INSERT INTO cursos(nome_curso, carga_horaria_curso)
VALUES ('engenharia', '4');

INSERT INTO turno(turno)
VALUES ('vespertino');

INSERT INTO salas(nome_sala, numero_sala, capacidade_maxima)
VALUES ('engenharia civil', '5', '100');

ALTER TABLE telefone MODIFY telefone VARCHAR(16);

INSERT INTO telefone(telefone)
VALUES ('16-7728-1927');

INSERT INTO email(email)
VALUES ('isabela@gmail.com');

INSERT INTO historico(status_aluno, nota_aluno, semestre)
VALUES ('aprovado', '9', '3');

INSERT INTO turno(turno)
VALUES ('vespertino');

    
        

    
    
	


