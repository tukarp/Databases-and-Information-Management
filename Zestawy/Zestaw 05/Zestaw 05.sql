-- Zestaw 05 - Podzapytania
-- Zadanie 1
SELECT
    id    "ID",
    total "Wartosc"
FROM
    ord
WHERE
    total = (SELECT MAX(total) FROM ord);

-- Zadanie 2
SELECT
    *
FROM
    ord
WHERE
    total = (SELECT
                MAX(total)
            FROM
                ord
            WHERE
                payment_type='CASH');

-- Zadanie 3
SELECT
    *
FROM
    ord
WHERE
    total > (SELECT AVG(total) FROM ord);

-- Zadanie 4
SELECT
    name                  "Nazwa Produktu",
    suggested_whlsl_price "Sugerowana Cena"
FROM
    product
WHERE
    suggested_whlsl_price < (SELECT
                                AVG(suggested_whlsl_price)
                            FROM
                                product
                            WHERE
                                name LIKE 'Prostar%');

-- Zadanie 5
SELECT
    warehouse_id    "ID Magazynu",
    product_id      "ID Produktu",
    amount_in_stock "Ilosc Produktu w Magazynie"
FROM
    inventory
WHERE
    (warehouse_id, amount_in_stock)
IN
    (SELECT
        warehouse_id,
        MAX(amount_in_stock)
    FROM
        inventory
    GROUP BY
        warehouse_id);

-- Zadanie 6
SELECT
    warehouse_id    "ID Magazynu",
    product_id      "ID Produktu",
    amount_in_stock "Ilosc Produktu w Magazynie"
FROM
    inventory I1
WHERE
    amount_in_stock = (SELECT
                            MAX(amount_in_stock)
                        FROM
                            inventory I2
                        WHERE
                            I1.warehouse_id = I2.warehouse_id);

-- Zadanie 7
SELECT
    W.city             "Miasto",
    P.name             "Produkt",
    I1.amount_in_stock "Ilosc Produktu w Magazynie"
FROM
    product   P,
    warehouse W,
    inventory I1
WHERE
    I1.amount_in_stock = (SELECT
                                MAX(amount_in_stock)
                            FROM
                                inventory I2
                            WHERE
                                I1.warehouse_id = I2.warehouse_id)
AND W.id = I1.warehouse_id
AND P.id = I1.product_id;

-- Zadanie 8
SELECT
    name "Imie"
FROM
    customer
WHERE
    NOT EXISTS (SELECT
                    *
                FROM
                    ord
                WHERE
                    ord.customer_id = customer.id);

-- Zadanie 9
SELECT
    customer.id   "ID Klienta",
    customer.name "Nazwa Klienta",
    ord.id        "ID Zamowienia"
FROM
    customer, ord
WHERE
    EXISTS (SELECT
                *
            FROM
                ord
            WHERE
                ord.customer_id = customer.id)
AND
    customer.id = ord.customer_id
ORDER BY
    customer.id;

-- Zadanie 10
SELECT
    customer_id "ID Klienta",
    id          "ID Zamowienia"
FROM
    ord
ORDER BY
    customer_id;

-- Zadanie 11
SELECT
    emp.last_name "Nazwisko Klienta"
FROM
    emp
WHERE
    emp.last_name IN (SELECT
                            last_name
                        FROM
                            emp, ord
                        WHERE
                            emp.id = ord.sales_rep_id
                            AND ord.id < 100);

-- Zadanie 12
SELECT
    emp.last_name "Nazwisko Klienta"
FROM
    emp, ord
WHERE
    emp.id = ord.sales_rep_id
    AND ord.id < 100;

-- Zadanie 13
SELECT
    first_name || ' ' || last_name "Imie i nazwisko"
FROM
    emp
WHERE
    (SELECT
        COUNT(ord.id)
    FROM
        ord
    WHERE
        ord.sales_rep_id = emp.id) > 3;
