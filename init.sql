DROP TABLE IF EXISTS tarefa CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;
DROP TABLE IF EXISTS categoria CASCADE;

CREATE TABLE usuario (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(255),
    email VARCHAR(255),
    senha VARCHAR(255)
);

CREATE TABLE categoria (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    nome VARCHAR(255)
);

CREATE TABLE tarefa (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    titulo VARCHAR(255),
    descricao TEXT,
    concluido BOOLEAN,
    codUsuario INTEGER,
    codCategoria INTEGER,
    FOREIGN KEY (codUsuario) REFERENCES usuario(id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (codCategoria) REFERENCES categoria(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO usuario (nome, email, senha) VALUES
    ('Alice', 'alice@example.com', 'senha123'),
    ('Bruno', 'bruno@example.com', 'senha123'),
    ('Carla', 'carla@example.com', 'senha123'),
    ('Daniel', 'daniel@example.com', 'senha123'),
    ('Eduarda', 'eduarda@example.com', 'senha123');

INSERT INTO categoria (nome) VALUES
    ('Trabalho'),
    ('Pessoal'),
    ('Estudo');

INSERT INTO tarefa (titulo, descricao, concluido, codUsuario, codCategoria) VALUES
    ('Comprar pão', 'Pegar pão francês na padaria', FALSE, 1, 2),
    ('Reunião de equipe', 'Reunião mensal para alinhamento de projetos', FALSE, 1, 1),
    ('Estudar para prova', 'Revisar matéria de SO', FALSE, 1, 3);

INSERT INTO tarefa (titulo, descricao, concluido, codUsuario, codCategoria) VALUES
    ('Fazer compras', 'Lista de supermercado', FALSE, 3, 2),
    ('Apresentação projeto', 'Slide final do projeto X', FALSE, 3, 1);

INSERT INTO tarefa (titulo, descricao, concluido, codUsuario, codCategoria) VALUES
    ('Ler livro', 'Capítulo 5 de "Clean Code"', FALSE, 4, 3);

INSERT INTO tarefa (titulo, descricao, concluido, codUsuario, codCategoria) VALUES
    ('Organizar arquivos', 'Limpar desktop', TRUE, 5, 2);
