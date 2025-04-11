CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha_hash TEXT NOT NULL,
    tipo VARCHAR(20) CHECK (tipo IN ('admin', 'instrutor', 'aluno', 'recepcionista')),
    ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE alunos (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id),
    data_nascimento DATE,
    telefone VARCHAR(20),
    endereco TEXT,
    data_cadastro DATE DEFAULT CURRENT_DATE,
    observacoes TEXT
);

CREATE TABLE instrutores (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id),
    especialidades TEXT,
    registro_profissional VARCHAR(50),
    data_contratacao DATE
);

CREATE TABLE planos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    descricao TEXT,
    preco DECIMAL(10,2),
    quantidade_aulas INTEGER,
    duracao_meses INTEGER
);

CREATE TABLE assinaturas (
    id SERIAL PRIMARY KEY,
    aluno_id INTEGER REFERENCES alunos(id),
    plano_id INTEGER REFERENCES planos(id),
    data_inicio DATE,
    data_fim DATE,
    ativa BOOLEAN DEFAULT TRUE,
    forma_pagamento VARCHAR(50)
);

CREATE TABLE pagamentos (
    id SERIAL PRIMARY KEY,
    assinatura_id INTEGER REFERENCES assinaturas(id),
    data_pagamento DATE,
    valor DECIMAL(10,2),
    status VARCHAR(20) CHECK (status IN ('pago', 'atrasado', 'em aberto')),
    metodo VARCHAR(30)
);

CREATE TABLE aulas (
    id SERIAL PRIMARY KEY,
    instrutor_id INTEGER REFERENCES instrutores(id),
    data DATE,
    hora_inicio TIME,
    hora_fim TIME,
    capacidade_maxima INTEGER,
    tipo_aula VARCHAR(100)
);

CREATE TABLE presencas (
    id SERIAL PRIMARY KEY,
    aula_id INTEGER REFERENCES aulas(id),
    aluno_id INTEGER REFERENCES alunos(id),
    compareceu BOOLEAN,
    observacoes TEXT
);

CREATE TABLE avaliacoes_fisicas (
    id SERIAL PRIMARY KEY,
    aluno_id INTEGER REFERENCES alunos(id),
    data DATE,
    peso DECIMAL(5,2),
    altura DECIMAL(4,2),
    flexibilidade TEXT,
    forca TEXT,
    observacoes TEXT
);

CREATE TABLE agenda_instrutores (
    id SERIAL PRIMARY KEY,
    instrutor_id INTEGER REFERENCES instrutores(id),
    data DATE,
    hora_inicio TIME,
    hora_fim TIME,
    disponivel BOOLEAN
);

CREATE TABLE notificacoes (
    id SERIAL PRIMARY KEY,
    usuario_id INTEGER REFERENCES usuarios(id),
    titulo VARCHAR(150),
    mensagem TEXT,
    tipo VARCHAR(30),
    lida BOOLEAN DEFAULT FALSE,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
