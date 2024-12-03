CREATE TABLE Dipartimenti (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE CorsiDiLaurea (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    dipartimento_id INT,
    FOREIGN KEY (dipartimento_id) REFERENCES Dipartimenti (id)
);

CREATE TABLE Corsi (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    corso_di_laurea_id INT,
    FOREIGN KEY (corso_di_laurea_id) REFERENCES CorsiDiLaurea (id)
);

