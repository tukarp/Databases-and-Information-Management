# Bazy Danych i Zarządzanie Informacją

## Zestawy

### Zestaw 04 - Złączenia tabel

### ```Złączenia równościowe```

### Zadanie 1

Napisz skrypt który połączy ze sobą 2 tabele – pracowników i departamentów. Wyświetl następujące informacje: dane osobowe pracownika, numer departamentu oraz jego nazwę.

### Rozwiązanie

```
SELECT
    emp.first_name "Imie",
    emp.last_name  "Nazwisko",
    emp.dept_id    "NR",
    dept.name      "Nazwa"
FROM
    emp,
    dept;
```

### Zadanie 2

Napisz skrypt który wyświetli numer departamentu, numer regionu oraz nazwę regionu dla wszystkich departamentów.

### Rozwiązanie

```
SELECT
    dept.id     "NR",
    region.id   "NR Regionu",
    region.name "Nazwa Regionu"
FROM
    dept,
    region
WHERE
    region.id = dept.region_id;
```

### Zadanie 3

Napisz skrypt który wyświetli dane pracownika o nazwisku ```Menchu```, w tym numer oraz nazwę jego departamentu.

### Rozwiązanie

```
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
```

### Zadanie 4

Napisz skrypt który wyświetli nazwisko, nazwę regionu oraz prowizję dla pracowników, którzy otrzymują premię

### Rozwiązanie

```
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
```

### Zadanie 5

Napisz skrypt który wyświetli nazwę klienta składającego zamówienie, nazwisko pracownika 'opiekującego' się danym zamówieniem, datę zamówienia, wielkość zamówienia oraz nazwę produktu – dla wszystkich zamówień o numerze ```101```.

### Rozwiązanie

```
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
```

### ```Złączenia zewnętrzne```

### Zadanie 6

Napisz skrypt który wyświetli dane przedstawicieli handlowych, identyfikator pracownika (tabela ```emp```) oraz nazwy ich wszystkich klientów (tabela ```customer```). Wyświetl też nazwy klientów, którzy nie mają przypisanego przedstawiciela handlowego

### Rozwiązanie

```
SELECT
    NVL(emp.last_name, '-')   "Nazwisko",
    NVL(TO_CHAR(emp.id), '-') "ID",
    customer.name             "Nazwa Klienta"
FROM
    emp,
    customer
WHERE
    emp.id (+) = customer.sales_rep_id;
```

### Zadanie 7

Napisz skrypt który wyświetli identyfikator klienta, jego nazwę oraz identyfikator zamówienia dla wszystkich klientów i ich zamówień. Wyświetl także tych klientów, którzy nie złożyli żadnego zamówienia. 

### Rozwiązanie

```
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
```

### ```Złączenia zwrotne```

### Zadanie 8

Napisz skrypt który wyświetl nazwiska pracowników oraz odpowiedniego dla danego pracownika kierownika (także ```nazwisko```, tabela ```emp```). Wynik przedstawić w postaci schematu: ```ktoś pracuje dla kogoś```. 

### Rozwiązanie

```
SELECT
    (e1.last_name || ' pracuje dla ' || e2.last_name) "Kto dla kogo"
FROM
    emp e1,
    emp e2
WHERE
    e1.manager_id IS NOT NULL
    AND e1.manager_id = e2.id;
```

### ```CONNECT BY PRIOR```, ```START WITH``` oraz ```LEVEL```

### Zadanie 9

Napisz skrypt który wyświetli hierarchie stanowisk w firmie, wypisując dane pracowników: imię, nazwisko, stanowisko, identyfikator menadżera oraz ```poziom```, na którym znajduje się dane stanowisko.

np. President: 1, VP: 2, itd. (wykorzystać pseudokolumnę ```LEVEL```). Posortować według ```poziomu```.

### Rozwiązanie

```
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
START WITH e1.manager_id IS NULL
ORDER BY
    level;
```

### Zadanie 10

Napisz skrypt który zmodyfikuję powyższe zapytanie tak, aby wyświetlić tylko osoby podległe pracownikowi na stanowisku VP, Operations.

### Rozwiązanie

```
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
```
