# Bazy Danych i Zarządzanie Informacją

## Zestawy

### Zestaw 02 - funkcje oracle

### Funkcje znakowe ```LOWER```, ```UPPER```, ```CONCAT```, ```SUBSTR```, ```LENGTH```, ```NVL```

### Zadanie 1

Napisz skrypt który wyświetli ```imię i nazwisko``` (tylko małymi literami), ```identyfikator użytkownika``` (```pierwsza litera wielka```, ```pozostałe małe```) oraz ```stanowisko``` (```wielkie litery```) dla ```wszystkich zastępców prezesa``` (```VP – vice presidents```).

```
SELECT LOWER(first_name) "Imie", LOWER(last_name) "Nazwisko", INITCAP(userid) "Identyfikator" , UPPER(title) "Stanowisko" FROM emp WHERE title LIKE 'VP%';
```

### Zadanie 2

Napisz skrypt który wyświetli ```imię i nazwisko``` wszystkich pracowników, którzy noszą ```nazwisko Patel```. W zapytaniu (```WHERE```) użyć słowa ```PATEL``` pisanego wielkimi literami.

```
SELECT first_name "Imie", last_name "Nazwisko" FROM emp WHERE LOWER(last_name) = LOWER('PATEL');
```

### Zadanie 3

Napisz skrypt który wyświetli ```nazwę``` oraz ```państwo``` dla wszystkich ```klientów``` (tabela ```customer```), którzy mają ```zdolność kredytową```
(```credit_rating```) na ```poziomie dobrym``` (```GOOD```). ```Skonkatenować``` ze sobą ```nazwę``` oraz ```państwo```.

```
SELECT ((name || ' - ' || country )) "Nazwa i panstwo" FROM customer WHERE credit_rating = 'GOOD';
```

### Zadanie 4

Napisz skrypt który wyświetli ```nazwę``` i jej ```długość``` (```liczbę znaków```) dla ```wszystkich produktów```, których ```pierwsze trzy litery nazwy są
równe 'Ace'``` (tabela ```product```).

```
SELECT name "Nazwa" , LENGTH(name) "Liczba znakow" FROM product WHERE name LIKE 'Ace%';
```

### Funkcje liczbowe ```ROUND```, ```TRUNC```, ```MOD```

### Zadanie 5

Napisz skrypt który wyświetli ```wartość``` ```41.5843``` zaokrągloną do ```setnych części ułamkowych```, do wartości ```całkowitych``` oraz do ```całych dziesiątek```.

```
SELECT ROUND(41.5843, 2) "Setne", ROUND(41.5843, 0) "Calkowite", ROUND(41.5843, -1) "Dziesiatki" FROM dual;
```

### Zadanie 6

Napisz skrypt który wyświetli wartość ```41.5843``` obciętą do części ```setnych```, wartości ```całkowitych``` oraz do całych ```dziesiątek```.

```
SELECT ROUND(41.5843, 2) "Setne", FLOOR(41.5843) "Calkowite", ROUND(41.5843, -1) "Dziesiatki" FROM dual;
```

### Zadanie 7

Napisz skrypt który obliczy ```resztę``` z ```dzielenia``` ```pensji``` przez ```prowizję``` (```commission_pct```) dla wszystkich ```pracowników```, których ```pobory``` są
```większe``` niż ```1380```. Wyświetl ich ```nazwiska```.

```
SELECT last_name "Nazwisko", MOD(salary, commission_pct) "Reszta" FROM emp WHERE salary > 1380;
```

### Zadanie 7a

Napisz skrypt który zmodyfikuję powyższe zapytanie tak, żeby ```nie były wyświetlanie``` ```wiersze z wartościami pustymi``` (```null```).

```
SELECT last_name "Nazwisko", MOD(salary, commission_pct) "Reszta" FROM emp WHERE salary > 1380 AND commission_pct IS NOT null;
```

### Operacje na datach ```SYSDATE```, ```MONTHS_BETWEEN```, ```ADD_MONTHS```, ```NEXT_DAY```, ```ROUND```, ```TRUNC```, ```EXTRACT```

### Zadanie 8

Napisz skrypt który wyświetli ```aktualną datę```.

```
SELECT sysdate "Aktualna Data" FROM dual
```

### Zadanie 9

Napisz skrypt który dla ```pracowników``` z ```departamentu 43``` wyświetli ```nazwisko``` oraz ```liczbę tygodni zatrudnienia``` w firmie (```wartość
całkowita```).

```
SELECT last_name "Nazwisko", ROUND((TRUNC((sysdate - start_date), 0)/7),0) "Liczba Tygodni W Firmie" FROM emp WHERE dept_id = 43;
```

### Zadanie 10

Napisz skrypt który dla ```pracowników``` ```zatrudnionych``` mniej niż ```368 miesięcy``` wyświetlić ```identyfikator pracownika```, ```liczbę pełnych miesięcy pracy``` oraz ```datę zakończenia``` 3-miesięcznego okresu próbnego.

```
SELECT id "ID", TRUNC((months_between(sysdate, start_date)),0) "Liczba Miesiecy", add_months(start_date, 3) "Po Stazu" FROM emp WHERE months_between(sysdate, start_date) < 368;
```

### Zadanie 11

Napisz skrypt który na potrzeby ```inwentaryzacji dostaw``` wyświetli ```chronologicznie``` ```numery``` zamawianych ponownie ```produktów```, ```dzień dostawy```, pierwszy po nim ```piątek``` oraz ostatni ```dzień miesiąca```, w którym dostawa została ```przyjęta``` (```restock_date``` w tabeli ```inventory```).

```
SELECT product_id "Produkt", restock_date "Dostawa", next_day(restock_date, 5) "Piatek Po Dostawie", last_day(restock_date) "Ostatni Dzien Miesiaca" FROM inventory WHERE restock_date IS NOT null ORDER BY restock_date ASC;
```

### Zadanie 12

Napisz skrypt który zestawi ```daty zatrudnienia``` dla ```pracowników```, którzy zostali ```przyjęci``` do pracy w ```1991 roku```. Pokazać ```numer pracownika```, ```datę rozpoczęcia pracy``` oraz tylko ```miesiąc``` rozpoczęcia pracy.

```
SELECT id "ID", start_date "Data", extract(month from start_date) "Miesiac" FROM emp WHERE EXTRACT (year from start_date) = 1991;
```

### Funkcje konwersji ```TO_CHAR```, ```TO_DATE```

### Zadanie 13

Napisz skrypt który z tabeli ```ord``` wyświetli ```numer``` (```id```) oraz ```datę``` (```date_ordered```) wszystkich ```zamówień``` złożonych przez
```przedstawiciela``` (```sales_rep_id```) o numerze ```11```. ```Datę``` przeformatować tak, żeby była wyświetlana w postaci
analogicznej do ```08/92```.

```
SELECT id "ID",  to_char(date_ordered, 'mm/rr') "MM/RR" FROM ord WHERE sales_rep_id = 11;
```

### Zadanie 14

Napisz skrypt który wyświetli ```nazwiska``` i ```daty zatrudnienia``` ```pracowników```, którzy pracują od ```1991 roku```. ```Data``` powinna być wyświetlana w następujący sposób: ```17 Czerwiec 1991 roku```.

```
SELECT last_name "Nazwisko", to_char(start_date, 'dd Month YYYY') "Data" FROM emp WHERE EXTRACT(year from start_date) >= 1991;
```
