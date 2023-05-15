# Bazy Danych i Zarządzanie Informacją

## Spis treści

### Zestawy

- [Zestawy](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy)
- [Zestaw 01 - SQL - proste instrukcje wybierania danych](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2001/Zestaw%2001.md)
- [Zestaw 02 - Funkcje Oracle](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2002/Zestaw%2002.md)
- [Zestaw 03 - SQL – funkcje agregujące, grupowanie, operacje na zbiorach](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2003/Zestaw%2003.md)
- [Zestaw 04 - Złączenia tabel](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2004/Zestaw%2004.md)
- [Zestaw 05 - Podzapytania](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2005/Zestaw%2005.md)
- [Zestaw 06 - Zapytania SQL](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2006/Zestaw%2006.md)
- [Zestaw 07 - Modyfikacja bazy danych](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2007/Zestaw%2007.md)
- [Zestaw 08 - Tworzenie i modyfikacja tabel](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2008/Zestaw%2008.md)
- [Zestaw 09 - Modelowanie bazy danych](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2009/Zestaw%2009.md)
- [Zestaw 10 - Implementacja przykładowej bazy danych](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2010/Zestaw%2010.md)
- [Zestaw 11 - Wstęp do języka PL/SQL](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2011/Zestaw%2011.md)
- [Zestaw 12 - PL/SQL – procedury, funkcje, pakiety](https://github.com/tukarp/Databases-and-Information-Management/blob/main/Zestawy/Zestaw%2012/Zestaw%2012.md)

### Notatki

- [Notatki](#notatki-1)
- [Bazy Danych](#bazy-danych)
    - [Pojęcia](#pojęcia)
    - [Typy relacji](#typy-relacji)
- [SQL](#sql)
    - [Operatory](#operatory)
    - [Podstawowe komendy](#podstawowe-komendy)
    - [Wartości puste](#wartości-puste)
    - [Funkcje znakowe](#funkcje-znakowe)
    - [Funkcje liczbowe](#funkcje-liczbowe)
    - [Operacje na datach](#operacje-na-datach)
    - [Funkcje agregujące](#funkcje-agregujące)
    - [Łączenie pionowe tabel](#łączenie-pionowe-tabel)
    - [Złączenia tabel](#złączenia-tabel)
    - [Podzapytania](#podzapytania)
    - [Modyfikacja baz danych](#modyfikacja-baz-danych)
    - [Ograniczenia integralnościowe (constraints)](#ograniczenia-integralnościowe-constraints)
    - [Modelowanie baz danych](#modelowanie-baz-danych)
    - [Typy modelowania baz danych](#typy-modelowania-baz-danych)


# Notatki

## Bazy Danych

### Pojęcia

- ```Baza Danych``` - to zbiór powiązanych ze sobą informacji, zorganizowanych w określoną strukturę,
- ```Rodzaje Baz Danych```:
    - ```Kartotekowe``` - jest to baza w której dane są przechowywane w postaci kart,
    - ```Relacyjne``` - jest to baza danych gdzie dane gromadzone, przetwarzane i przechowywane za pomocą komputera. Dane umieszczone są w tabelach pozostając w ścisłym związku ze sobą,
- ```System Zarządzania Bazami Danych``` - to program komputerowy, służący do przechowywania i modyfikowania danych,
- ```Tabela``` - to uporządkowany zbiór danych przechowywany w ujednolicony sposób.
- ```Rekord``` - to pojedynczy wiersz w tabeli.
- ```Kolumna``` - to element zawierający dane jednego określonego typu,
- ```Kwerenda``` - to zapytanie umożliwiające wyświetlanie pól i rekordów z tabel według ustalonego przez użytkownika kryterium,
- ```Formularz``` -  to obiekt, który upraszcza proces wprowadzania i aktualizacji danych,
- ``` Sortowanie``` - to porządkowanie rekordów w określonym porządku,
- ```Relacje``` - to zależności między tabelami umożliwiające ich logiczne powiązanie ze
sobą,
- ```Klucz główny``` - słowo kluczowe służące do wymuszenia wpisywania do kolumny z tym ograniczeniem wartości unikalnych i niepustych,
- ```Klucz obcy``` - słowo kluczowe służące do wymuszenia wpisywania do kolumny z tym ograniczeniem wartości występujących w kolumnie referencyjnej.

Źródło:
```
http://www.zstio-elektronika.pl/pliki_t_progr/Podstawowe_pojecia_baz_danych.pdf
```

### Typy relacji

- ```Jeden do Jednego``` - relacja polegająca na tym, że jednemu rekordowi pierwszej tabeli jest przyporządkowany dokładnie jeden rekord drugiej tabeli, a jednemu rekordowi drugiej tabeli jest przyporządkowany dokładnie jeden rekord pierwszej tabeli,
- ```Jeden do Wielu``` - relacja polegająca na tym, że jednemu rekordowi pierwszej tabeli jest przyporządkowanych wiele rekordów drugiej tabeli, a jednemu rekordowi drugiej tabeli jest przyporządkowany dokładnie jeden rekord pierwszej tabeli,
- ```Wiele do Wielu``` - relacja polegająca na tym, że jednemu rekordowi pierwszej tabeli jest przyporządkowanych wiele rekordów drugiej tabeli, a jednemu rekordowi drugiej tabeli jest przyporządkowanych wiele rekordów pierwszej tabeli,

Źródło:
```
http://www.zstio-elektronika.pl/pliki_t_progr/Podstawowe_pojecia_baz_danych.pdf
```

## ```SQL```

### Operatory

- porównania: 
    - ```=```, ```!=```, ```^=```, ```>```, ```<```, ```>=```, ```<=```,
- arytmetyczne:
    - ```+```, ```-```, ```*```, ```/```,
- logiczne:
    - ```AND```, ```OR```, ```NOT```,
- konkatenacji:
    - ```||```,
- przedziałów:
    - ```[NOT] BEETWEN ... AND```, ```[NOT] IN```,
- wzorców:
    - ```[NOT] LIKE```,
- sortowania:
    - ```ASC```, ```DESC```,
- sprawdzenia pustości:
    - ```IS [NOT] NULL```.

### Podstawowe komendy

- ```SELECT``` - komenda służąca do wyszukiwania danych w tabeli,
- ```FROM``` - komenda służąca do określenia tabeli której dotyczy zapytanie,
- ```ORDER BY``` - komenda służąca do sortowania wyników według wybranych kolumn,
- ```WHERE``` - komenda służąca do ograniczenia ilości wyszukiwanych rekordów,
- ```Alias``` - nadana przez nas nazwa wybranych kolumn,
- ```*``` - znak oznaczający wszystkie kolumny w tabeli,

### Wartości puste

- ```NULL``` - wartość pusta,
- ```NVL``` - komenda służąca do zamiany wartości ```NULL``` na podaną wartość,
- ```DISTINCT``` - komenda służąca do eliminowania duplikatów podczas wyszukiwania.

### Funkcje znakowe

- ```LOWER``` - komenda służąca do zmiany liter w łańcuchu znaków na małe,
- ```UPPER``` - komenda służąca do zmiany liter w łańcuchu znaków na duże,
- ```CONCAT``` - komenda służąca do łączenia łańcuchów znaków,
- ```SUBSTR``` - komenda służąca do zwracania podłańcucha znaków z podanego łańcucha znaków,
- ```LENGTH``` - komenda służąca do zwracania długości podanego łańcucha znaków,
- ```TO_CHAR``` - komenda służąca do formatowania zmiennych do łańcuchów znakowych.

### Funkcje liczbowe

- ```ROUND``` - komenda służąca do zaokrąglania liczby do podanego miejsca po przecinku,
- ```TRUNC``` - komenda służąca do obcinania liczby do podanego miejsca po przecinku,
- ```MOD``` - komenda służąca do obliczania reszty z dzielenia liczby przez liczbę.

### Operacje na datach

- ```TO_DATE``` - komenda służąca do definiowania dat,
- ```SYSDATE``` - komenda służąca do zwracania bieżącej daty i czasu,
- ```MONTHS_BETWEEN``` - komenda służąca do zwracania liczby miesięcy pomiędzy datami,
- ```ADD_MONTHS``` - komenda służąca do zwracania daty powiększonej lub pomniejszonej o podaną liczbę miesięcy,
- ```NEXT_DAY``` - komenda służąca do zwracania daty pierwszego dnia zgodnego późniejszego niż podana data,
- ```ROUND``` - komenda służąca do zwracania daty zaokrąglonej do jednostki wskazanej w argumencie,
- ```TRUNC``` - komenda służąca do zwracania daty obciętej do podanej jednostki,
- ```EXTRACT``` - komenda służąca do zwracania wybranej części doby.

### Funkcje agregujące

- ```MAX``` - komenda służąca do zwracania maksymalnej wartości,
- ```MIN``` - komenda służąca do zwracania minimalnej wartości,
- ```AVG``` - komenda służąca do zwracania średniej wartości,
- ```SUM``` - komenda służąca do zwracania sumy podanych wartości,
- ```COUNT``` - komenda służąca do zliczania wartości,
- ```GROUP BY``` - komenda służąca do grupowania wierszy,
- ```HAVING``` - komenda służąca do filtrowania wyników na podstawie zgrupowanych danych.

### Łączenie pionowe tabel

- ```UNION``` - komenda służąca do umożliwiania łączenia dwóch lub więcej instrukcji ```SELECT``` z jednoczesnym sumowaniem ich wyników,
- ```UNION ALL``` - komenda działająca jak ```UNION``` z tą różnicą, że bez sortowania wierszy i eliminiowania powtarzających się wyników,
- ```INTERSECT``` - komenda służąca do zwracania wierszy które występują w obu zapytaniach ```SELECT```
- ```MINUS``` - komenda służąca do zwracania wierszy które występują w pierwszym zapytaniu, a nie występują w drugim,

### Złączenia tabel

- ```CONNECT BY PRIOR``` - komenda służąca do określenia w jaki sposób baza ma budować kolejne poziomy,
- ```START WITH``` - komenda służąca do określenia z którego miejsca zaczynamy budowanie poziomów,
- ```LEVEL``` - komenda służąca do podania poziomu na którym się znajdujemy,

### Podzapytania

- ```Podzapytanie``` - zapytanie z podzapytaniem działa w taki sposób, że pierwszy wyznaczony jest wynik podzapytania i jest zapamiętywany w buforze tymczasowym. Następnie warunek w głównym zapytaniu jest sprawdzany z wynikiem podzapytania. Jeżeli wynik jest dodatni - dane zostają zaliczone do wyniku ostatecznego

### Modyfikacja baz danych

- ```COMMIT``` - komenda służąca do zatwierdzenia zmian w bazie danych,
- ```ROLLBACK``` - komenda służąca do cofnięcia niezatwierdzonych komendą ```COMMIT``` zmian,
- ```SAVEPOINT``` - komenda służąca do utowrzenia punktu kontrolnego który możemy wykorzyustać do bardziej precyzyjnego wywoływania zmian,
- ```INSERT``` - komenda służąca do wskazania rekordów,
- ```UPDATE``` - komenda służąca do modyfikacji rekordów,
- ```DELETE``` - komenda służąca do usuwania wierszy,
- ```DROP TABLE [name]``` - komenda służąca do usunięcia tabeli,
- ```DROP TABLE [name] CASCADE``` - komenda służąca do usunięcia tabeli kaskadowo - usuwanie tabeli i powiązanych z nimi rekordów (np. ```kluczy obcych```),

### Ograniczenia integralnościowe (constraints)

- ```UNIQUE``` - komenda służąca do wymuszenia wpisywania do kolumny z tym ograniczeniem wartości unikalnych,
- ```NOT NULL``` - komenda służąca do wymuszenia wpisywania do kolumny z tym ograniczeniem wartości niepustych,
- ```CHECK``` - komenda służąca do wymuszenia wpisywania do kolumny z tym ograniczeniem wartości następując we wcześniej zdefiniowany zbiorze,
- ```PRIMARY KEY``` - komenda służąca do wymuszenia wpisywania do kolumny z tym ograniczeniem wartości unikalnych i niepustych,
- ```FOREIGN KEY``` - komenda służąca do wymuszenia wpisywania do kolumny z tym ograniczeniem wartości występujących w kolumnie referencyjnej (```PRIMARY KEY```).

### Modelowanie baz danych

- ```Modelowanie baz danych``` - to procesz tworzenia modelu danych dla danych, które mają być przechowywane w bazie danych. Ten model danych jest koncepcją wizualizacyjną / reprezentacyjną obiektów danych, powiązań między różnymi obiektami oraz reguł. Jej celem jest zilustrowanie typów danych wykorzystywanych i przechowywanych w systemie, relacji między tymi typami danych i sposobów grupowania danych.

### Typy modelowania baz danych

- ```Model logiczny``` - model ten zawiera więcej szczegółów na temat koncepcji i relacji w domenie. Wskazuje atrybuty danych - ich typy i odpowiadające im długości. Pokazuje relacje pomiędzy encjami.

- ```Model fizyczny``` - model ten ukazuje sfinalizowany projekt, który można zaimplementować jako relacyjną bazę danych w tym ```klucze główne```, ```klucze obce```, ```relacje```.

