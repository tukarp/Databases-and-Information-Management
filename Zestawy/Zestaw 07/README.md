# Bazy Danych i Zarządzanie Informacją

## Zestaw 07 - Modyfikacja bazy danych

### Zadanie 1

Napisz definicję poleceń:

- ```COMMIT```,
- ```ROLLBACK```,
- ```SAVEPOINT```.

### Rozwiązanie

```
COMMIT - komenda służąca do zatwierdzenia zmian w bazie danych,
ROLLBACK - komenda służąca do cofnięcia niezatwierdzonych komendą COMMIT zmian,
SAVEPOINT - komenda służąca do utowrzenia punktu kontrolnego który możemy wykorzystać do bardziej precyzyjnego wywoływania zmian.
```

### Zadanie 2

Napisz skrypt który wyłączy automatyczne zapisywanie zmian.

### Rozwiązanie

```
SET AUTOCOMMIT OFF
```

### Zadanie 3

Napisz skrypt który wstawi do tabeli ```emp``` nowego pracownika.

### Rozwiązanie

```
INSERT INTO EMP (ID, FIRST_NAME, LAST_NAME) VALUES(26, 'Jakub', 'Kowalski');
```

### Zadanie 4

Napisz skrypt który wstawi do tabeli ```emp``` kolejnego pracownika. Sprawdź poleceniem ```SELECT```, czy dane zostały wprowadzone, a następnie wykonaj polecenie ```ROLLBACK``` i jeszcze raz sprawdź tabelę ```emp```.

### Rozwiązanie

```
-- Wstaw pracownika do tabeli emp
INSERT INTO EMP (ID, FIRST_NAME, LAST_NAME, START_DATE, SALARY) VALUES(27, 'Jan', 'Kowalski', '01/01/95', 1000);

-- Wyświetl pracowników i ich dane
SELECT
    *
FROM
    emp;

-- Cofnij niezapisane zmiany
ROLLBACK;

-- Wyświetl pracowników i ich dane
SELECT
    *
FROM
    emp;
```

### Zadanie 5

Napisz skrypt który wstawi do tabeli ```emp``` nowego pracownika.

### Rozwiązanie

```
-- Wstaw pracownika do tabeli emp
INSERT INTO EMP (ID, FIRST_NAME, LAST_NAME, START_DATE, SALARY) VALUES(27, 'Jan', 'Kowalski', '01/01/95', 1000);

-- Zapisz wprowadzone zmiany
COMMIT;
```

### Zadanie 6

Napisz skrypt który wykona następujące czynności:

- ```a)``` Podniesię cenę wszystkich produktów o ```15%```,
- ```b)``` Stworzy pierwszy punkt kontrolny nazywając go ```S1```,
- ```c)``` Wyświetli sumę cen wszystkich produktów,
- ```d)``` Podniesię cenę o ```10%```,
- ```e)``` Stworzy drugi punkt kontrolny ```S2```,
- ```f)``` Wyświetlić sumę cen wszystkich produktów,
- ```g)``` Podniesię cenę o ```60%```,
- ```h)``` Wyświetli sumę cen wszystkich produktów,
- ```i)``` Wycofa zmiany do drugiego punktu kontrolnego (```S2```),
- ```j)``` Wyświetli sumę cen wszystkich produktów,
- ```k)``` Wycofa zmiany do pierwszego punktu kontrolnego (```S1```),
- ```l)``` Wyświetli sumę cen wszystkich produktów,
- ```m)``` Wykona polecenie ```COMMIT```.

### Rozwiązanie

```
-- Zadanie 6a
UPDATE
    item
SET
    price = price * 1.15;

-- Zadanie 6b
SAVEPOINT S1;

-- Zadanie 6c
SELECT
    SUM(price) 'Suma Cen Produktow'
FROM
    item;

-- Zadanie 6d
UPDATE
    item
SET
    price = price * 1.1

-- Zadanie 6e
SAVEPOINT S2;

-- Zadanie 6f
SELECT
    SUM(price) 'Suma Cen Produktow'
FROM
    item;

-- Zadanie 6g
UPDATE
    item
SET
    price = price * 1.6;

-- Zadanie 6h
SELECT
    SUM(price) 'Suma Cen Produktow'
FROM
    item;

-- Zadanie 6i
ROLLBACK TO SAVEPOINT S2;

-- Zadanie 6j
SELECT
    SUM(price) 'Suma Cen Produktow'
FROM
    item;

-- Zadanie 6k
ROLLBACK TO SAVEPOINT S1;

-- Zadanie 6l
SELECT
    SUM(price) 'Suma Cen Produktow'
FROM
    item;

-- Zadanie 6m
COMMIT
```

### Zadanie 7

Napisz skrypt który włączy polecenie ```AUTOCOMMIT``` w konsoli ```SQL```.

### Rozwiązanie

```
SET AUTOCOMMIT ON;
```

### Zadanie 8

Napisz skrypt który stworzy tabelę ```region_copy```, a następnie przekopiuję wszystkie dane z tabeli ```region``` do tabeli ```region_copy```.

### Rozwiązanie

```
CREATE TABLE
    region_copy AS
SELECT
    *
FROM
    region;
```

### Zadanie 9

Napisz skrypt który wstawi do tabeli ```dept``` kopie wszystkich istniejących danych z tej tabeli.

### Rozwiązanie

```
INSERT INTO
    dept
SELECT
    id + 100           'ID + 100', 
    SUBSTR(name, 0, 4) 'Podlancuch Znakow Nazw',
    region_id          'Kopia Regionu'
FROM
    dept;
```

### Zadanie 10

Napisz skrypt który uzupełni w tabeli ```region_copy``` kolumnę name nazwami tych klientów, których maksymalne zamówienie było wyższe niż ```1000```.

### Rozwiązanie

```
INSERT INTO
    region_copy
SELECT
    customer_id 'ID Klienta',
    name        'Nazwa Klienta'
FROM
    customer, ord
WHERE
    ord.customer_id = customer_id
GROUP BY
    customer_id,
    name
HAVING
    MAX(total) > 1000;
```

### Zadanie 11

Napisz skrypt który podniesię własną pensję o ```300%```, a datę zatrudnienia ustawi na ```31 grudnia 2001 rok```. 

### Rozwiązanie

```
UPDATE
    emp
SET
    salary = salary * 4,
    start_date = TO_DATE('31-12-2001', 'dd-mm-yyyy')
WHERE
    id = 27;
```

### Zadanie 12

Napisz skrypt który zmodyfikuję tabelę ```product```:
- ```a)``` Zmniejszy ceny o ```10%``` tych produktów, których sprzedano mniej niż ```30``` sztuk,
- ```b)``` Zwiększy ceny o ```8%``` pięciu najlepiej sprzedających się produktów

### Rozwiązanie

```
-- Zadanie 12a
UPDATE product
SET 
    suggested_whlsl_price = suggested_whlsl_price * 0.9
WHERE
    id
IN (SELECT
        product_id 'ID Produktu'
    FROM
        item
    GROUP BY
        product_id
    HAVING SUM(quantity) < 30);

-- Zadanie 12b
UPDATE product
SET 
    suggested_whlsl_price = suggested_whlsl_price * 1.08
WHERE
    id
IN (SELECT
        product_id    'ID Produktu',
        SUM(quantity) 'Suma Ilosci Produktu'
    FROM
        item
    GROUP BY
        product_id
    ORDER BY
        SUM(quantity) DESC)
WHERE
    ROWNUM <= 5
```

### Zadanie 13

Napisz skrypt który podniesię zarobki wszystkim ```vice-dyrektorom``` o ```30%```.

### Rozwiązanie

```
UPDATE emp
SET
    salary = salary * 1.3
WHERE
    title LIKE 'VP%';
```

### Zadanie 14

Napisz skrypt który usunię z tabeli ```emp``` wstawionych w tej sesji pracowników. 

### Rozwiązanie

```
DELETE FROM
    emp
WHERE
    id = 27
    OR id = 26;
```

### Zadanie 15

Napisz skrypt który skasuję tabelę ```region_copy```.

### Rozwiązanie

```
DROP TABLE region_copy;
```
