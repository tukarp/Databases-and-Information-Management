-- Zestaw 06 - Zapytania SQL
-- Zadanie 1
SELECT
    emp.first_name "Imie",
    emp.last_name  "Nazwisko",
    emp.salary     "Pensja"
FROM
    emp
WHERE
    salary < 1300
ORDER BY
    last_name;

-- Zadanie 2
SELECT
    date_ordered "Data Zamowienia",
    date_shipped "Data Wysylki",
    total        "Laczne Wartosci"
FROM
    ord;

-- Zadanie 3
SELECT
    emp.last_name  "Nazwisko",
    emp.first_name "Imie"
FROM
    emp
WHERE
    title = 'Stock Clerk'
    AND salary > (
        SELECT
            AVG(salary)
        FROM
            emp
        WHERE
            title='Warehouse Manager');

-- Zadanie 4
SELECT
    COUNT(emp.last_name) "Ilosc Pracownikow"
FROM
    emp
WHERE
    salary < (
        SELECT
            AVG(salary)
        FROM
            emp);

-- Zadanie 5
SELECT
    emp.last_name  "Imie",
    emp.first_name "Nazwisko",
    emp.start_date "Data Zatrudnienia"
FROM
    emp
WHERE
    ((TO_DATE('21/03/01', 'YY/MM/DD')) - (TO_DATE(TO_CHAR(start_date, 'YY/MM/DD')))) > 30
ORDER BY
    start_date;

-- Zadanie 6
SELECT
    ord.sales_rep_id "Przedstawiciel Handlowy",
    SUM(total)       "Suma Kwot Zamowien"
FROM
    emp, ord
WHERE
    ord.sales_rep_id = emp.id
GROUP BY
    ord.sales_rep_id;

-- Zadanie 7
SELECT
    MAX(ord.sales_rep_id) "Przedstawiciel Handlowy",
    MAX(SUM(total))       "Suma Kwot Zamowien"
FROM
    emp, ord
WHERE
    ord.sales_rep_id = emp.id
GROUP BY
    ord.sales_rep_id;

-- Zadanie 8
SELECT
    last_name "Nazwisko"
FROM
    (SELECT
        last_name,
        SUM(total)
    FROM
        emp, ord
    WHERE
        ord.sales_rep_id = emp.id
    GROUP BY
        emp.id, last_name)
WHERE
    rownum = 1;

-- Zadanie 9
SELECT
    emp.start_date    "Data Rozpoczecie",
    COUNT(start_date) "Liczba Osob Zatrudnionych"
FROM
    emp
GROUP BY
    start_date;

-- Zadanie 10
SELECT
    inventory.product_id               "Produkt",
    product.name                       "Nazwa Produktu",
    inventory.out_of_stock_explanation "Wytlumaczenie Braku"
FROM
    inventory, product
WHERE
    product.id = inventory.product_id
    AND amount_in_stock = 0
    AND inventory.out_of_stock_explanation IS NOT NULL;

-- Zadanie 11
SELECT
    product.name "Nazwa Produktu"
FROM
    inventory, product
WHERE
    product.id = inventory.product_id
GROUP BY
    inventory.product_id,
    product.name
HAVING
    SUM(inventory.amount_in_stock) < 500;

-- Zadanie 12
SELECT
    name "Nazwa Produktu"
FROM
    product
WHERE
    name LIKE '% % %'
    AND name NOT LIKE '% % % %';
