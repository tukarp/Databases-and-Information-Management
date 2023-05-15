# Bazy Danych i Zarządzanie Informacją

## Zestawy

### Zestaw 03 - ```SQL``` – funkcje agregujące, grupowanie, operacje na zbiorach

### Funkcje agregujące

### Zadanie 1

Napisz skrypt który wyświetli minimalne, maksymalne oraz średnie zarobki pracowników. Podać także sumę wszystkich
zarobków oraz liczbę pracowników.

### Rozwiązanie

```
SELECT 
    MAX(salary)       "Maksymalna",
    MIN(salary)       "Minimalna",
    AVG(salary)       "Srednia",
    SUM(salary)       "Suma",
    COUNT(first_name) "Liczba Pracownikow"
FROM 
    emp;
```

### Zadanie 2

Napisz skrypt który wyświetli nazwiska tych pracowników, którzy według listy alfabetycznej są na pierwszym i ostatnim miejscu. 

### Rozwiązanie

```
SELECT 
    MIN(last_name) "Pierwsze Nazwisko", 
    MAX(last_name) "Ostatnie Nazwisko" 
FROM 
    emp;
```

### Zadanie 3

Napisz skrypt który wyświetli liczbę pracowników z działu 31, którzy otrzymują premię.

### Rozwiązanie

```
SELECT 
    COUNT(first_name) "Liczba Pracownikow" 
FROM 
    emp 
WHERE 
    dept_id = 31 
    AND commission_pct IS NOT NULL;
```

### Funkcje grupujące

### Zadanie 4

Napisz skrypt który wyświetli kategorię zdolności kredytowej oraz odpowiadającą im liczbę klientów (tabela ```customer```).

### Rozwiązanie

```
SELECT 
    credit_rating        "Zdolnosc Kredytowa",
    COUNT(credit_rating) "Liczba Klientow"
FROM
    customer
GROUP BY
    credit_rating;
```

### Zadanie 5

Napisz skrypt który wyświetlić stanowiska (pominąwszy vice dyrektorów) oraz łączne zarobki miesięczne dla każdego z nich. Posortuj wyniki według wartości rosnących.

### Rozwiązanie

```
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
```

### Zadanie 6

Napisz skrypt który wyświetli maksymalne zarobki dla każdej grupy stanowisk.

### Rozwiązanie

```
SELECT 
    title       "Stanowisko",
    MAX(salary) "Maksymalne Zarobki"
FROM 
    emp
GROUP BY
    title;
```

### Zadanie 7

Napisz skrypt który wyświetli numery departamentów, w których średnie wynagrodzenie jest większe od 1450.

### Rozwiązanie

```
SELECT
    dept_id     "Numer Oddzialu",
    AVG(salary) "Srednie Zarobki"
FROM
    emp
HAVING
    AVG(salary) > 1450
GROUP BY
    dept_id;
```

### Zadanie 8

Napisz skrypt który wyświetli powtarzające się nazwiska pracowników.

### Rozwiązanie

```
SELECT
    last_name "Nazwisko"
FROM
    emp
HAVING 
    (COUNT(last_name)) > 1
GROUP BY
    last_name;
```

### Operatory łączenia pionowego tabel

### Zadanie 9

Napisz skrypt który z tabeli departamentów wybierze identyfikator regionu oraz nazwę departamentu, zsumuj wynik z identyfikatorem regionu oraz nazwą regionu z tabeli regionów. Posortuj według nazw.

### Rozwiązanie

```
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
```

### Zadanie 10

Napisz skrypt który zmodyfikuję powyższe zapytanie tak, aby wyświetlić tylko nazwy z obu tabel.

### Rozwiązanie

```
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
```

### Zadanie 11

Napisz skrypt który zmodyfikuję powyższe zapytanie tak, aby wyświetlić również powtarzające się wartości.

### Rozwiązanie

```
SELECT
    name "Nazwa"
FROM
    dept

UNION ALL

SELECT
    name "Nazwa"
FROM
    region;
```

### Zadanie 12

Napisz skrypt który wyświetli identyfikator departamentu oraz nazwisko pracownika, zsumuj wynik z identyfikatorem regionu oraz nazwą regionu. Posortuj według nazwiska / nazwy regionu.

### Rozwiązanie

```
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
```


### Zadanie 13

Napisz skrypt który wyświetli z tabeli ```customer``` identyfikatory klientów, którzy złożyli choć jedno zamówienie widoczne w tabeli ```ord``` (wykorzystaj ```INTERSECT```).

### Rozwiązanie

```
SELECT
    id "ID Klienta"
FROM
    customer

INTERSECT

SELECT
    customer_id "ID Klienta"
FROM
    ord;
```

### Zadanie 14

Napisz skrypt który wyświetli identyfikatory klientów, którzy nie złożyli żadnego zamówienia.

### Rozwiązanie

```
SELECT
    id "ID Klienta"
FROM
    customer

MINUS

SELECT
    customer_id "ID Klienta"
FROM
    ord;
```
