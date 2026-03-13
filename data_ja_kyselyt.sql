-- Vaihe 4: Mallidatan lisääminen
INSERT INTO Kategoria (nimi) VALUES ('Sci-Fi'), ('Komedia'), ('Draama');
INSERT INTO Elokuva (nimi, julkaisuvuosi, kategoria_id) VALUES ('Inception', 2010, 1), ('Interstellar', 2014, 1), ('The Big Lebowski', 1998, 2);
INSERT INTO Asiakas (etunimi, sukunimi, sahkoposti) VALUES ('Matti', 'Meikäläinen', 'matti@esimerkki.fi');
INSERT INTO Vuokraus (asiakas_id) VALUES (1);
INSERT INTO Vuokrausrivi (vuokraus_id, elokuva_id, palautuspvm) VALUES (1, 1, '2026-03-20'), (1, 3, '2026-03-20');

-- Vaihe 5: Esimerkkikyselyt
-- Hae kaikki elokuvat ja niiden kategoriat
SELECT Elokuva.nimi, Kategoria.nimi AS tyylilaji 
FROM Elokuva 
JOIN Kategoria ON Elokuva.kategoria_id = Kategoria.kategoria_id;

-- Hae asiakkaan vuokraukset
SELECT Asiakas.etunimi, Elokuva.nimi 
FROM Asiakas 
JOIN Vuokraus ON Asiakas.asiakas_id = Vuokraus.asiakas_id
JOIN Vuokrausrivi ON Vuokraus.vuokraus_id = Vuokrausrivi.vuokraus_id
JOIN Elokuva ON Vuokrausrivi.elokuva_id = Elokuva.elokuva_id;
