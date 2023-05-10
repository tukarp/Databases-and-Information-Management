-- Zadanie 1
SELECT 
    MAX(salary)       "Maksymalna",
    MIN(salary)       "Minimalna",
    AVG(salary)       "Srednia",
    SUM(salary)       "Suma",
    COUNT(first_name) "Liczba Pracownikow"
FROM 
    emp;

-- Zadanie 2
SELECT 
    MIN(last_name) "Pierwsze Nazwisko", 
    MAX(last_name) "Ostatnie Nazwisko" 
FROM 
    emp;

-- Zadanie 3
SELECT 
    COUNT(first_name) "Liczba Pracownikow" 
FROM 
    emp 
WHERE 
    dept_id = 31 
    AND commission_pct IS NOT NULL;

-- Zadanie 4
SELECT 
    credit_rating        "Zdolnosc Kredytowa",
    COUNT(credit_rating) "Liczba Klientow"
FROM
    customer
GROUP BY
    credit_rating;

-- Zadanie 5
SELECT 
    title       "Stanowisko",
    SUM(salary) "Zarobki"
FROM
    emp
WHERE
    title NOT LIKE 'VP%'
GROUP BY
    title
ORDER BY
    SUM(salary) ASC;

-- Zadanie 6
SELECT 
    title       "Stanowisko",
    MAX(salary) "Maksymalne Zarobki"
FROM 
    emp
GROUP BY
    title;

-- Zadanie 7
SELECT
    dept_id     "Numer Oddzialu",
    AVG(salary) "Srednie Zarobki"
FROM
    emp
HAVING
    AVG(salary) > 1450
GROUP BY
    dept_id;

-- Zadanie 8
SELECT
    last_name "Nazwisko"
FROM
    emp
HAVING 
    (COUNT(last_name)) > 1
GROUP BY
    last_name;

-- Zadanie 9
SELECT 
    region_id "ID Regionu",
    name      "Nazwa"
FROM
    dept

UNION

SELECT 
    id   "ID Regionu",
    name "Nazwa"
FROM
    region
ORDER BY
    2;

-- Zadanie 10
SELECT
    name "Nazwa"
FROM
    dept

UNION

SELECT
    name "Nazwa"
FROM
    region
GROUP BY
    name;

-- Zadanie 11
SELECT
    name "Nazwa"
FROM
    dept

UNION ALL

SELECT
    name "Nazwa"
FROM
    region;

-- Zadanie 12
SELECT
    dept_id   "NR DEP / REG",
    last_name "Naziwsko / Nazwa"
FROM 
    emp

UNION

SELECT
    id,
    name "Nazwa"
FROM
    region
ORDER BY
    2;

-- Zadanie 13
SELECT
    id "ID Klienta"
FROM
    customer

INTERSECT

SELECT
    customer_id "ID Klienta"
FROM
    ord;

-- Zadanie 14
SELECT
    id "ID Klienta"
FROM
    customer

MINUS

SELECT
    customer_id "ID Klienta"
FROM
    ord;
