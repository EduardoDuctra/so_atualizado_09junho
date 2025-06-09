-- Remover tabelas existentes se elas já existirem (útil para testes e reinicialização)
DROP TABLE IF EXISTS tarefa CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;
DROP TABLE IF EXISTS categoria CASCADE;

-- Criação da tabela usuario
CREATE TABLE usuario (
                         id INTEGER PRIMARY KEY, -- Alterado de 'cod' para 'id'
                         nome VARCHAR(255),
                         email VARCHAR(255),
                         senha VARCHAR(255),
                         ativo BOOLEAN
);

-- Para a tabela usuario: gerar id automaticamente
ALTER TABLE usuario
ALTER COLUMN id -- Alterado de 'cod' para 'id'
ADD GENERATED ALWAYS AS IDENTITY;

-- Criação da tabela tarefa
CREATE TABLE tarefa (
                        cod INTEGER PRIMARY KEY,
                        titulo VARCHAR(255),
                        descricao TEXT,
                        data DATE,
                        concluido BOOLEAN,
                        idUsuario INTEGER, -- Alterado de 'codUsuario' para 'idUsuario' para consistência
                        FOREIGN KEY (idUsuario) REFERENCES usuario(id) ON DELETE CASCADE ON UPDATE CASCADE -- Referencia 'usuario(id)'
);

-- Para a tabela tarefa: gerar cod automaticamente
ALTER TABLE tarefa
ALTER COLUMN cod
ADD GENERATED ALWAYS AS IDENTITY;

-- Inserção de usuários
INSERT INTO usuario (nome, email, senha, ativo) VALUES
                                                    ('Alice', 'alice@example.com', 'senha123', TRUE),
                                                    ('Bruno', 'bruno@example.com', 'senha123', TRUE),
                                                    ('Carla', 'carla@example.com', 'senha123', FALSE),
                                                    ('Daniel', 'daniel@example.com', 'senha123', TRUE),
                                                    ('Eduarda', 'eduarda@example.com', 'senha123', TRUE);

-- Inserção das tarefas
-- Tarefas de Alice (usuário 1) - Note que codUsuario agora é idUsuario
INSERT INTO tarefa (titulo, descricao, data, concluido, idUsuario) VALUES
                                                                       ('Tarefa A1', 'Descrição A1', '2025-05-01', FALSE, 1),
                                                                       ('Tarefa A2', 'Descrição A2', '2025-05-02', TRUE, 1),
                                                                       ('Tarefa A3', 'Descrição A3', '2025-05-03', FALSE, 1),
                                                                       ('Tarefa A4', 'Descrição A4', '2025-05-04', FALSE, 1),
                                                                       ('Tarefa A5', 'Descrição A5', '2025-05-05', TRUE, 1);

-- Tarefas de Bruno (usuário 2)
INSERT INTO tarefa (titulo, descricao, data, concluido, idUsuario) VALUES
                                                                       ('Tarefa B1', 'Descrição B1', '2025-05-01', TRUE, 2),
                                                                       ('Tarefa B2', 'Descrição B2', '2025-05-02', FALSE, 2);

-- Tarefas de Carla (usuário 3)
INSERT INTO tarefa (titulo, descricao, data, concluido, idUsuario) VALUES
                                                                       ('Tarefa C1', 'Descrição C1', '2025-05-01', FALSE, 3),
                                                                       ('Tarefa C2', 'Descrição C2', '2025-05-03', TRUE, 3),
                                                                       ('Tarefa C3', 'Descrição C3', '2025-05-04', FALSE, 3);

-- Tarefas de Daniel (usuário 4)
INSERT INTO tarefa (titulo, descricao, data, concluido, idUsuario) VALUES
                                                                       ('Tarefa D1', 'Descrição D1', '2025-05-01', TRUE, 4),
                                                                       ('Tarefa D2', 'Descrição D2', '2025-05-02', FALSE, 4),
                                                                       ('Tarefa D3', 'Descrição D3', '2025-05-03', TRUE, 4),
                                                                       ('Tarefa D4', 'Descrição D4', '2025-05-04', FALSE, 4),
                                                                       ('Tarefa D5', 'Descrição D5', '2025-05-05', TRUE, 4),
                                                                       ('Tarefa D6', 'Descrição D6', '2025-05-06', TRUE, 4),
                                                                       ('Tarefa D7', 'Descrição D7', '2025-05-07', FALSE, 4);

-- Tarefas de Eduarda (usuário 5)
INSERT INTO tarefa (titulo, descricao, data, concluido, idUsuario) VALUES
                                                                       ('Tarefa E1', 'Descrição E1', '2025-05-01', FALSE, 5),
                                                                       ('Tarefa E2', 'Descrição E2', '2025-05-02', TRUE, 5),
                                                                       ('Tarefa E3', 'Descrição E3', '2025-05-03', FALSE, 5),
                                                                       ('Tarefa E4', 'Descrição E4', '2025-05-04', TRUE, 5);

-- Criação da tabela categoria
CREATE TABLE categoria (
                           cod SERIAL PRIMARY KEY,
                           nome VARCHAR(100) NOT NULL
);

-- Adiciona coluna codCategoria na tabela tarefa
ALTER TABLE tarefa
    ADD COLUMN codCategoria INTEGER;

-- Adiciona chave estrangeira para categoria
ALTER TABLE tarefa
    ADD CONSTRAINT fk_tarefa_categoria
        FOREIGN KEY (codCategoria) REFERENCES categoria(cod) ON DELETE SET NULL ON UPDATE CASCADE;

-- Atualização das categorias das tarefas (os códigos das tarefas permanecem os mesmos)
-- Alice
UPDATE tarefa SET codCategoria = 1 WHERE cod = 1;  -- Tarefa A1 -> Trabalho
UPDATE tarefa SET codCategoria = 2 WHERE cod = 2;  -- Tarefa A2 -> Pessoal
UPDATE tarefa SET codCategoria = 3 WHERE cod = 3;  -- Tarefa A3 -> Estudo
UPDATE tarefa SET codCategoria = 1 WHERE cod = 4;  -- Tarefa A4 -> Trabalho
UPDATE tarefa SET codCategoria = 2 WHERE cod = 5;  -- Tarefa A5 -> Pessoal

-- Bruno
UPDATE tarefa SET codCategoria = 1 WHERE cod = 6;  -- Tarefa B1 -> Trabalho
UPDATE tarefa SET codCategoria = 2 WHERE cod = 7;  -- Tarefa B2 -> Pessoal

-- Carla
UPDATE tarefa SET codCategoria = 1 WHERE cod = 8;  -- Tarefa C1 -> Trabalho
UPDATE tarefa SET codCategoria = 2 WHERE cod = 9;  -- Tarefa C2 -> Pessoal
UPDATE tarefa SET codCategoria = 3 WHERE cod = 10; -- Tarefa C3 -> Estudo

-- Daniel
UPDATE tarefa SET codCategoria = 1 WHERE cod = 11; -- Tarefa D1 -> Trabalho
UPDATE tarefa SET codCategoria = 2 WHERE cod = 12; -- Tarefa D2 -> Pessoal
UPDATE tarefa SET codCategoria = 3 WHERE cod = 13; -- Tarefa D3 -> Estudo
UPDATE tarefa SET codCategoria = 1 WHERE cod = 14; -- Tarefa D4 -> Trabalho
UPDATE tarefa SET codCategoria = 2 WHERE cod = 15; -- Tarefa D5 -> Pessoal
UPDATE tarefa SET codCategoria = 3 WHERE cod = 16; -- Tarefa D6 -> Estudo
UPDATE tarefa SET codCategoria = 1 WHERE cod = 17; -- Tarefa D7 -> Trabalho

-- Eduarda
UPDATE tarefa SET codCategoria = 1 WHERE cod = 18; -- Tarefa E1 -> Trabalho
UPDATE tarefa SET codCategoria = 2 WHERE cod = 19; -- Tarefa E2 -> Pessoal
UPDATE tarefa SET codCategoria = 3 WHERE cod = 20; -- Tarefa E3 -> Estudo
UPDATE tarefa SET codCategoria = 1 WHERE cod = 21; -- Tarefa E4 -> Trabalho