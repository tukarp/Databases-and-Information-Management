-- Zestaw 07 - Modyfikacja bazy danych
-- Zadanie 1
-- COMMIT - komenda służąca do zatwierdzenia zmian w bazie danych,
-- ROLLBACK - komenda służąca do cofnięcia niezatwierdzonych komendą COMMIT zmian,
-- SAVEPOINT - komenda służąca do utowrzenia punktu kontrolnego który możemy wykorzystać do bardziej precyzyjnego wywoływania zmian.

-- Zadanie 2
SET AUTOCOMMIT OFF

-- Zadanie 3
INSERT INTO EMP (ID, FIRST_NAME, LAST_NAME) VALUES(26, 'Jakub', 'Kowalski');

-- Zadanie 4
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

-- Zadanie 5
-- Wstaw pracownika do tabeli emp
INSERT INTO EMP (ID, FIRST_NAME, LAST_NAME, START_DATE, SALARY) VALUES(27, 'Jan', 'Kowalski', '01/01/95', 1000);

-- Zapisz wprowadzone zmiany
COMMIT;

-- Zadanie 6
-- Zadanie 6a
UPDATE
    item
SET
    price = price * 1.15;

-- Zadanie 6b
SAVEPOINT S1;

-- Zadanie 6c
SELECT
    SUM(price) "Suma Cen Produktow"
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
    SUM(price) "Suma Cen Produktow"
FROM
    item;

-- Zadanie 6g
UPDATE
    item
SET
    price = price * 1.6;

-- Zadanie 6h
SELECT
    SUM(price) "Suma Cen Produktow"
FROM
    item;

-- Zadanie 6i
ROLLBACK TO SAVEPOINT S2;

-- Zadanie 6j
SELECT
    SUM(price) "Suma Cen Produktow"
FROM
    item;

-- Zadanie 6k
ROLLBACK TO SAVEPOINT S1;

-- Zadanie 6l
SELECT
    SUM(price) "Suma Cen Produktow"
FROM
    item;

-- Zadanie 6m
COMMIT

-- Zadanie 7
SET AUTOCOMMIT ON;

-- Zadanie 8
CREATE TABLE
    region_copy AS
SELECT
    *
FROM
    region;

-- Zadanie 9
INSERT INTO
    dept
SELECT
    id + 100           "ID + 100", 
    SUBSTR(name, 0, 4) "Podlancuch Znakow Nazw",
    region_id          "Kopia Regionu"
FROM
    dept;

-- Zadanie 10
INSERT INTO
    region_copy
SELECT
    customer_id "ID Klienta",
    name        "Nazwa Klienta"
FROM
    customer, ord
WHERE
    ord.customer_id = customer_id
GROUP BY
    customer_id,
    name
HAVING
    MAX(total) > 1000;

-- Zadanie 11
UPDATE
    emp
SET
    salary = salary * 4,
    start_date = TO_DATE('31-12-2001', 'dd-mm-yyyy')
WHERE
    id = 27;

-- Zadanie 12
-- Zadanie 12a
UPDATE product
SET 
    suggested_whlsl_price = suggested_whlsl_price * 0.9
WHERE
    id
IN (SELECT
        product_id "ID Produktu"
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
        product_id    "ID Produktu",
        SUM(quantity) "Suma Ilosci Produktu"
    FROM
        item
    GROUP BY
        product_id
    ORDER BY
        SUM(quantity) DESC)
WHERE
    ROWNUM <= 5

-- Zadanie 13
UPDATE emp
SET
    salary = salary * 1.3
WHERE
    title LIKE 'VP%';

-- Zadanie 14
DELETE FROM
    emp
WHERE
    id = 27
    OR id = 26;

-- Zadanie 15
DROP TABLE region_copy;
