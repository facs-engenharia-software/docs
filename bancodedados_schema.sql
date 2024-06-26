CREATE DATABASE miparalegaldb;

\c miparalegaldb;

CREATE TABLE advogados (
registro_do_advogado VARCHAR(14) PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
endereco VARCHAR(200) NOT NULL
);

CREATE TABLE clientes (
cpf_cnpj_do_cliente VARCHAR(18) PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
nome_do_responsavel VARCHAR(100),
endereco VARCHAR(200) NOT NULL,
telefone VARCHAR(20) NOT NULL
);

CREATE TABLE contratos (
numero_do_contrato VARCHAR(20) PRIMARY KEY,
tipo_de_contrato VARCHAR(18) NOT NULL,
data_de_celebracao DATE NOT NULL,
validade VARCHAR(13) NOT NULL,
status_do_contrato VARCHAR(11) NOT NULL,
cpf_cnpj_do_cliente VARCHAR(18) NOT NULL,
FOREIGN KEY (cpf_cnpj_do_cliente) REFERENCES clientes(cpf_cnpj_do_cliente)
);

CREATE TABLE orgaos (
identificacao_do_orgao VARCHAR(20) PRIMARY KEY,
nome_do_orgao VARCHAR(20) NOT NULL,
vinculacao_hierarquica VARCHAR(100) NOT NULL
);

CREATE TABLE processos (
numero_do_processo VARCHAR(20) PRIMARY KEY,
identificacao_do_orgao VARCHAR(20) NOT NULL,
fase_processual VARCHAR(17) NOT NULL,
natureza_da_demanda VARCHAR(27) NOT NULL,
cpf_cnpj_do_cliente VARCHAR(18) NOT NULL,
posicao_do_cliente VARCHAR(100) NOT NULL,
registro_do_advogado VARCHAR(14) NOT NULL,
status_do_processo VARCHAR(25) NOT NULL,
data_de_ajuizamento DATE NOT NULL,
numero_do_contrato VARCHAR(10) NOT NULL,
FOREIGN KEY (identificacao_do_orgao) REFERENCES orgaos(identificacao_do_orgao),
FOREIGN KEY (registro_do_advogado) REFERENCES advogados(registro_do_advogado),
FOREIGN KEY (cpf_cnpj_do_cliente) REFERENCES clientes(cpf_cnpj_do_cliente),
FOREIGN KEY (numero_do_contrato) REFERENCES contratos(numero_do_contrato)
);

CREATE TABLE partes_contrarias (
numero_identificador VARCHAR(20) PRIMARY KEY,
numero_do_processo VARCHAR(20),
cpf_cnpj VARCHAR(14) NOT NULL,
nome VARCHAR(100) NOT NULL,
FOREIGN KEY (numero_do_processo) REFERENCES processos(numero_do_processo)
);

CREATE TABLE andamentos (
numero_do_andamento VARCHAR(20) PRIMARY KEY,
numero_do_processo VARCHAR(20),
data_do_andamento DATE NOT NULL,
descricao VARCHAR(1000) NOT NULL,
FOREIGN KEY (numero_do_processo) REFERENCES processos(numero_do_processo)
);

CREATE TABLE prazos (
numero_do_prazo VARCHAR(20) PRIMARY KEY,
numero_do_processo VARCHAR(20),
descricao VARCHAR(300) NOT NULL,
data_vencimento DATE NOT NULL,
FOREIGN KEY (numero_do_processo) REFERENCES processos(numero_do_processo)
);
