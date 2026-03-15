-- Vaihe 4: Tietokannan määrittely SQL:llä

-- vaihe 0.5 Poistetaan vanhat taulut (testaamisessa tarvin tätä, en tiedä onko oleellinen oikeasti)
DROP TABLE IF EXISTS Vuokrausrivi;
DROP TABLE IF EXISTS Vuokraus;
DROP TABLE IF EXISTS Elokuva;
DROP TABLE IF EXISTS Asiakas;
DROP TABLE IF EXISTS Kategoria;



CREATE TABLE Kategoria (
    kategoria_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nimi TEXT NOT NULL
);

CREATE TABLE Elokuva (
    elokuva_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nimi TEXT NOT NULL,
    julkaisuvuosi INTEGER,
    kategoria_id INTEGER,
    FOREIGN KEY (kategoria_id) REFERENCES Kategoria(kategoria_id)
);

CREATE TABLE Asiakas (
    asiakas_id INTEGER PRIMARY KEY AUTOINCREMENT,
    etunimi TEXT NOT NULL,
    sukunimi TEXT NOT NULL,
    sahkoposti TEXT UNIQUE
);

CREATE TABLE Vuokraus (
    vuokraus_id INTEGER PRIMARY KEY AUTOINCREMENT,
    vuokrauspvm DATE DEFAULT CURRENT_DATE,
    asiakas_id INTEGER,
    FOREIGN KEY (asiakas_id) REFERENCES Asiakas(asiakas_id)
);

CREATE TABLE Vuokrausrivi (
    rivi_id INTEGER PRIMARY KEY AUTOINCREMENT,
    vuokraus_id INTEGER,
    elokuva_id INTEGER,
    palautuspvm DATE,
    FOREIGN KEY (vuokraus_id) REFERENCES Vuokraus(vuokraus_id),
    FOREIGN KEY (elokuva_id) REFERENCES Elokuva(elokuva_id)
);
