# Bazy Danych i Zarządzanie Informacją

## Zestaw 06 - Zapytania ```SQL```

### Zadanie 1

Napisz skrypt który wyświetli listę pracowników, którzy zarabiają poniżej wartości ```1300```, posortowaną alfabetycznie względem nazwisk.

### Rozwiązanie

```
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
```

### Zadanie 2

Napisz skrypt który wyświetli w jednej kolumnie daty wszystkich zamówień i ich łączne wartości.

### Rozwiązanie

```
SELECT
    date_ordered "Data Zamowienia",
    date_shipped "Data Wysylki",
    total        "Laczne Wartosci"
FROM
    ord;
```

### Zadanie 3

Napisz skrypt który poda imiona i nazwiska pracowników na stanowisku ```Stock Clerk```, którzy zarabiają więcej, niż średnia zarobków na stanowisku ```Warehouse Manager```.

### Rozwiązanie

```
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
```

### Zadanie 4

Napisz skrypt który określi, ilu pracowników ma zarobki poniżej średniej poborów wszystkich pracowników.

### Rozwiązanie

```
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
```

### Zadanie 5

Napisz skrypt który poda listę pracowników o stażu pracy ponad ```30``` lat, sortując wynik względem daty zatrudnienia.

### Rozwiązanie

```
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
```

### Zadanie 6

Napisz skrypt który wyświetli numery przedstawicieli handlowych i sumy kwot wszystkich zamówień przez nich realizowanych.

### Rozwiązanie

```
SELECT
    ord.sales_rep_id "Przedstawiciel Handlowy",
    SUM(total)       "Suma Kwot Zamowien"
FROM
    emp, ord
WHERE
    ord.sales_rep_id = emp.id
GROUP BY
    ord.sales_rep_id;
```

### Zadanie 7

Napisz skrypt który poda numer identyfikacyjny przedstawiciela handlowego, który obsłużył zamówienia o maksymalnej łącznej wartości. Wypisz również łączną kwotę tych zamówień.

### Rozwiązanie

```
SELECT
    MAX(ord.sales_rep_id) "Przedstawiciel Handlowy",
    MAX(SUM(total))       "Suma Kwot Zamowien"
FROM
    emp, ord
WHERE
    ord.sales_rep_id = emp.id
GROUP BY
    ord.sales_rep_id;
```

### Zadanie 8

Napisz skrypt który określ nazwisko przedstawiciela handlowego z poprzedniego zadania.

### Rozwiązanie

```
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
```

### Zadanie 9

Napisz skrypt który wypiszę chronologicznie daty przyjęć do pracy oraz liczbę osób zatrudnianych w danym dniu.

### Rozwiązanie

```
SELECT
    emp.start_date    "Data Rozpoczecie",
    COUNT(start_date) "Liczba Osob Zatrudnionych"
FROM
    emp
GROUP BY
    start_date;
```

### Zadanie 10

Napisz skrypt który sprawdzi, których towarów brakuje na stanie inwentarza w którymkolwiek z magazynów oraz wyświetli nazwy tylko tych, które mają komentarz uzasadniający ich brak.

### Rozwiązanie

```
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
```

### Zadanie 11

Napisz skrypt który określi nazwy produktów, których łączna liczba na stanie we wszystkich magazynach jest mniejsza niż ```500```.

### Rozwiązanie

```
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
```

### Zadanie 12

Napisz skrypt który wyświetli nazwy towarów, które opisane są dokładnie ```3``` wyrazami.

### Rozwiązanie

```
SELECT
    name "Nazwa Produktu"
FROM
    product
WHERE
    name LIKE '% % %'
    AND name NOT LIKE '% % % %';
```
