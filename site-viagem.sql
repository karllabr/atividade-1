CREATE DATABASE site_viagem;
USE site_viagem;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    cpf VARCHAR(14) UNIQUE
);

CREATE TABLE destino_turistico (
    id_destino INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
   
);

CREATE TABLE pacote_viagem (
    id_pacote INT AUTO_INCREMENT PRIMARY KEY,
    id_destino INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    vagas INT NOT NULL,
    FOREIGN KEY (id_destino) REFERENCES destino_turistico(id_destino)
);

CREATE TABLE reserva (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_pacote INT NOT NULL,
    data_reserva DATETIME DEFAULT CURRENT_TIMESTAMP,
    quantidade_pessoas INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_pacote) REFERENCES pacote_viagem(id_pacote) ON DELETE CASCADE
);