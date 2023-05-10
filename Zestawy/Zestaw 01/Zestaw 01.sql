-- Zadanie 1
SELECT
    *
FROM
    dept

-- Zadanie 2
SELECT
    dept_id    "ID Departamentu",
    last_name  "Nazwisko",
    manager_id "ID Menadzera"
FROM
    emp

-- Zadanie 3
SELECT
    (salary * 12) "Roczne Dochody",
    last_name     "Nazwisko"
FROM
    emp

-- Zadanie 4
SELECT
    first_name "Imie",
    last_name  "Nazwisko",
    salary     "Zarobki miesieczne",
    ((salary * 12) + 1000) "Zarobki Roczne z Premia"
FROM
    emp

-- Zadanie 5
SELECT
    first_name      "Imie",
    last_name       "Nazwisko",
    (salary * 1.08) "Zarobki Miesieczne",
    ((salary * 1.08) * 12) "Zarobki Roczne"
FROM
    emp

-- Zadanie 6
SELECT
    last_name "Nazwisko",
    ((salary * 12) + (salary * 0.05)) "Roczny Dochod"
FROM
    emp

-- Zadanie 7
SELECT
    ((first_name || ' '||last_name)) "Imie i nazwisko"
FROM
    emp

-- Zadanie 8
SELECT
    ((first_name || ' '||last_name || ' - ' || title)) "Super Pracownicy"
FROM
    emp

-- Zadanie 9
SELECT
    last_name "Nazwisko",
    salary    "Pensja",
    title     "Stanowisko",
    (salary * commission_pct / 100) "Prowizja"
FROM
    emp

-- Zadanie 10
SELECT
    last_name "Nazwisko",
    salary    "Pensja",
    title     "Stanowisko",
    NVL(salary * commission_pct / 100, 0) "Prowizja"
FROM
    emp

-- Zadanie 11
SELECT
    DISTINCT name "Nazwy"
FROM
    dept

-- Zadanie 12
SELECT
    last_name  "Nazwisko",
    dept_id    "ID Departamentu",
    start_date "Data Zatrudnienia"
FROM
    emp
ORDER BY
    dept_id,
    salary DESC

-- Zadanie 13
SELECT
    last_name  "Nazwisko",
    dept_id    "ID Depatramentu",
    start_date "Data Zatrudnienia"
FROM
    emp
ORDER BY
    start_date ASC

-- Zadanie 14
SELECT
    first_name "Imie",
    last_name  "Nazwisko",
    title      "Stanowisko"
FROM
    emp
WHERE
    last_name='Patel'

-- Zadanie 15
SELECT
    last_name  "Nazwisko",
    start_date "Data Zatrudnienia"
FROM
    emp
WHERE
    start_date >= to_date('02-may-1991', 'dd-mm-yyyy')
    AND start_date <= ('15-june-1991', 'dd-mm-yyyy');

-- Zadanie 16
SELECT
    id        "ID",
    name      "Nazwa",
    region_id "ID Regionu"
FROM
    dept
WHERE
    region_id = 1
    OR region_id = 3;

-- Zadanie 17
SELECT
    * "Nazwiska Na Litere `M`"
FROM
    emp
WHERE
    last_name LIKE 'M%';

-- Zadanie 18
SELECT
    * "Nazwiska Bez `A`"
FROM
    emp
WHERE
    last_name NOT LIKE '%a%';

-- Zadanie 19
SELECT
    last_name  "Nazwisko",
    start_date "Data Zatrudnienia"
FROM
    emp
WHERE
    start_date LIKE '%%-%%-1991';

-- Zadanie 20
SELECT
    last_name "Nazwiska"
FROM
    emp
WHERE
    last_name LIKE '_a%';

-- Zadanie 21
SELECT
    name "Nazwy Firm"
FROM
    customer
WHERE
    name LIKE '%s_o%';
