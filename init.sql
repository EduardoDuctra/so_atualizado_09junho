-- Remover tabelas existentes se elas já existirem (útil para testes e reinicialização)
-- A ordem é importante devido às chaves estrangeiras
DROP TABLE IF EXISTS tarefa CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;
DROP TABLE IF EXISTS categoria CASCADE;

-- Criação da tabela usuario
CREATE TABLE usuario (
                         id INTEGER PRIMARY KEY, -- Chave primária: 'id'
                         nome VARCHAR(255),
                         email VARCHAR(255),
                         senha VARCHAR(255),
                         ativo BOOLEAN
);

-- Para a tabela usuario: gerar id automaticamente
ALTER TABLE usuario
ALTER COLUMN id
ADD GENERATED ALWAYS AS IDENTITY;

-- Criação da tabela categoria
CREATE TABLE categoria (
                           id SERIAL PRIMARY KEY, -- Chave primária: 'id' (antes era 'cod')
                           nome VARCHAR(100) NOT NULL
);

-- Criação da tabela tarefa
CREATE TABLE tarefa (
                        id INTEGER PRIMARY KEY, -- Chave primária: 'id' (antes era 'cod')
                        titulo VARCHAR(255),
                        descricao TEXT,
                        data DATE,
                        concluido BOOLEAN,
                        idUsuario INTEGER, -- Chave estrangeira para 'usuario(id)'
                        idCategoria INTEGER, -- Chave estrangeira para 'categoria(id)' (antes era 'codCategoria')
                        FOREIGN KEY (idUsuario) REFERENCES usuario(id) ON DELETE CASCADE ON UPDATE CASCADE,
                        FOREIGN KEY (idCategoria) REFERENCES categoria(id) ON DELETE SET NULL ON UPDATE CASCADE -- Referencia 'categoria(id)'
);

-- Para a tabela tarefa: gerar id automaticamente
ALTER TABLE tarefa
ALTER COLUMN id
ADD GENERATED ALWAYS AS IDENTITY;

-- Inserção de usuários
INSERT INTO usuario (nome, email, senha, ativo) VALUES
                                                    ('Alice', 'alice@example.com', 'senha123', TRUE),
                                                    ('Bruno', 'bruno@example.com', 'senha123', TRUE),
                                                    ('Carla', 'carla@example.com', 'senha123', FALSE),
                                                    ('Daniel', 'daniel@example.com', 'senha123', TRUE),
                                                    ('Eduarda', 'eduarda@example.com', 'senha123', TRUE);

-- Inserção de categorias
INSERT INTO categoria (nome) VALUES
                                 ('Trabalho'),
                                 ('Pessoal'),
                                 ('Estudo');


-- Inserção das tarefas (idUsuario refere-se ao id do usuário, idCategoria refere-se ao id da categoria)
-- A ordem dos inserts de tarefas agora usa o ID gerado automaticamente.
-- Os IDs de categoria são 1=Trabalho, 2=Pessoal, 3=Estudo com base na inserção acima.

-- Tarefas de Alice (idUsuario = 1)
INSERT INTO tarefa (titulo, descricao, data, concluido, idUsuario, idCategoria) VALUES
                                                                                    ('Tarefa A1', 'Descrição A1', '2025-05-01', FALSE, 1, 1), -- Trabalho
                                                                                    ('Tarefa A2', 'Descrição A2', '2025-05-02', TRUE, 1, 2),  -- Pessoal
                                                                                    ('Tarefa A3', 'Descrição A3', '2025-05-03', FALSE, 1, 3), -- Estudo
                                                                                    ('Tarefa A4', 'Descrição A4', '2025-05-04', FALSE, 1, 1), -- Trabalho
                                                                                    ('Tarefa A5', 'Descrição A5', '2025-05-05', TRUE, 1, 2);  -- Pessoal

-- Tarefas de Bruno (idUsuario = 2)
INSERT INTO tarefa (titulo, descricao, data, concluido, idUsuario, idCategoria) VALUES
                                                                                    ('Tarefa B1', 'Descrição B1', '2025-05-01', TRUE, 2, 1),  -- Trabalho
                                                                                    ('Tarefa B2', 'Descrição B2', '2025-05-02', FALSE, 2, 2); -- Pessoal

-- Tarefas de Carla (idUsuario = 3)
INSERT INTO tarefa (titulo, descricao, data, concluido, idUsuario, idCategoria) VALUES
                                                                                    ('Tarefa C1', 'Descrição C1', '2025-05-01', FALSE, 3, 1), -- Trabalho
                                                                                    ('Tarefa C2', 'Descrição C2', '2025-05-03', TRUE, 3, 2),  -- Pessoal
                                                                                    ('Tarefa C3', 'Descrição C3', '2025-05-04', FALSE, 3, 3); -- Estudo

-- Tarefas de Daniel (idUsuario = 4)
INSERT INTO tarefa (titulo, descricao, data, concluido, idUsuario, idCategoria) VALUES
                                                                                    ('Tarefa D1', 'Descrição D1', '2025-05-01', TRUE, 4, 1),  -- Trabalho
                                                                                    ('Tarefa D2', 'Descrição D2', '2025-05-02', FALSE, 4, 2), -- Pessoal
                                                                                    ('Tarefa D3', 'Descrição D3', '2025-05-03', TRUE, 4, 3),  -- Estudo
                                                                                    ('Tarefa D4', 'Descrição D4', '2025-05-04', FALSE, 4, 1), -- Trabalho
                                                                                    ('Tarefa D5', 'Descrição D5', '2025-05-05', TRUE, 4, 2),  -- Pessoal
                                                                                    ('Tarefa D6', 'Descrição D6', '2025-05-06', TRUE, 4, 3),  -- Estudo
                                                                                    ('Tarefa D7', 'Descrição D7', '2025-05-07', FALSE, 4, 1); -- Trabalho

-- Tarefas de Eduarda (idUsuario = 5)
INSERT INTO tarefa (titulo, descricao, data, concluido, idUsuario, idCategoria) VALUES
                                                                                    ('Tarefa E1', 'Descrição E1', '2025-05-01', FALSE, 5, 1), -- Trabalho
                                                                                    ('Tarefa E2', 'Descrição E2', '2025-05-02', TRUE, 5, 2),  -- Pessoal
                                                                                    ('Tarefa E3', 'Descrição E3', '2025-05-03', FALSE, 5, 3), -- Estudo
                                                                                    ('Tarefa E4', 'Descrição E4', '2025-05-04', TRUE, 5, 1);  -- Trabalho