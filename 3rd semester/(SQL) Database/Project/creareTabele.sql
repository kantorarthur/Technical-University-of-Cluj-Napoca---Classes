
CREATE TABLE Categorii
(
    id_categorie INT IDENTITY(1,1) PRIMARY KEY,
    nume_categorie VARCHAR(50) NOT NULL,
);

CREATE TABLE Produse
(
    id_produs INT IDENTITY(1,1) PRIMARY KEY,
    nume_produs VARCHAR(100) NOT NULL,
    pret DECIMAL(10,2) NOT NULL,
    marime VARCHAR(10),
    culoare VARCHAR(30),
    stoc INT NOT NULL,
    id_categorie INT NOT NULL,
    CONSTRAINT fk_produse_categorii
        FOREIGN KEY (id_categorie) REFERENCES Categorii(id_categorie)
);

CREATE TABLE Clienti
(
    id_client INT IDENTITY(1,1) PRIMARY KEY,
    nume VARCHAR(50) NOT NULL,
    prenume VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefon VARCHAR(20),
    adresa VARCHAR(150),
    oras VARCHAR(50),
    data_inregistrare DATE NOT NULL
);

CREATE TABLE Comenzi
(
    id_comanda INT IDENTITY(1,1) PRIMARY KEY,
    data_comanda DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    id_client INT NOT NULL,
    CONSTRAINT fk_comenzi_clienti
        FOREIGN KEY (id_client) REFERENCES Clienti(id_client)
);


CREATE TABLE Detalii_Comanda
(
    id_detaliu INT IDENTITY(1,1) PRIMARY KEY,
    id_comanda INT NOT NULL,
    id_produs INT NOT NULL,
    cantitate INT NOT NULL,
    pret_unitar DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_detalii_comenzi
        FOREIGN KEY (id_comanda) REFERENCES Comenzi(id_comanda),
    CONSTRAINT fk_detalii_produse
        FOREIGN KEY (id_produs) REFERENCES Produse(id_produs)
);
