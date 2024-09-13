-- lista 2 --------------------

CREATE DATABASE db_ecommerce_exam;
USE db_ecommerce_exam;
CREATE TABLE produtos (
   produto_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT,
   preco DECIMAL(10, 2) NOT NULL,
   estoque INT NOT NULL,
   data_adicionado DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE clientes (
   cliente_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   email VARCHAR(100) UNIQUE NOT NULL,
   telefone VARCHAR(15),
   endereco TEXT,
   data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedidos (
   pedido_id INT AUTO_INCREMENT PRIMARY KEY,
   cliente_id INT NOT NULL,
   data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
   total DECIMAL(10, 2) NOT NULL,
   status VARCHAR(50),
   FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE itens_pedido (
   item_pedido_id INT AUTO_INCREMENT PRIMARY KEY,
   pedido_id INT NOT NULL,
   produto_id INT NOT NULL,
   quantidade INT NOT NULL,
   preco_unitario DECIMAL(10, 2) NOT NULL,
   FOREIGN KEY (pedido_id) REFERENCES pedidos(pedido_id),
   FOREIGN KEY (produto_id) REFERENCES produtos(produto_id)
);

-- Inserindo produtos
INSERT INTO produtos (nome, descricao, preco, estoque) VALUES
('Smartphone XYZ', 'Smartphone com 128GB de armazenamento', 1200.00, 50),
('Notebook ABC', 'Notebook com 16GB RAM e 512GB SSD', 3500.00, 30),
('Tablet DEF', 'Tablet com tela de 10 polegadas', 800.00, 40);

-- Inserindo clientes
INSERT INTO clientes (nome, email, telefone, endereco) VALUES
('João da Silva', 'joao.silva@email.com', '11999999999', 'Rua A, 123'),
('Maria Oliveira', 'maria.oliveira@email.com', '11888888888', 'Rua B, 456'),
('Carlos Pereira', 'carlos.pereira@email.com', '11777777777', 'Rua C, 789');

-- Inserindo pedidos
INSERT INTO pedidos (cliente_id, total, status) VALUES
(1, 2400.00, 'Processando'),
(2, 800.00, 'Enviado'),
(3, 3500.00, 'Entregue');

-- Inserindo itens dos pedidos
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 2, 1200.00),
(2, 3, 1, 800.00),
(3, 2, 1, 3500.00);
-- exercicio 1
select clientes.email, clientes.nome
from clientes
inner join pedidos on clientes.cliente_id = pedidos.cliente_id;

CREATE DATABASE db_crm_exam;
USE db_crm_exam;
CREATE TABLE clientes (
   cliente_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   email VARCHAR(100) UNIQUE NOT NULL,
   telefone VARCHAR(15),
   endereco TEXT,
   data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE interacoes (
   interacao_id INT AUTO_INCREMENT PRIMARY KEY,
   cliente_id INT NOT NULL,
   tipo VARCHAR(50),
   data_interacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   detalhes TEXT,
   FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
);

CREATE TABLE campanhas (
   campanha_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   descricao TEXT,
   data_inicio DATE,
   data_fim DATE
);

CREATE TABLE participacoes_campanha (
   participacao_id INT AUTO_INCREMENT PRIMARY KEY,
   cliente_id INT NOT NULL,
   campanha_id INT NOT NULL,
   data_participacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
   FOREIGN KEY (campanha_id) REFERENCES campanhas(campanha_id)
);

-- Inserindo clientes
INSERT INTO clientes (nome, email, telefone, endereco) VALUES
('Lucas Andrade', 'lucas.andrade@email.com', '11555555555', 'Avenida D, 1001'),
('Fernanda Costa', 'fernanda.costa@email.com', '11666666666', 'Rua E, 202'),
('Renata Souza', 'renata.souza@email.com', '11777777777', 'Rua F, 303');

-- Inserindo interações
INSERT INTO interacoes (cliente_id, tipo, detalhes) VALUES
(1, 'Telefone', 'Ligação para esclarecimento sobre produto'),
(2, 'Email', 'Enviado e-mail promocional da campanha de verão'),
(3, 'Chat', 'Suporte técnico solicitado via chat online');

-- Inserindo campanhas
INSERT INTO campanhas (nome, descricao, data_inicio, data_fim) VALUES
('Campanha Verão 2024', 'Descontos especiais para produtos de verão', '2024-01-01', '2024-03-31'),
('Campanha Black Friday', 'Ofertas de Black Friday 2024', '2024-11-25', '2024-11-30');

-- Inserindo participações em campanhas
INSERT INTO participacoes_campanha (cliente_id, campanha_id) VALUES
(1, 1),
(2, 2),
(3, 1);
-- exercicio 6
select campanhas.nome, count(participacoes_campanha.participacao_id)
from campanhas
left join participacoes_campanha on campanhas.campanha_id = participacoes_campanha.campanha_id
group by campanhas.nome;

-- new
CREATE DATABASE db_financas_exam;
USE db_financas_exam;

CREATE TABLE contas (
   conta_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   tipo VARCHAR(50),
   saldo DECIMAL(15, 2) DEFAULT 0.00,
   data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transacoes (
   transacao_id INT AUTO_INCREMENT PRIMARY KEY,
   conta_id INT NOT NULL,
   tipo VARCHAR(50),
   valor DECIMAL(15, 2) NOT NULL,
   data_transacao DATETIME DEFAULT CURRENT_TIMESTAMP,
   descricao TEXT,
   FOREIGN KEY (conta_id) REFERENCES contas(conta_id)
);

CREATE TABLE orcamentos (
   orcamento_id INT AUTO_INCREMENT PRIMARY KEY,
   categoria VARCHAR(100),
   valor_planejado DECIMAL(15, 2) NOT NULL,
   data_inicio DATE,
   data_fim DATE
);

-- Inserindo contas
INSERT INTO contas (nome, tipo, saldo) VALUES
('Conta Corrente', 'Conta Corrente', 5000.00),
('Poupança', 'Conta Poupança', 12000.00),
('Investimentos', 'Conta Investimento', 20000.00);

-- Inserindo transações
INSERT INTO transacoes (conta_id, tipo, valor, descricao) VALUES
(1, 'Débito', 1000.00, 'Pagamento de aluguel'),
(2, 'Crédito', 1500.00, 'Depósito mensal'),
(3, 'Crédito', 5000.00, 'Rendimento de investimentos');

-- Inserindo orçamentos
INSERT INTO orcamentos (categoria, valor_planejado, data_inicio, data_fim) VALUES
('Alimentação', 2000.00, '2024-01-01', '2024-01-31'),
('Transporte', 800.00, '2024-01-01', '2024-01-31'),
('Lazer', 1000.00, '2024-01-01', '2024-01-31');
-- exercicio 2
select contas.nome, transacoes.valor, transacoes.tipo
from contas
left join transacoes on contas.conta_id = transacoes.conta_id;

CREATE DATABASE db_prontuario_exam;
USE db_prontuario_exam;

CREATE TABLE pacientes (
   paciente_id INT AUTO_INCREMENT PRIMARY KEY,
   nome VARCHAR(100) NOT NULL,
   data_nascimento DATE,
   sexo VARCHAR(10),
   telefone VARCHAR(15),
   endereco TEXT,
   data_registro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE prontuarios (
   prontuario_id INT AUTO_INCREMENT PRIMARY KEY,
   paciente_id INT NOT NULL,
   data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,
   medico VARCHAR(100),
   diagnostico TEXT,
   prescricao TEXT,
   observacoes TEXT,
   FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id)
);

CREATE TABLE consultas (
   consulta_id INT AUTO_INCREMENT PRIMARY KEY,
   paciente_id INT NOT NULL,
   medico VARCHAR(100),
   data_consulta DATETIME DEFAULT CURRENT_TIMESTAMP,
   motivo TEXT,
   FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id)
);

-- Inserindo pacientes
INSERT INTO pacientes (nome, data_nascimento, sexo, telefone, endereco) VALUES
('Ana Lima', '1985-04-23', 'Feminino', '11911111111', 'Rua G, 101'),
('Bruno Souza', '1978-11-10', 'Masculino', '11822222222', 'Rua H, 202'),
('Carla Mendes', '1990-08-30', 'Feminino', '11733333333', 'Rua I, 303');

-- Inserindo prontuários
INSERT INTO prontuarios (paciente_id, medico, diagnostico, prescricao, observacoes) VALUES
(1, 'Dr. Silva', 'Gripe', 'Antitérmicos e repouso', 'Paciente deve retornar em 7 dias'),
(2, 'Dra. Pereira', 'Hipertensão', 'Controle da pressão e mudança de dieta', 'Acompanhamento mensal necessário'),
(3, 'Dr. Santos', 'Enxaqueca', 'Analgésicos e redução de estresse', 'Recomendado exame neurológico');

-- Inserindo consultas
INSERT INTO consultas (paciente_id, medico, motivo) VALUES
(1, 'Dr. Silva', 'Consulta de retorno após tratamento de gripe'),
(2, 'Dra. Pereira', 'Primeira consulta de acompanhamento da hipertensão'),
(3, 'Dr. Santos', 'Consulta inicial para avaliação de enxaqueca crônica');


--exercicio 5
select prontuarios.prontuario_id, pacientes.paciente_id, consultas.data_consulta, consultas.medico, consultas.motivo
from prontuarios 
left join pacientes on prontuarios.paciente_id = pacientes.paciente_id
left join consultas on pacientes.paciente_id = consultas.consulta_id;
