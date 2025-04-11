
-- 1. LIMPAR O BANCO (APAGAR TABELAS EXISTENTES)
DROP TABLE IF EXISTS aulas, agenda_instrutores, instrutores, alunos, usuarios CASCADE;

-- 2. CRIAR TABELAS

-- TABELA USUÁRIOS
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    ativo BOOLEAN DEFAULT true
);

-- TABELA ALUNOS
CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    data_nascimento DATE,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    data_cadastro DATE DEFAULT CURRENT_DATE,
    observacoes TEXT,
    CONSTRAINT alunos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- TABELA INSTRUTORES
CREATE TABLE instrutores (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    especialidades TEXT,
    registro_profissional VARCHAR(50),
    data_contratacao DATE DEFAULT CURRENT_DATE,
    CONSTRAINT instrutores_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- TABELA AGENDA DOS INSTRUTORES
CREATE TABLE agenda_instrutores (
    id SERIAL PRIMARY KEY,
    instrutor_id INTEGER NOT NULL,
    data DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    disponivel BOOLEAN DEFAULT true,
    CONSTRAINT agenda_instrutor_id_fkey FOREIGN KEY (instrutor_id) REFERENCES instrutores(id)
);

-- TABELA AULAS
CREATE TABLE aulas (
    id SERIAL PRIMARY KEY,
    instrutor_id INTEGER NOT NULL,
    data DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    capacidade_maxima INTEGER NOT NULL,
    tipo_aula VARCHAR(100),
    CONSTRAINT aulas_instrutor_id_fkey FOREIGN KEY (instrutor_id) REFERENCES instrutores(id)
);

-- 3. INSERIR DADOS DE EXEMPLO

-- USUÁRIO ALUNO
INSERT INTO usuarios (nome, email, senha, tipo, ativo)
VALUES ('Maria Silva', 'maria@email.com', '123456', 'aluno', true);

-- USUÁRIO INSTRUTOR
INSERT INTO usuarios (nome, email, senha, tipo, ativo)
VALUES ('Carlos Instrutor', 'carlos@email.com', 'instrutor123', 'instrutor', true);

-- INSERIR ALUNO (usuario_id = 1)
INSERT INTO alunos (usuario_id, data_nascimento, telefone, endereco, observacoes)
VALUES (1, '1990-04-10', '(11) 99999-9999', 'Rua A, 123', 'Primeira matrícula');

-- INSERIR INSTRUTOR (usuario_id = 2)
INSERT INTO instrutores (usuario_id, especialidades, registro_profissional)
VALUES (2, 'Pilates solo e aparelhos', 'CREF123456');

-- INSERIR AGENDA PARA O INSTRUTOR (instrutor_id = 1)
INSERT INTO agenda_instrutores (instrutor_id, data, hora_inicio, hora_fim)
VALUES (1, '2025-04-15', '08:00', '12:00');

-- INSERIR AULA (instrutor_id = 1)
INSERT INTO aulas (instrutor_id, data, hora_inicio, hora_fim, capacidade_maxima, tipo_aula)
VALUES (1, '2025-04-16', '09:00', '10:00', 10, 'Pilates solo');

-- 4. COMANDOS CRUD EXEMPLO

-- SELECT
SELECT * FROM usuarios;
SELECT * FROM alunos;
SELECT * FROM instrutores;
SELECT * FROM agenda_instrutores;
SELECT * FROM aulas;

-- UPDATE
UPDATE alunos SET telefone = '(11) 98888-0000', observacoes = 'Contato atualizado' WHERE id = 1;
UPDATE instrutores SET especialidades = 'Pilates avançado' WHERE id = 1;
UPDATE aulas SET capacidade_maxima = 12 WHERE id = 1;

-- DELETE (somente exemplos, cuidado ao executar)
-- DELETE FROM aulas WHERE id = 1;
-- DELETE FROM alunos WHERE id = 1;
