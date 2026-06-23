
CREATE DATABASE conectadoa;
USE conectadoa;

CREATE TABLE doador(
id_doador INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255),
tipo_doador VARCHAR(2),
documento VARCHAR(20) UNIQUE,
telefone VARCHAR(20),
email VARCHAR(100),
data_cadastro DATE);

CREATE TABLE doacao(
id_doacao INT AUTO_INCREMENT PRIMARY KEY,
id_doador INT,
data_recebimento DATE,
status_doacao VARCHAR(50),
FOREIGN KEY(id_doador) REFERENCES doador(id_doador));

CREATE TABLE item_doacao(
id_item_doacao INT AUTO_INCREMENT PRIMARY KEY,
id_doacao INT,
categoria VARCHAR(100),
descricao VARCHAR(255),
quantidade DECIMAL(10,2),
unidade_medida VARCHAR(20),
FOREIGN KEY(id_doacao) REFERENCES doacao(id_doacao));

CREATE TABLE item_estoque(
id_estoque INT AUTO_INCREMENT PRIMARY KEY,
categoria VARCHAR(100),
descricao_item VARCHAR(255),
quantidade_disponivel DECIMAL(10,2),
localizacao_fisica VARCHAR(100));

CREATE TABLE beneficiario(
id_beneficiario INT AUTO_INCREMENT PRIMARY KEY,
nome_responsavel VARCHAR(255),
quantidade_membros INT,
endereco VARCHAR(255),
status_cadastro VARCHAR(50));

CREATE TABLE entrega(
id_entrega INT AUTO_INCREMENT PRIMARY KEY,
id_beneficiario INT,
data_entrega DATE,
ponto_entrega VARCHAR(255),
FOREIGN KEY(id_beneficiario) REFERENCES beneficiario(id_beneficiario));

CREATE TABLE item_entrega(
id_entrega INT,
id_estoque INT,
quantidade_entregue DECIMAL(10,2),
PRIMARY KEY(id_entrega,id_estoque),
FOREIGN KEY(id_entrega) REFERENCES entrega(id_entrega),
FOREIGN KEY(id_estoque) REFERENCES item_estoque(id_estoque));
