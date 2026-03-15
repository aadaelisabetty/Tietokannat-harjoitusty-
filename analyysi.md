
# Elokuvavuokraamon analyysi

## Tehtävä 6: Funktionaaliset riippuvuudet, 
tarkastellaan mallin keskeisimpiä fuktionaalisia riippuvuuksia

- asiakas_id -> {etunimi, sukunimi, sahkoposti}
(jokainen asiakas on yksilö ja ID määrittäää henkilön tiedot)
Triviaali riippuvuus, refleksiivisyys eli jos tiedän asiakasnumeron, tiedän asiakasnumeron, 
tieto siis määrittää itsensä.
- kategoria_id -> {nimi}
- elokuva_id -> {nimi, julkaisuvuosi, kategoria_id}
(Jokaisella elokuvalla on nimi ja se kuuluu tiettyyn kategoriaan)
- vuokraus_id -> {vuokrauspvm, asiakas_id}
(Yksi vuokraustapahtuma tapahtuu tiettynä hetkenä ja on sidottu yhteen asiakkaaseen.)

- vuokraurivi_id -> {vuokraus_id, elokuva_id, palautuspvm}

## Tehtävä 7: Normaalimuotojen analyysi
- **1NF**: Toteutuu, kaikki arvot ovat atomisia, tauluissa ei ole toistoa.
- **2NF**: Toteutuu, ei osittaisia riippuvuuksia pääavaimesta.
- **3NF**: Toteutuu, ei transitiivisia riippuvuuksia.
 (Atribuutit riippuvat pääavaimesta, ei toisistaan.)

- **BCNF/4NF**: Toteutuu, rakenne on hajautettu loogisesti niin että jokainen määrääjä on avain.

## Muuta:
- **N:M-suhde**: Toteutettu `Vuokrausrivi`-liitostaululla Elokuvan ja Vuokrauksen välille.
Monesta moneen suhde on hallittavassa muodossa liitostaulun kautta.
- **Eheysrajoitteet**: `NOT NULL` -rajoitteita käytetään kriittisissä kentissä
 (nimet, ID:t). `Elokuva.julkaisuvuosi` sallii NULL-arvon, jos tieto ei ole vielä tiedossa.
