## Arquivo .sql

CREATE TABLE Cliente (
  ID_Cliente INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL UNIQUE,
  Telefone VARCHAR(20) NOT NULL,
  CPF VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE Serviço (
  ID_Serviço INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Descrição TEXT NOT NULL,
  Preço DECIMAL(10,2) NOT NULL
);

CREATE TABLE Profissional (
  ID_Profissional INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(255) NOT NULL,
  Especialidade VARCHAR(255) NOT NULL,
  Email VARCHAR(255) NOT NULL UNIQUE
);

CREATE TABLE Cliente_Serviço (
  ID_Cliente INT NOT NULL,
  ID_Serviço INT NOT NULL,
  PRIMARY KEY (ID_Cliente, ID_Serviço),
  FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
  FOREIGN KEY (ID_Serviço) REFERENCES Serviço(ID_Serviço)
);

CREATE TABLE Profissional_Serviço (
  ID_Profissional INT NOT NULL,
  ID_Serviço INT NOT NULL,
  PRIMARY KEY (ID_Profissional, ID_Serviço),
  FOREIGN KEY (ID_Profissional) REFERENCES Profissional(ID_Profissional),
  FOREIGN KEY (ID_Serviço) REFERENCES Serviço(ID_Serviço)
);

