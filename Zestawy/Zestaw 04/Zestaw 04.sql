-- Zestaw 04 - Zlaczenia tabel
-- Zlaczenia rownosciowe
-- Zadanie 1
SELECT
    emp.first_name "Imie",
    emp.last_name  "Nazwisko",
    emp.dept_id    "NR",
    dept.name      "Nazwa"
FROM
    emp,
    dept;

-- Zadanie 2
SELECT
    dept.id     "NR",
    region.id   "NR Regionu",
    region.name "Nazwa Regionu"
FROM
    dept,
    region
WHERE
    region.id = dept.region_id;

-- Zadanie 3
SELECT
    emp.last_name  "Nazwisko",
    emp.first_name "Imie",
    dept.id        "Nr",
    dept.name      "Nazwa"
FROM
    emp,
    dept
WHERE
    emp.last_name = 'Menchu'
    AND emp.dept_id = dept.id;

-- Zadanie 4
SELECT
    emp.last_name      "Nazwisko",
    region.name        "Nazwa",
    emp.commission_pct "Prowizja"
FROM
    emp,
    dept
WHERE
    emp.dept_id = dept.id
    AND emp.commission_pct IS NOT NULL;

-- Zadanie 5
SELECT
    customer.name                         "Nazwa klienta",
    emp.last_name                         "Nazwisko",
    TO_CHAR(ord.date_ordered, 'YY/MM/DD') "Data zamowienia",
    item.quantity_shipped                 "Liczba",
    product.name                          "Nazwa produktu"
FROM
    customer,
    product,
    ord,
    item,
    emp
WHERE
    ord.id = 101
    AND ord.sales_rep_id = emp.id
    AND customer.id = ord.customer_id
    AND ord.id = item.ord_id
    AND item.product_id = product.id;

-- Zlaczenia zewnetrzne
-- Zadanie 6
SELECT
    NVL(emp.last_name, '-')   "Nazwisko",
    NVL(TO_CHAR(emp.id), '-') "ID",
    customer.name             "Nazwa Klienta"
FROM
    emp,
    customer
WHERE
    emp.id (+) = customer.sales_rep_id;

-- Zadanie 7
SELECT
    customer.id               "Nr Klienta",
    customer.name             "Nazwa Klienta",
    NVL(TO_CHAR(ord.id), '-') "Nr Zamowienia"
FROM
    customer,
    ord
WHERE
    customer.id = ord.customer_id (+)
ORDER BY
    customer.id;

-- Zlaczenia zwrotne
-- Zadanie 8
SELECT
    (e1.last_name || ' pracuje dla ' || e2.last_name) "Kto dla kogo"
FROM
    emp e1,
    emp e2
WHERE
    e1.manager_id IS NOT NULL
    AND e1.manager_id = e2.id;

-- Zlaczenia drzewiaste
-- Zadanie 9
SELECT
    e1.first_name                    "Imie",
    e1.last_name                     "Nazwisko",
    e1.title                         "Stanowisko",
    NVL(TO_CHAR(e1.manager_id), ' ') "Zwierzchnik",
    level - 0                        "Poziom"
FROM
    emp e1
CONNECT BY
    PRIOR e1.id = e1.manager_id
START WITH 
    e1.manager_id IS NULL
ORDER BY
    level;

-- Zadanie 10
SELECT
    first_name                    "Imie",
    last_name                     "Nazwisko",
    title                         "Stanowisko",
    NVL(TO_CHAR(manager_id), ' ') "Zwierzchnik",
    level - 0                     "Poziom"
FROM
    emp 
CONNECT BY
    PRIOR id = manager_id
START WITH
    title = 'VP, Operations'
ORDER BY
    level;
