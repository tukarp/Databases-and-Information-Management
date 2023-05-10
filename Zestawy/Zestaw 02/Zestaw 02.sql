-- Zadanie 1
SELECT
    LOWER(first_name) "Imie",
    LOWER(last_name)  "Nazwisko",
    INITCAP(userid)   "Identyfikator",
    UPPER(title)      "Stanowisko"
FROM
    emp
WHERE
    title LIKE 'VP%';

-- Zadanie 2
SELECT
    first_name "Imie",
    last_name  "Nazwisko"
FROM
    emp
WHERE
    LOWER(last_name) = LOWER('PATEL');

-- Zadanie 3
SELECT
    ((name || ' - ' || country )) "Nazwa i Panstwo"
FROM
    customer
WHERE
    credit_rating = 'GOOD';

-- Zadanie 4
SELECT
    name         "Nazwa",
    LENGTH(name) "Liczba Znakow"
FROM
    product
WHERE
    name LIKE 'Ace%';

-- Zadanie 5
SELECT 
    ROUND(41.5843, 2)  "Setne",
    ROUND(41.5843, 0)  "Calkowite",
    ROUND(41.5843, -1) "Dziesiatki"
FROM
    dual;

-- Zadanie 6
SELECT
    ROUND(41.5843, 2)  "Setne",
    FLOOR(41.5843)     "Calkowite",
    ROUND(41.5843, -1) "Dziesiatki"
FROM
    dual;

-- Zadanie 7
SELECT
    last_name                   "Nazwisko",
    MOD(salary, commission_pct) "Reszta"
FROM
    emp
WHERE
    salary > 1380;

-- Zadanie 7a
SELECT
    last_name "Nazwisko",
    MOD(salary, commission_pct) "Reszta"
FROM
    emp
WHERE
    salary > 1380
    AND commission_pct IS NOT NULL;

-- Zadanie 8
SELECT
    sysdate "Aktualna Data"
FROM
    dual

-- Zadanie 9
SELECT
    last_name "Nazwisko",
    ROUND((TRUNC((sysdate - start_date), 0)/7),0) "Liczba Tygodni W Firmie"
FROM
    emp
WHERE
    dept_id = 43;

-- Zadanie 10
SELECT
    id "ID", 
    TRUNC((months_between(sysdate, start_date)), 0) "Liczba Miesiecy",
    add_months(start_date, 3) "Po Stazu"
FROM
    emp
WHERE
    months_between(sysdate, start_date) < 368;

-- Zadanie 11
SELECT
    product_id                "Produkt",
    restock_date              "Dostawa",
    next_day(restock_date, 5) "Piatek Po Dostawie",
    last_day(restock_date)    "Ostatni Dzien Miesiaca"
FROM
    inventory
WHERE
    restock_date IS NOT NULL
ORDER BY
    restock_date ASC;

-- Zadanie 12
SELECT
    id "ID",
    start_date "Data",
    extract(month from start_date) "Miesiac"
FROM
    emp
WHERE
    EXTRACT(year from start_date) = 1991;

-- Zadanie 13
SELECT
    id "ID",
    TO_CHAR(date_ordered, 'mm/rr') "MM/RR"
FROM
    ord
WHERE
    sales_rep_id = 11;

-- Zadanie 14
SELECT
    last_name "Nazwisko",
    TO_CHAR(start_date, 'dd Month YYYY') "Data"
FROM
    emp
WHERE
    EXTRACT(year from start_date) >= 1991;
