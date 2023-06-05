-- Bazy Danych i Zarządzanie Informacją
-- Zestaw 11 - Wstęp do języka PL/SQL
SET SERVEROUTPUT ON;

-- Zadanie 1
DECLARE
    a NUMBER := 5;
    b CONSTANT VARCHAR2(3) := 'abc';
    c DATE := to_date('12-06-2022', 'DD/MM/YYYY');
BEGIN
    DBMS_OUTPUT.PUT_LINE('a = '||a);
    DBMS_OUTPUT.PUT_LINE('b = '||b);
    DBMS_OUTPUT.PUT_LINE('c = '||c);
END;

-- Zadanie 2
DECLARE
    birthday DATE := to_date('29-05-2002', 'DD/MM/YYYY');
    today DATE := SYSDATE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Od Urodzin Minelo: ');
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(FLOOR(today - birthday) / 365) || 'Lat'     );
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(FLOOR(today - birthday) / 7)   || 'Tygodni' );
    DBMS_OUTPUT.PUT_LINE(TO_CHAR(FLOOR(today - birthday))       || 'Dni'     );
END;

-- Zadanie 3
DECLARE
    uv_last_name    emp_last_name%TYPE;
    uv_first_name   emp.first_name%TYPE;
    counter         PLS_INTEGER; 
BEGIN
    SELECT
        first_name,
        last_name
    INTO
        uv_first_name,
        uv_last_name
    FROM
        emp
    WHERE
        salary = (SELECT MAX(salary) FROM emp);
    
    DBMS_OUTPUT.PUT_LINE('Najwieksza Pensja: ' || uv_first_name || ' ' || uv_last_name);

    SELECT
        first_name,
        last_name
    INTO
        uv_first_name,
        uv_last_name
    FROM
        emp
    WHERE
        salary = (SELECT MIN(salary) FROM emp);

    DBMS_OUTPUT.PUT_LINE('Najmniejsza Pensja: ' || uv_first_name || ' ' || uv_last_name );

    EXCEPTION
    WHEN 
        NO_DATA_FOUND 
    THEN
        DBMS_OUTPUT.PUT_LINE('Zapytanie nie zwróciło danych.');
    WHEN
        TOO_MANY_ROWS
    THEN
        SELECT
            COUNT(*)
        INTO
            counter
        FROM
            emp;
    DBMS_OUTPUT.PUT_LINE('Zapytanie zwróciło ' || counter || ' rekordów.');
END;

-- Zadanie 4
-- Zadanie 4a
DECLARE
    imie        VARCHAR2(25);
    nazwisko    VARCHAR2(25);
    CURSOR i IS
    SELECT
        first_name,
        last_name
    FROM
        emp;
BEGIN
    OPEN i;
    LOOP
        FETCH i INTO
            imie,
            nazwisko;
        DBMS_OUTPUT.PUT_LINE(i%ROWCOUNT || ' ' || imie || ' ' || nazwisko);
        EXIT WHEN i%NOTFOUND;
    END LOOP;
    CLOSE i;
END;

-- Zadanie 4b
DECLARE
    CURSOR i IS
    SELECT
        *
    FROM
        emp
    ORDER BY
        first_name;
BEGIN
    FOR uv_emp in i
    LOOP
        DBMS_OUTPUT.PUT_LINE(uv_emp.first_name || ' ' || uv_emp.last_name);
    END LOOP;
END;

-- Zadanie 5
DECLARE
    -- Daty
	uv_from                 DATE := TO_DATE('31/08/1992', 'DD/MM/YYYY');
	uv_to                   DATE := TO_DATE('05/09/1992', 'DD/MM/YYYY');

    -- ID
	uv_id                   ord.id%TYPE;
	uv_customer_id          ord.customer_id%TYPE;
	uv_sales_rep_id         ord.sales_rep_id%TYPE;

    -- Daty zamówienia i wysyłki
	uv_date_ordered         ord.date_ordered%TYPE;
	uv_date_shipped         ord.date_shipped%TYPE;

    -- Ilość zamówień
	uv_total                ord.total%TYPE;

    -- Dane klienta
	uv_customer_name        customer.name%TYPE;

    -- Dane opiekuna zamówienia
	uv_sales_rep_name       emp.first_name%TYPE;
	uv_sales_rep_last_name  emp.last_name%TYPE;

	CURSOR i IS
	SELECT
        id, customer_id, sales_rep_id, date_ordered, date_shipped, total
	FROM
        ord
    WHERE
        date_ordered > uv_from
    AND date_ordered < uv_to
    ORDER BY
        id;
BEGIN
	OPEN i;
	LOOP
	    FETCH i INTO
            uv_id,
            uv_customer_id,
            uv_sales_rep_id,
            uv_date_ordered,
            uv_date_shipped,
            uv_total;
	    EXIT WHEN i%NOTFOUND;
	SELECT
        first_name,
        last_name 
	INTO
        uv_sales_rep_name,
        uv_sales_rep_last_name
	FROM
        emp
    WHERE
        id = uv_sales_rep_id;
	SELECT
        name 
	INTO
        uv_customer_name
	FROM
        customer
    WHERE
        id =  uv_customer_id;
    
	DBMS_OUTPUT.PUT_LINE(i%ROWCOUNT || 'ID:' || uv_id || 'Imie:' || uv_customer_name || 'Data Zamowienia:' || uv_date_ordered || 'Data Przyjazdu:' || uv_date_shipped || 'Reprezentant:' || uv_sales_rep_name || ' ' || uv_sales_rep_last_name || 'Koszt:' || uv_total);
	END LOOP;
	CLOSE i;
END;

-- Zadanie 6
DECLARE
    uv_avg NUMBER;
BEGIN
    SELECT
        AVG(salary)
    INTO
        uv_avg
    FROM
        emp_new;
    FOR i IN (SELECT * FROM emp ORDER BY salary)
    LOOP
        IF(i.salary < uv_avg / 2) THEN
            UPDATE
                emp_new SET salary = (salary * 1.2)
            WHERE
                id = i.id;
        ELSIF((i.salary <= uv_avg / 2) AND (i.salary > uv_avg * (5/6))) THEN
            UPDATE
                emp_new SET salary = (salary * 1.1)
            WHERE
                id = i.id;
        ELSE
            UPDATE
                emp_new SET salary = (salary * 1.05)
            WHERE
                id = i.id;
        END IF;
    END LOOP;
END;
