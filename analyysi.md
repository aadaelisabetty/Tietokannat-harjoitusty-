# Elokuvavuokraamon tietokanta-analyysi

## Tehtävä 6: Funktionaaliset riippuvuudet
- asiakas_id -> {etunimi, sukunimi, sahkoposti}
- kategoria_id -> {nimi}
- elokuva_id -> {nimi, julkaisuvuosi, kategoria_id}
- vuokraus_id -> {vuokrauspvm, asiakas_id}
- rivi_id -> {vuokraus_id, elokuva_id, palautuspvm}

## Tehtävä 7: Normaalimuotojen analyysi
- **1NF**: Toteutuu, kaikki arvot ovat atomisia.
- **2NF**: Toteutuu, ei osittaisia riippuvuuksia pääavaimesta.
- **3NF**: Toteutuu, ei transitiivisia riippuvuuksia.
- **BCNF/4NF**: Toteutuu, rakenne on hajautettu loogisesti.
