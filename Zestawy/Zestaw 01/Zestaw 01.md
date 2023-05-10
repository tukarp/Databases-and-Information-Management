# Bazy Danych i Zarządzanie Informacją

## Zestawy

### Zestaw 01 - ```SQL``` - proste instrukcje wybierania danych

### Zadanie 1

Napisz skrypt który z tabeli ```dept``` wyświetli wszystkie kolumny oraz wszystkie rekordy.

### Rozwiązanie

```
SELECT
    *
FROM
    dept
```

### Zadanie 2

Napisz skrypt który wyświetli wszystkie identyfikatory departamentów, nazwiska pracowników oraz identyfikatory managerów z tabeli ```emp```.

### Rozwiązanie

```
SELECT
    dept_id    "ID Departamentu",
    last_name  "Nazwisko",
    manager_id "ID Menadzera"
FROM
    emp
```

### Zadanie 3

Napisz skrypt który wyświetli roczne dochody wszystkich pracowników wraz z ich nazwiskami.

### Rozwiązanie

```
SELECT
    (salary * 12) "Roczne Dochody",
    last_name     "Nazwisko"
FROM
    emp
```

### Zadanie 4

Napisz skrypt który wyświetli dane osobowe pracowników, zarobki miesięczne, zarobki roczne – doliczając premię roczną w wysokości ```1000```.

### Rozwiązanie

```
SELECT
    first_name "Imie",
    last_name  "Nazwisko",
    salary     "Zarobki miesieczne",
    ((salary * 12) + 1000) "Zarobki Roczne z Premia"
FROM
    emp
```

### Zadanie 5

Napisz skrypt który wyświetli dane osobowe pracowników, zarobki miesięczne, zarobki roczne – doliczając premię co miesiąc w wysokości ```8%```.

### Rozwiązanie

```
SELECT
    first_name      "Imie",
    last_name       "Nazwisko",
    (salary * 1.08) "Zarobki Miesieczne",
    ((salary * 1.08) * 12) "Zarobki Roczne"
FROM
    emp
```

### Zadanie 6

Napisz skrypt który wyświetli nazwisko oraz roczny dochód wraz z dodatkiem ```5%``` miesięcznych zarobków – taką kolumnę nazwij ```ROCZNY DOCHÓD``` (alias).

### Rozwiązanie

```
SELECT
    last_name "Nazwisko",
    ((salary * 12) + (salary * 0.05)) "Roczny Dochod"
FROM
    emp
```

### Zadanie 7

Napisz skrypt który wyświetli skonkatenowane imię i nazwisko (rozdzielone spacjami) poszczególnych pracowników (w jednej kolumnie). Kolumnę nazwij ```Imię i nazwisko```.

### Rozwiązanie

```
SELECT
    ((first_name || ' '||last_name)) "Imie i nazwisko"
FROM
    emp
```

### Zadanie 8

Napisz skrypt który wyświetli dane osobowe pracowników oraz ich stanowiska (w jednej kolumnie, z nagłówkiem ```Super Pracownicy```).

### Rozwiązanie

```
SELECT
    ((first_name || ' '||last_name || ' - ' || title)) "Super Pracownicy"
FROM
    emp
```

### Zadanie 9

Napisz skrypt który wyświetli nazwiska pracowników, pensję, stanowiska i ich premię (prowizję), obliczoną z pensji na podstawie pola ```commission_pct``` (podana jest w procentach), czyli ( $pensja * prowizja%$ ).

### Rozwiązanie

```
SELECT
    last_name "Nazwisko",
    salary    "Pensja",
    title     "Stanowisko",
    (salary * commission_pct / 100) "Prowizja"
FROM
    emp
```

### Zadanie 10

Napisz skrypt który zmodyfikuję poprzednie zapytanie tak, aby zamiast (```null```) pojawiło się ```0```. Wykorzystaj funkcję ```NVL```.

### Rozwiązanie

```
SELECT
    last_name "Nazwisko",
    salary    "Pensja",
    title     "Stanowisko",
    NVL(salary * commission_pct / 100, 0) "Prowizja"
FROM
    emp
```

### Zadanie 11

Napisz skrypt który Wyświetli nazwy działów z tabeli ```dept```. Zmodyfikuj zapytanie w ten sposób, by nie pojawiały się wielokrotnie te same nazwy.

### Rozwiązanie

```
SELECT
    DISTINCT name "Nazwy"
FROM
    dept
```

### Zadanie 12

Napisz skrypt który dla każdego pracownika wyświetli nazwisko, numer departamentu, wynagrodzenie oraz datę zatrudnienia. Posortuj wynik względem numeru departamentu oraz malejąco względem wynagrodzenia.

### Rozwiązanie

```
SELECT
    last_name  "Nazwisko",
    dept_id    "ID Departamentu",
    start_date "Data Zatrudnienia"
FROM
    emp
ORDER BY
    dept_id,
    salary DESC
```

### Zadanie 13

Napisz skrypt który wyświetli nazwiska pracowników, numery działów oraz daty zatrudnienia. Uporządkuj wyniki rosnąco względem daty zatrudnienia.

### Rozwiązanie

```
SELECT
    last_name  "Nazwisko",
    dept_id    "ID Depatramentu",
    start_date "Data Zatrudnienia"
FROM
    emp
ORDER BY
    start_date ASC
```

### Zadanie 14

Napisz skrypt który wyświetli dane osobowe oraz stanowisko pracowników o nazwisku ```Patel```.

### Rozwiązanie

```
SELECT
    first_name "Imie",
    last_name  "Nazwisko",
    title      "Stanowisko"
FROM
    emp
WHERE
    last_name='Patel'
```

### Zadanie 15

Napisz skrypt który wyświetli nazwisko oraz datę zatrudnienia tych pracowników, którzy zostali zatrudnieni pomiędzy: ```2 maja 1991``` a ```15 czerwca 1991```.

### Rozwiązanie

```
SELECT
    last_name  "Nazwisko",
    start_date "Data Zatrudnienia"
FROM
    emp
WHERE
    start_date >= to_date('02-may-1991', 'dd-mm-yyyy')
    AND start_date <= ('15-june-1991', 'dd-mm-yyyy');
```

### Zadanie 16

Napisz skrypt który wyświetli identyfikatory departamentów, nazwy oraz identyfikatory dla regionów o ```ID``` równym ```1``` lub ```3``` (tabela ```dept```)

### Rozwiązanie

```
SELECT
    id        "ID",
    name      "Nazwa",
    region_id "ID Regionu"
FROM
    dept
WHERE
    region_id = 1
    OR region_id = 3;
```

### Zadanie 17

Napisz skrypt który wyświetlić dane wszystkich pracowników, których nazwiska zaczynają się na literę ```M```.

### Rozwiązanie

```
SELECT
    * "Nazwiska Na Litere `M`"
FROM
    emp
WHERE
    last_name LIKE 'M%';
```

### Zadanie 18

Napisz skrypt który wyświetli wszystkie dane osobowe pracowników, których nazwiska nie zawierają litery ```a```.

### Rozwiązanie

```
SELECT
    * "Nazwiska Bez `A`"
FROM
    emp
WHERE
    last_name NOT LIKE '%a%';
```

### Zadanie 19

Napisz skrypt który wyświetli nazwiska oraz datę zatrudnienia pracowników, którzy zaczęli
pracę w ```1991 roku```.

### Rozwiązanie

```
SELECT
    last_name  "Nazwisko",
    start_date "Data Zatrudnienia"
FROM
    emp
WHERE
    start_date LIKE '%%-%%-1991';
```

### Zadanie 20

Napisz skrypt który wyświetli nazwiska pracowników, których drugą literą nazwiska jest ```a```.

### Rozwiązanie

```
SELECT
    last_name "Nazwiska"
FROM
    emp
WHERE
    last_name LIKE '_a%';
```

### Zadanie 21

Napisz skrypt który wyświetlić nazwy firm z tabeli ```customer```, które zawierają litery ```s``` i ```o``` oddzielone ```jednym znakiem```.

### Rozwiązanie

```
SELECT
    name "Nazwy Firm"
FROM
    customer
WHERE
    name LIKE '%s_o%';
```
