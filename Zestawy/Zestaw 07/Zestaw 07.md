# Bazy Danych i Zarządzanie Informacją

## Zestawy

### Zestaw 07 - Modyfikacja bazy danych

### Zadanie 1

Napisz definicję poleceń:

- ```COMMIT```,
- ```ROLLBACK```,
- ```SAVEPOINT```.

### Rozwiązanie

```
COMMIT - Funkcja zatwierdza wszystkie wykonane do tej pory zmiany,
ROLLBACK - Funkcja wycofująca dokonane przed zapisaniem zmiany,
SAVEPOINT - Funkcja tworząca punkty kontrolne.
```

### Zadanie 2

Napisz skrypt który wyłączy automatyczne zapisywanie zmian.

### Rozwiązanie

```
SET AUTOCOMMIT OFF
```

### Zadanie 3

Napisz skrypt który wstawi do tabeli ```emp``` nowego pracownika.

### Rozwiązanie

```

```

### Zadanie 4

Napisz skrypt który wstawi do tabeli ```emp``` kolejnego pracownika. Sprawdź poleceniem ```SELECT```, czy dane zostały wprowadzone, a następnie wykonaj polecenie ```ROLLBACK``` i jeszcze raz sprawdź tabelę ```emp```.

### Rozwiązanie

```

```

### Zadanie 5

Napisz skrypt który wstawi do tabeli ```emp``` nowego pracownika.

### Rozwiązanie

```

```

### Zadanie 6

Napisz skrypt który wykona następujące czynności:

- ```a) ``` Podniesię cenę wszystkich produktów o ```15%```,
- ```b) ``` Stworzy pierwszy punkt kontrolny nazywając go ```S1```,
- ```c) ``` Wyświetli sumę cen wszystkich produktów,
- ```d) ``` Podniesię cenę o ```10%```,
- ```e) ``` Stworzy drugi punkt kontrolny ```S2```,
- ```f) ``` Wyświetlić sumę cen wszystkich produktów,
- ```g) ``` Podniesię cenę o ```60%```,
- ```h) ``` Wyświetli sumę cen wszystkich produktów,
- ```i) ``` Wycofa zmiany do drugiego punktu kontrolnego (```S2```),
- ```j) ``` Wyświetli sumę cen wszystkich produktów,
- ```k) ``` Wycofa zmiany do pierwszego punktu kontrolnego (```S1```),
- ```l) ``` Wyświetli sumę cen wszystkich produktów,
- ```m) ``` Wykona polecenie ```COMMIT```.

### Rozwiązanie

```
-- Zadanie 6a

-- Zadanie 6b

-- Zadanie 6c

-- Zadanie 6d

-- Zadanie 6e

-- Zadanie 6f

-- Zadanie 6g

-- Zadanie 6h

-- Zadanie 6i

-- Zadanie 6j

-- Zadanie 6k

-- Zadanie 6l

-- Zadanie 6m

```

### Zadanie 7

Napisz skrypt który włączy polecenie ```AUTOCOMMIT``` w konsoli ```SQL```.

### Rozwiązanie

```

```

### Zadanie 8

Napisz skrypt który stworzy tabelę ```region_kopia```, a następnie przekopiuję wszystkie dane z tabeli ```region``` do tabeli ```region_kopia```.

### Rozwiązanie

```

```

### Zadanie 9

Napisz skrypt który wstawi do tabeli ```dept``` kopie wszystkich istniejących danych z tej tabeli.

### Rozwiązanie

```

```

### Zadanie 10

Napisz skrypt który uzupełni w tabeli ```region_kopia``` kolumnę name nazwami tych klientów, których maksymalne zamówienie było wyższe niż ```1000```.

### Rozwiązanie

```

```

### Zadanie 11

Napisz skrypt który podniesię własną pensję o ```300%```, a datę zatrudnienia ustawi na ```31 grudnia 2001 rok```. 

### Rozwiązanie

```
-- Zadanie 12a

-- Zadanie 12b

```

### Zadanie 12

Napisz skrypt który zmodyfikuję tabelę ```product```:
- ```a)``` Zmniejszy ceny o ```10%``` tych produktów, których sprzedano mniej niż ```30``` sztuk,
- ```b)``` Zwiększy ceny o ```8%``` pięciu najlepiej sprzedających się produktów

### Rozwiązanie

```

```

### Zadanie 13

Napisz skrypt który podniesię zarobki wszystkim ```vice-dyrektorom``` o ```30%```.

### Rozwiązanie

```

```

### Zadanie 14

Napisz skrypt który usunię z tabeli ```emp``` wstawionych w tej sesji pracowników. 

### Rozwiązanie

```

```

### Zadanie 15

Napisz skrypt który skasuję tabelę ```region_kopia```.

### Rozwiązanie

```

```
