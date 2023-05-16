# Bazy Danych i Zarządzanie Informacją

## Zestawy

### Zestaw 08 - Tworzenie i modyfikacja tabel

### Zadanie 1

```a)``` Napisz skrypt który tworzy strukturę bazy danych uwzględniającą następujące tabele:

- ```pracownicy```,
- ```stanowiska```,
- ```oddziały```,
- ```regiony```,
- ```klienci```,
- ```zamówienia```.

```b)``` W każdej z powyższych tabel uwzględnić tylko niezbędne kolumny, które będą służyć do przechowywania podstawowych danych np. tabela pracownicy może mieć atrybuty:
- ```nr```,
- ```imię```,
- ```nazwisko```,
- ```stanowisko```,
- ```oddział```,
- ```zarobki```,
- ```przełożony```.

```c)``` Napisz skrypt który w tabelach wprowadzi odpowiednie ```więzy integralności``` (ograniczenia) – ```klucze główne``` i ```obce```.

```d)``` Napisz skrypt który uzupełni dane w każdej tabeli.

### Rozwiązanie

```
set echo off

-- Utworzenie tabeli pracowników
CREATE TABLE pracownicy (
    nr                NUMBER(7)    CONSTRAINT pracownicy_nr_nn NOT NULL,
    imie              VARCHAR2(25) CONSTRAINT pracownicy_imie_nn NOT NULL,
    nazwisko          VARCHAR2(25) CONSTRAINT pracownicy_nazwisko_nn NOT NULL,
    nr_uzytkownika    VARCHAR2(8),
    rozpoczecie_pracy DATE,
    przelozony        NUMBER(7),
    stanowisko        VARCHAR2(25),
    oddzial           NUMBER(7),
    zarobki           NUMBER(11, 2),
    CONSTRAINT pracownicy_nr_pk PRIMARY KEY (nr),
    CONSTRAINT pracownicy_nr_uzytkownika_uk UNIQUE (nr_uzytkownika)
);

-- Wstawienie przykładowych pracowników
INSERT INTO pracownicy VALUES (
    1,
    'Tomasz',
    'Kowalski',
    'tkowalski',
    TO_DATE('23-MAY-2022', 'dd-mm-yyyy'),
    NULL,
    'Prezes',
    1,
    10000
);

INSERT INTO pracownicy VALUES (
    2,
    'Jan',
    'Kowalski',
    'jkowal',
    TO_DATE('20-JUN-2022', 'dd-mm-yyyy'),
    NULL,
    'Kierownik',
    2,
    3000
);

INSERT INTO pracownicy VALUES (
    3,
    'Anna',
    'Kowalska',
    'akowal',
    TO_DATE('2-FEB-2022', 'dd-mm-yyyy'),
    NULL,
    'Przedstawiciel Handlowy',
    3,
    6000
);
COMMIT;

-- Utworzenie tabeli stanowisk
CREATE TABLE stanowiska (
    stanowisko VARCHAR2(25),
        CONSTRAINT stanowiska_stanowisko_nn NOT NULL,
        CONSTRAINT stanowiska_stanowisko_pk PRIMARY KEY (stanowisko)
);

-- Wstawienie odpowiednich wartości do tabeli stanowisk
INSERT INTO stanowiska VALUES('Prezes');
INSERT INTO stanowiska VALUES('Przedstawiciel Handlowy');
INSERT INTO stanowiska VALUES('Urzednik Gieldowy');
INSERT INTO stanowiska VALUES('Wiceprezes, Administracja');
INSERT INTO stanowiska VALUES('Wiceprezes, Finanse');
INSERT INTO stanowiska VALUES('Wiceprezes, Operacje');
INSERT INTO stanowiska VALUES('Wiceprezes, Sprzedaż');
INSERT INTO stanowiska VALUES('Kierownik');
INSERT INTO stanowiska VALUES('Magazynier');
COMMIT;

-- Utworzenie tabeli oddziałów
Create Table oddzialy (
    nr         NUMBER(7),    CONSTRAINT oddzialy_nr_nn NOT NULL,
    nazwa      VARCHAR2(25), CONSTRAINT oddzialy_nazwa_nn NOT NULL,
    regiony_nr NUMBER(7),
    CONSTRAINT oddzialy_nr_pk PRIMARY KEY (nr),
    CONSTRAINT oddzialy_nazwa_regiony_nr_uk UNIQUE (nazwa, region_nr)
);

-- Wstawienie odpowiednich wartości do tabeli oddziałów
INSERT INTO oddzialy VALUES (1, 'Prezes', 1);
INSERT INTO oddzialy VALUES (2, 'Kierwonik', 1);
INSERT INTO oddzialy VALUES (1, 'Przedstawiciel Handlowy', 1);
COMMIT;

-- Utworzenie tabeli regionów
Create Table regiony (
    nr      NUMBER(7), CONSTRAINT regiony_nr_nn NOT NULL,
    nazwa   VARCHAR2(50),
    CONSTRAINT regiony_nazwa_nn NOT NULL,
        CONSTRAINT regiony_nr_PK PRIMARY KEY (nr),
        CONSTRAINT regiony_nazwa_uk UNIQUE (nazwa)
);

-- Wstawienie odpowiednich wartości do tabeli regionów
INSERT INTO regiony VALUES (1, 'Ameryka Polnocna');
INSERT INTO regiony VALUES (2, 'Ameryka Poludniowa');
INSERT INTO regiony VALUES (3, 'Afryka / Bliski Wschod');
INSERT INTO regiony VALUES (4, 'Azja');
INSERT INTO regiony VALUES (5, 'Europa');
COMMIT;

-- Utworzenie tabeli klientów
Create Table klienci (
    nr                 NUMBER(7),    CONSTRAINT klienci_nr_nn NOT NULL,
    nazwa              VARCHAR2(50), CONSTRAINT klienci_nazwa_nn NOT NULL,
    telefon            VARCHAR2(25),
    adres              VARCHAR2(400),
    miasto             VARCHAR2(30),
    wojewodztwo        VARCHAR2(30),
    kraj               VARCHAR2(30),
    kod_pocztowy       VARCHAR2(75),
    zdolnosc_kredytowa VARCHAR(7),
    nr_sprzedawcy      NUMBER(7),
    nr_regionu         NUMBER(7),
        CONSTRAINT klienci_nr_pk PRIMARY KEY (nr),
        CONSTRAINT klienci_zdolnosc_kredytowa_ck
            CHECK (zdolnosc_kredytowa IN ('SWIETNA', 'DOBRA', 'ZLA'))
);

-- Wstawienie odpowiednich wartości do tabeli klientów
INSERT INTO klienci VALUES (
   201, 'Unisports', '55-2066101',
   '72 Via Bahia', 'Sao Paolo', NULL, 'Brazil', NULL,
   'SWIETNA', 12, 2);
INSERT INTO klienci VALUES (
   202, 'OJ Atheletics', '81-20101',
   '6741 Takashi Blvd.', 'Osaka', NULL, 'Japan', NULL,
   'ZLA', 14, 4);
INSERT INTO klienci VALUES (
   203, 'Delhi Sports', '91-10351',
   '11368 Chanakya', 'New Delhi', NULL, 'India', NULL,
   'DOBRA', 14, 4);
COMMIT;

-- Utworzenie tabeli zamówień
Create Table zamowienia (
    id                  NUMBER(7), CONSTRAINT zamowienia_id_nn NOT NULL,
    nr_klienta          NUMBER(7), CONSTRAINT zamowiena_klienci_id_nn NOT NULL,
    data_zlozenia       DATE,
    data_wyslania       DATE,
    nr_sprzedawcy       NUMBER(7),
    cena                NUMBER(11, 2),
    typ_zaplaty         VARCHAR2(7),
    wypelnienie_wniosku VARCHAR2(1),
        CONSTRAINT zamowienia_nr_pk PRIMARY KEY (nr),
        CONSTRAINT zamowienia_typ_zaplaty_ck
            CHECK (typ_zaplaty in ('KARTA', 'GOTOWKA')),
        CONSTRAINT zamowienia_wypelnienie_wniosku_ck
            CHECK (wypelnienie_wniosku in ('T', 'N'))
);

-- Wstawienie odpowiednich wartości do tabeli zamówień
INSERT INTO zamowienia VALUES (
   1, 204, '31-AUG-2021', '10-SEP-2021',
   11, 601100, 'KARTA', 'T');
INSERT INTO zamowienia VALUES (
   2, 205, '31-AUG-2021', '15-SEP-2021',
   14, 8056.6, 'KARTA', 'F');
INSERT INTO zamowienia VALUES (
   3, 206, '01-SEP-2021', '08-SEP-2021',
   15, 8335, 'GOTOWKA', 'T');
COMMIT;

-- Utworzenie odpowiednich więzów integralności
ALTER TABLE oddzialy
    ADD CONSTRAINT pracownicy_region_nr_fk
    FOREIGN KEY (regiony_nr) REFERENCES regiony (nr); 
ALTER TABLE pracownicy
    ADD CONSTRAINT pracownicy_przelozony_nr_fk
    FOREIGN KEY (przelozony_nr) REFERENCES pracownicy (nr);
ALTER TABLE pracownicy
    ADD CONSTRAINT pracownicy_oddzial_nr_fk
    FOREIGN KEY (oddzialy_nr) REFERENCES oddzialy (nr);
ALTER TABLE pracownicy
    ADD CONSTRAINT pracownicy_stanowisko_fk
    FOREIGN KEY (stanowisko) REFERENCES stanowisko (stanowiska);
ALTER TABLE klienci
    ADD CONSTRAINT nr_sprzedawcy_fk
    FOREIGN KEY (nr_sprzedawcy) REFERENCES pracownicy (nr);
ALTER TABLE klienci
    ADD CONSTRAINT klienci_nr_regionu_fk
    FOREIGN KEY (regiony_nr) REFERENCES regiony (nr);
ALTER TABLE zamowienia
    ADD CONSTRAINT zamowienia_nr_klienta_fk
    FOREIGN KEY (nr_klienta) REFERENCES klienci (nr);
ALTER TABLE zamowienia
    ADD CONSTRAINT zamowienia_nr_sprzedawcy_fk
    FOREIGN KEY (nr_sprzedawcy) REFERENCES pracownicy (nr);

set echo on
```

### Zadanie 2

```a) ``` Napisz skrypt który doda do ```klienci``` kolumnę umożliwiającą przechowywanie adresu email.

```b) ``` Napisz skrypt który zmodyfikuję tabelę ```zamówienia``` w taki sposób, aby można było przechowywać informację o tym, czy dane zgłoszenie jest zrealizowane.

```c) ``` Napisz skrypt który doda kolumnę umożliwiającą przechowywanie informacji o dacie (i godzinie) zrealizowania zamówienia.

```d) ``` Napisz skrypt który wyświetli jakie zmiany należy wprowadzić do tabeli ```zamówienia```, żeby można było przechowywać informacje o statusie realizacji zamówienia, np:
- ```Nowe zamówienie```, 
- ```Realizowane```,
- ```Przesyłka wysłana```,
- ```Zakończone```.

```e) ``` Napisz skrypt który nową tabelę ```statusy``` tak, żeby odpowiednia kolumna utworzona w poprzednim zadaniu miała ```ograniczenie klucza obcego```.

### Rozwiązanie

```
set echo off

-- Utworzenie tabeli pracowników
CREATE TABLE pracownicy (
    nr                NUMBER(7)    CONSTRAINT pracownicy_nr_nn NOT NULL,
    imie              VARCHAR2(25) CONSTRAINT pracownicy_imie_nn NOT NULL,
    nazwisko          VARCHAR2(25) CONSTRAINT pracownicy_nazwisko_nn NOT NULL,
    nr_uzytkownika    VARCHAR2(8),
    rozpoczecie_pracy DATE,
    przelozony        NUMBER(7),
    stanowisko        VARCHAR2(25),
    oddzial           NUMBER(7),
    zarobki           NUMBER(11, 2),
    CONSTRAINT pracownicy_nr_pk PRIMARY KEY (nr),
    CONSTRAINT pracownicy_nr_uzytkownika_uk UNIQUE (nr_uzytkownika)
);

-- Wstawienie przykładowych pracowników
INSERT INTO pracownicy VALUES (
    1,
    'Tomasz',
    'Kowalski',
    'tkowalski',
    TO_DATE('23-MAY-2022', 'dd-mm-yyyy'),
    NULL,
    'Prezes',
    1,
    10000
);

INSERT INTO pracownicy VALUES (
    2,
    'Jan',
    'Kowalski',
    'jkowal',
    TO_DATE('20-JUN-2022', 'dd-mm-yyyy'),
    NULL,
    'Kierownik',
    2,
    3000
);

INSERT INTO pracownicy VALUES (
    3,
    'Anna',
    'Kowalska',
    'akowal',
    TO_DATE('2-FEB-2022', 'dd-mm-yyyy'),
    NULL,
    'Przedstawiciel Handlowy',
    3,
    6000
);
COMMIT;

-- Utworzenie tabeli stanowisk
CREATE TABLE stanowiska (
    stanowisko VARCHAR2(25),
        CONSTRAINT stanowiska_stanowisko_nn NOT NULL,
        CONSTRAINT stanowiska_stanowisko_pk PRIMARY KEY (stanowisko)
);

-- Wstawienie odpowiednich wartości do tabeli stanowisk
INSERT INTO stanowiska VALUES('Prezes');
INSERT INTO stanowiska VALUES('Przedstawiciel Handlowy');
INSERT INTO stanowiska VALUES('Urzednik Gieldowy');
INSERT INTO stanowiska VALUES('Wiceprezes, Administracja');
INSERT INTO stanowiska VALUES('Wiceprezes, Finanse');
INSERT INTO stanowiska VALUES('Wiceprezes, Operacje');
INSERT INTO stanowiska VALUES('Wiceprezes, Sprzedaż');
INSERT INTO stanowiska VALUES('Kierownik');
INSERT INTO stanowiska VALUES('Magazynier');
COMMIT;

-- Utworzenie tabeli oddziałów
Create Table oddzialy (
    nr         NUMBER(7),    CONSTRAINT oddzialy_nr_nn NOT NULL,
    nazwa      VARCHAR2(25), CONSTRAINT oddzialy_nazwa_nn NOT NULL,
    regiony_nr NUMBER(7),
    CONSTRAINT oddzialy_nr_pk PRIMARY KEY (nr),
    CONSTRAINT oddzialy_nazwa_regiony_nr_uk UNIQUE (nazwa, region_nr)
);

-- Wstawienie odpowiednich wartości do tabeli oddziałów
INSERT INTO oddzialy VALUES (1, 'Prezes', 1);
INSERT INTO oddzialy VALUES (2, 'Kierwonik', 1);
INSERT INTO oddzialy VALUES (1, 'Przedstawiciel Handlowy', 1);
COMMIT;

-- Utworzenie tabeli regionów
Create Table regiony (
    nr      NUMBER(7), CONSTRAINT regiony_nr_nn NOT NULL,
    nazwa   VARCHAR2(50),
    CONSTRAINT regiony_nazwa_nn NOT NULL,
        CONSTRAINT regiony_nr_PK PRIMARY KEY (nr),
        CONSTRAINT regiony_nazwa_uk UNIQUE (nazwa)
);

-- Wstawienie odpowiednich wartości do tabeli regionów
INSERT INTO regiony VALUES (1, 'Ameryka Polnocna');
INSERT INTO regiony VALUES (2, 'Ameryka Poludniowa');
INSERT INTO regiony VALUES (3, 'Afryka / Bliski Wschod');
INSERT INTO regiony VALUES (4, 'Azja');
INSERT INTO regiony VALUES (5, 'Europa');
COMMIT;

-- Utworzenie tabeli klientów
Create Table klienci (
    nr                 NUMBER(7),    CONSTRAINT klienci_nr_nn NOT NULL,
    nazwa              VARCHAR2(50), CONSTRAINT klienci_nazwa_nn NOT NULL,
    telefon            VARCHAR2(25),
    adres              VARCHAR2(400),
    miasto             VARCHAR2(30),
    wojewodztwo        VARCHAR2(30),
    kraj               VARCHAR2(30),
    kod_pocztowy       VARCHAR2(75),
    zdolnosc_kredytowa VARCHAR(7),
    nr_sprzedawcy      NUMBER(7),
    nr_regionu         NUMBER(7),
        CONSTRAINT klienci_nr_pk PRIMARY KEY (nr),
        CONSTRAINT klienci_zdolnosc_kredytowa_ck
            CHECK (zdolnosc_kredytowa IN ('SWIETNA', 'DOBRA', 'ZLA'))
);

-- Wstawienie odpowiednich wartości do tabeli klientów
INSERT INTO klienci VALUES (
   201, 'Unisports', '55-2066101',
   '72 Via Bahia', 'Sao Paolo', NULL, 'Brazil', NULL,
   'SWIETNA', 12, 2);
INSERT INTO klienci VALUES (
   202, 'OJ Atheletics', '81-20101',
   '6741 Takashi Blvd.', 'Osaka', NULL, 'Japan', NULL,
   'ZLA', 14, 4);
INSERT INTO klienci VALUES (
   203, 'Delhi Sports', '91-10351',
   '11368 Chanakya', 'New Delhi', NULL, 'India', NULL,
   'DOBRA', 14, 4);
COMMIT;

-- Utworzenie tabeli zamówień
Create Table zamowienia (
    id                  NUMBER(7), CONSTRAINT zamowienia_id_nn NOT NULL,
    nr_klienta          NUMBER(7), CONSTRAINT zamowiena_klienci_id_nn NOT NULL,
    data_zlozenia       DATE,
    data_wyslania       DATE,
    nr_sprzedawcy       NUMBER(7),
    cena                NUMBER(11, 2),
    typ_zaplaty         VARCHAR2(7),
wypelnienie_wniosku VARCHAR2(1),
    CONSTRAINT zamowienia_nr_pk PRIMARY KEY (nr),
    CONSTRAINT zamowienia_typ_zaplaty_ck
        CHECK (typ_zaplaty in ('KARTA', 'GOTOWKA')),
    CONSTRAINT zamowienia_wypelnienie_wniosku_ck
        CHECK (wypelnienie_wniosku in ('T', 'N'))
    CONSTRAINT zamowienia_status_zamowienia_ck
        CHECK (status_zamowienia in ('Oczekuje do realizacji', 'Realizowane', 'Przesylka wyslana', 'Zakonczone'))
);

-- Wstawienie odpowiednich wartości do tabeli zamówień
INSERT INTO zamowienia VALUES (
   1, 204, '31-AUG-2021', '10-SEP-2021',
   11, 601100, 'KARTA', 'T');
INSERT INTO zamowienia VALUES (
   2, 205, '31-AUG-2021', '15-SEP-2021',
   14, 8056.6, 'KARTA', 'F');
INSERT INTO zamowienia VALUES (
   3, 206, '01-SEP-2021', '08-SEP-2021',
   15, 8335, 'GOTOWKA', 'T');
COMMIT;

-- Utworzenie tabeli statusów
CREATE TABLE statusy (
    status VARCHAR2(25),
        CONSTRANT statusy_status_nn NOT NULL,
            CONSTRANT statusy_status_pk PRIMARY KEY (status)
);

-- Utworzenie odpowiednich więzów integralności
ALTER TABLE oddzialy
    ADD CONSTRAINT pracownicy_region_nr_fk
    FOREIGN KEY (regiony_nr) REFERENCES regiony (nr); 
ALTER TABLE pracownicy
    ADD CONSTRAINT pracownicy_przelozony_nr_fk
    FOREIGN KEY (przelozony_nr) REFERENCES pracownicy (nr);
ALTER TABLE pracownicy
    ADD CONSTRAINT pracownicy_oddzial_nr_fk
    FOREIGN KEY (oddzialy_nr) REFERENCES oddzialy (nr);
ALTER TABLE pracownicy
    ADD CONSTRAINT pracownicy_stanowisko_fk
    FOREIGN KEY (stanowisko) REFERENCES stanowisko (stanowiska);
ALTER TABLE klienci
    ADD CONSTRAINT nr_sprzedawcy_fk
    FOREIGN KEY (nr_sprzedawcy) REFERENCES pracownicy (nr);
ALTER TABLE klienci
    ADD CONSTRAINT klienci_nr_regionu_fk
    FOREIGN KEY (regiony_nr) REFERENCES regiony (nr);
ALTER TABLE zamowienia
    ADD CONSTRAINT zamowienia_nr_klienta_fk
    FOREIGN KEY (nr_klienta) REFERENCES klienci (nr);
ALTER TABLE zamowienia
    ADD CONSTRAINT zamowienia_nr_sprzedawcy_fk
    FOREIGN KEY (nr_sprzedawcy) REFERENCES pracownicy (nr);

set echo on
```
