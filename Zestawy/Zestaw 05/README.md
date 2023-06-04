# Bazy Danych i Zarządzanie Informacją

## Zestaw 05 - Podzapytania

### Zadanie 1

Napisz skrypt który określi numer zamówienia o maksymalnej łącznej wartości (tabela ```ord```).

### Rozwiązanie

```
SELECT
    id    "ID",
    total "Wartosc"
FROM
    ord
WHERE
    total = (SELECT MAX(total) FROM ord);
```

### Zadanie 2

Napisz skrypt który wyświetli dane zamówienia o największej wartości spośród tych, za które zapłacono gotówką.

### Rozwiązanie

```
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
```

### Zadanie 3

Napisz skrypt który wyświetli dane zamówień, których kwota przekracza średnią wartość wszystkich zamówień.

### Rozwiązanie

```
SELECT
    *
FROM
    ord
WHERE
    total > (SELECT AVG(total) FROM ord);
```

### Zadanie 4

Napisz skrypt który wyświetli nazwy produktów, których sugerowana cena jest niższa niż średnia cena produktów serii ```Prostar``` (tabela ```product```).

### Rozwiązanie

```
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
```

### Zadanie 5

Napisz skrypt który określi, których towarów jest najwięcej w poszczególnych magazynach (tabela ```inventory```).

### Rozwiązanie

```
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
```

### Zadanie 6

Napisz skrypt który wykona powyższe zadanie korzystając z ```podzapytań skorelowanych```.

### Rozwiązanie

```
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
```

### Zadanie 7

Napisz skrypt który zmodyfikuję powyższe zapytanie tak, żeby w wynikach podane były nazwy produktów i miasta, w których znajdują się odpowiednie magazyny.

### Rozwiązanie

```
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
```

### Zadanie 8

Napisz skrypt który wyświetli nazwy klientów (tabela ```customer```), którzy nigdy nie złożyli zamówienia.

### Rozwiązanie

```
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
```

### Zadanie 9

Napisz skrypt który zmodyfikuj powyższe zapytanie (zachowując podzapytanie) w taki sposób, żeby wyświetlić klientów, którzy składali zamówienia.

### Rozwiązanie

```
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
```

### Zadanie 10

Napisz skrypt który sprawdzi powyższy wynik za pomocą pojedynczego zapytania odnoszącego się tylko do tabeli ```ord```, sortując względem numeru klient.

### Rozwiązanie

```
SELECT
    customer_id "ID Klienta",
    id          "ID Zamowienia"
FROM
    ord
ORDER BY
    customer_id;
```

### Zadanie 11

Napisz skrypt który poda nazwiska pracowników, którzy obsługiwali zamówienia o numerze mniejszym od ```100```.

### Rozwiązanie

```
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
```

### Zadanie 12

Napisz skrypt który wykona powyższe zadanie bez podzapytania.

### Rozwiązanie

```
SELECT
    emp.last_name "Nazwisko Klienta"
FROM
    emp, ord
WHERE
    emp.id = ord.sales_rep_id
    AND ord.id < 100;
```

### Zadanie 13

Napisz skrypt który poda imiona i nazwiska pracowników, którzy obsłużyli co najmniej 4 zamówienia.

### Rozwiązanie

```
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
```
