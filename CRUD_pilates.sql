
-- INSERIR USUÁRIO
INSERT INTO usuarios (nome, email, senha, tipo, ativo)
VALUES ('Maria Silva', 'maria@email.com', '123456', 'aluno', true);

-- CONSULTAR O ID GERADO (ajuste conforme necessário)
-- SELECT * FROM usuarios ORDER BY id DESC LIMIT 1;

-- INSERIR ALUNO (usuario_id = 1)
INSERT INTO alunos (usuario_id, data_nascimento, telefone, endereco, data_cadastro, observacoes)
VALUES (1, '1990-04-10', '(11) 99999-9999', 'Rua A, 123', CURRENT_DATE, 'Primeira matrícula');

-- CONSULTAR ALUNOS
SELECT * FROM alunos;

-- ATUALIZAR ALUNO
UPDATE alunos SET telefone = '(11) 98888-0000', observacoes = 'Contato atualizado' WHERE id = 1;

-- DELETAR ALUNO
DELETE FROM alunos WHERE id = 1;



-- INSERIR INSTRUTOR (usuario_id = 1) -- altere se necessário
INSERT INTO instrutores (usuario_id, especialidades, registro_profissional, data_contratacao)
VALUES (1, 'Pilates solo e aparelhos', 'CREF123456', CURRENT_DATE);

-- CONSULTAR INSTRUTORES
SELECT * FROM instrutores;

-- ATUALIZAR INSTRUTOR
UPDATE instrutores SET especialidades = 'Pilates avançado' WHERE id = 1;

-- DELETAR INSTRUTOR
DELETE FROM instrutores WHERE id = 1;



-- INSERIR AGENDA DO INSTRUTOR
INSERT INTO agenda_instrutores (instrutor_id, data, hora_inicio, hora_fim, disponivel)
VALUES (1, '2025-04-15', '08:00', '12:00', true);

-- CONSULTAR AGENDA
SELECT * FROM agenda_instrutores;

-- ATUALIZAR AGENDA
UPDATE agenda_instrutores SET disponivel = false WHERE id = 1;

-- DELETAR AGENDA
DELETE FROM agenda_instrutores WHERE id = 1;



-- INSERIR AULA
INSERT INTO aulas (instrutor_id, data, hora_inicio, hora_fim, capacidade_maxima, tipo_aula)
VALUES (1, '2025-04-16', '09:00', '10:00', 10, 'Pilates solo');

-- CONSULTAR AULAS
SELECT * FROM aulas;

-- ATUALIZAR AULA
UPDATE aulas SET capacidade_maxima = 12 WHERE id = 1;

-- DELETAR AULA
DELETE FROM aulas WHERE id = 1;
