-- Vaihe 4 Mallidatan lisääminen
-- kategoirioiden lisääminen
INSERT INTO Kategoria (nimi) VALUES ('Sci-Fi'), ('Komedia'), ('Draama');

-- Lisätään asiakkaat: 
INSERT INTO Asiakas (etunimi, sukunimi, sahkoposti) VALUES 
('Matti', 'Meikäläinen', 'matti@esimerkki.fi');

-- Lisätään elokuvat 
INSERT INTO Elokuva (nimi,julkaisuvuosi, kategoria_id) VALUES 
('Mean Girls', 2004, 2),
('Barbie', 2023, 2),
('Lemmikkien salainen maailma', 2016, 2),
('Iron Man',2008, 1);

--Lisätään vuokraustapahtumat

INSERT INTO Vuokraus (asiakas_id) VALUES (1);
INSERT INTO Vuokrausrivi (vuokraus_id, elokuva_id, palautuspvm) VALUES 
(1, 1, '2026-03-20'), 
(1, 3, '2026-02-13');

-- Lisätään kyselyt eli SELECT-lauseet 

-- Hae elokuvien määrä per kategoria 
SELECT Kategoria.nimi, COUNT(Elokuva.elokuva_id) AS elokuvien_maara
FROM Kategoria
LEFT JOIN Elokuva ON Kategoria.kategoria_id = Elokuva.kategoria_id
GROUP BY Kategoria.nimi;

-- Aktiivisimmat asiakkaat (Kuka on vuokrannut eniten)
SELECT Asiakas.etunimi, Asiakas.sukunimi, COUNT(Vuokraus.vuokraus_id) AS vuokraukset
FROM Asiakas
LEFT JOIN Vuokraus ON Asiakas.asiakas_id = Vuokraus.asiakas_id
GROUP BY Asiakas.asiakas_id
ORDER BY vuokraukset DESC;INSERT INTO Asiakas (etunimi, sukunimi, sahkoposti) VALUES ('Matti', 'Meikäläinen', 'matti@esimerkki.fi');
INSERT INTO Vuokraus (asiakas_id) VALUES (1);
INSERT INTO Vuokrausrivi (vuokraus_id, elokuva_id, palautuspvm) VALUES (1, 1, '2026-03-20'), (1, 3, '2026-03-20');

-- Hae kaikki elokuvat ja niiden kategoriat
SELECT Elokuva.nimi, Elokuva.julkaisuvuosi, Kategoria.nimi AS tyylilaji 
FROM Elokuva
JOIN Kategoria ON Elokuva.kategoria_id = Kategoria.kategoria_id;

-- Hae asiakkaan vuokraukset
SELECT Asiakas.etunimi, Elokuva.nimi 
FROM Asiakas 
JOIN Vuokraus ON Asiakas.asiakas_id = Vuokraus.asiakas_id
JOIN Vuokrausrivi ON Vuokraus.vuokraus_id = Vuokrausrivi.vuokraus_id
JOIN Elokuva ON Vuokrausrivi.elokuva_id = Elokuva.elokuva_id
