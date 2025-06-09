-- Remover tabelas se existirem para garantir um início limpo
DROP TABLE IF EXISTS tarefa CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;
DROP TABLE IF EXISTS categoria CASCADE;

-- Criação da tabela usuario
CREATE TABLE usuario (
                         id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
                         nome VARCHAR(255),
                         email VARCHAR(255),
                         senha VARCHAR(255),
                         ativo BOOLEAN
);

-- Criação da tabela categoria
CREATE TABLE categoria (
                           id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
                           nome VARCHAR(255)
);

-- Criação da tabela tarefa
CREATE TABLE tarefa (
                        id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
                        titulo VARCHAR(255),
                        descricao TEXT,
                        data DATE,
                        concluido BOOLEAN,
                        codUsuario INTEGER,        -- Usando 'codUsuario' conforme sua especificação
                        codCategoria INTEGER,      -- Usando 'codCategoria' conforme sua especificação
                        FOREIGN KEY (codUsuario) REFERENCES usuario(id) ON DELETE CASCADE ON UPDATE CASCADE,
                        FOREIGN KEY (codCategoria) REFERENCES categoria(id) ON DELETE CASCADE ON UPDATE CASCADE
);

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
                                 ('Estudo'),
                                 ('Saúde'),
                                 ('Finanças');

-- Inserção de tarefas (exemplos iniciais, associando a usuários e categorias)
-- Alice (id=1)
INSERT INTO tarefa (titulo, descricao, data, concluido, codUsuario, codCategoria) VALUES
                                                                                      ('Comprar pão', 'Pegar pão francês na padaria', '2025-06-10', FALSE, 1, 2), -- Pessoal
                                                                                      ('Reunião de equipe', 'Reunião mensal para alinhamento de projetos', '2025-06-11', FALSE, 1, 1), -- Trabalho
                                                                                      ('Estudar para prova', 'Revisar matéria de SO', '2025-06-15', FALSE, 1, 3); -- Estudo

-- Bruno (id=2)
INSERT INTO tarefa (titulo, descricao, data, concluido, codUsuario, codCategoria) VALUES
                                                                                      ('Pagar contas', 'Boletos de água e luz', '2025-06-12', FALSE, 2, 5), -- Finanças
                                                                                      ('Academia', 'Treino de pernas', '2025-06-10', TRUE, 2, 4); -- Saúde

-- Carla (id=3)
INSERT INTO tarefa (titulo, descricao, data, concluido, codUsuario, codCategoria) VALUES
                                                                                      ('Fazer compras', 'Lista de supermercado', '2025-06-13', FALSE, 3, 2), -- Pessoal
                                                                                      ('Apresentação projeto', 'Slide final do projeto X', '2025-06-14', FALSE, 3, 1); -- Trabalho

-- Daniel (id=4)
INSERT INTO tarefa (titulo, descricao, data, concluido, codUsuario, codCategoria) VALUES
                                                                                      ('Ler livro', 'Capítulo 5 de "Clean Code"', '2025-06-12', FALSE, 4, 3), -- Estudo
                                                                                      ('Consulta médica', 'Check-up anual', '2025-06-16', FALSE, 4, 4); -- Saúde

-- Eduarda (id=5)
INSERT INTO tarefa (titulo, descricao, data, concluido, codUsuario, codCategoria) VALUES
                                                                                      ('Organizar arquivos', 'Limpar desktop', '2025-06-09', TRUE, 5, 2), -- Pessoal
                                                                                      ('Preparar relatório', 'Relatório de vendas do mês', '2025-06-10', FALSE, 5, 1); -- Trabalho