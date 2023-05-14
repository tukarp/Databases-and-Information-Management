-- Zestaw 12 - PL/SQL – procedury, funkcje, pakiety
-- Zadanie 1
PROCEDURE add_emp (
    in_last_name      emp.last_name%TYPE,
    in_first_name     emp.first_name%TYPE,
    in_userid         emp.userid%TYPE,
    in_start_date     emp.start_date%TYPE,
    in_manager_id     emp.manager_id%TYPE,
    in_title          emp.title%TYPE,
    in_dept_id        emp.dept_id%TYPE,
    in_salary         emp.salary%TYPE,
    in_commission_pct emp.commission_pct%TYPE
) IS
    uv_last_name_null EXCEPTION;
BEGIN
    IF in_last_name IS NULL THEN
        RAISE uv_last_name_null;
    END IF;
    INSERT INTO emp (
        id,
        last_name,
        first_name,
        userid,
        start_date,
        manager_id,
        title,
        dept_id,
        salary,
        commission_pct
    )
    SELECT
        emp_id_sequence.NEXTVAL,
        in_last_name,
        in_first_name,
        in_userid,
        in_start_date,
        in_manager_id,
        in_title,
        in_dept_id,
        in_salary,
        in_commission_pct
    FROM
        emp;
    EXCEPTION
        WHEN uv_last_name_null THEN
            DBMS_OUTPUT.PUT_LINE('LAST NAME NULL EXCEPTION');
        WHEN value_error THEN
            DBMS_OUTPUT.PUT_LINE('VALUE ERROR');
END add_emp;

-- Zadanie 2
PROCEDURE change_emp (
    in_id             emp.id%TYPE,
    in_last_name      emp.last_name%TYPE,
    in_first_name     emp.first_name%TYPE,
    in_userid         emp.userid%TYPE,
    in_start_date     emp.start_date%TYPE,
    in_manager_id     emp.manager_id%TYPE,
    in_title          emp.title%TYPE,
    in_dept_id        emp.dept_id%TYPE,
    in_salary         emp.salary%TYPE,
    in_commission_pct emp.commission_pct%TYPE
) IS
    uv_last_name_null EXCEPTION;
BEGIN
    IF in_last_name IS NULL THEN
        RAISE uv_last_name_null;
    END IF;
    UPDATE
        emp
    SET
        last_name      = in_last_name,
        first_name     = in_first_name,
        userid         = in_userid,
        start_date     = in_start_date,
        manager_id     = in_manager_id,
        title          = in_title,
        dept_id        = in_dept_id,
        salary         = in_salary,
        commission_pct = in_commission_pct
    WHERE
        id = in_id;
    EXCEPTION
        WHEN uv_last_name_null THEN
            DBMS_OUTPUT.PUT_LINE('LAST NAME NULL EXCEPTION');
        WHEN value_error THEN
            DBMS_OUTPUT.PUT_LINE('VALUE ERROR');
END change_emp;

-- Zadanie 3
PROCEDURE delete_emp (
    in_id emp.id%TYPE
) IS
BEGIN
    DELETE FROM emp
    WHERE
        id = in_id;
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('NO DATA FOUND EXCEPTION');
END delete_emp;

-- Zadanie 4
PROCEDURE change_salary (
    in_id      emp.id%TYPE,
    in_percent NUMBER
) IS
BEGIN
    UPDATE emp
    SET
        salary = (salary + ((in_percent / 100) * salary))
    WHERE
        id = in_id;
END change_salary;

-- Zadanie 5
PROCEDURE emp_top_n (
    in_n NUMBER
) IS
    uv_last_name  emp.last_name%TYPE;
    uv_first_name emp.first_name%TYPE;
    uv_salary     emp.salary%TYPE;
    CURSOR c_top_n IS
    SELECT
        last_name,
        first_name,
        salary
    FROM
        (SELECT
            last_name,
            first_name,
            salary
        FROM
            emp
        ORDER BY
            salary DESC)
        WHERE
            ROWNUM <= in_n;
    BEGIN
        OPEN c_top_n;
        LOOP
            FETCH c_top_n INTO
                uv_last_name,
                uv_first_name,
                uv_salary;
            EXIT WHEN c_top_n%notfound;
            DBMS_OUTPUT.PUT_LINE(uv_last_name || ' ' || uv_first_name || ' ' || uv_salary);
            INSERT INTO emp_top_n (
                last_name,
                first_name,
                salary
            )
            SELECT
                uv_last_name,
                uv_first_name,
                uv_salary
            FROM
                emp_top_n;
        END LOOP;
        CLOSE c_top_n;
    EXCEPTION
        WHEN no_data_found THEN
            DBMS_OUTPUT.PUT_LINE('NO DATA FOUND EXCEPTION');
END emp_top_n;

-- Zadanie 6
PROCEDURE change_dept (
    in_id      emp.id%TYPE,
    in_dept_id emp.dept_id%TYPE
) IS
UPDATE emp
    SET
        dept_id = in_dept_id
    WHERE
        id = in_id;
    EXCEPTION
        WHEN uv_deptid_not_exist THEN
            DBMS_OUTPUT.PUT_LINE('DEPT_ID NOT EXIST EXCEPTION');
END change_dept;

-- Zadanie 7
FUNCTION stat_emp(in_parameter VARCHAR2) RETURN NUMBER
AS
    uv_value emp.salary%TYPE;
BEGIN
    IF in_parameter = 'MAX' THEN
        SELECT MAX(salary)
        INTO uv_value
        FROM emp;
    ELSIF in_parameter = 'MIN' THEN
        SELECT MIN(salary)
        INTO uv_value
        FROM emp;
    ELSIF in_parameter = 'SUM' THEN
        SELECT SUM(salary)
        INTO uv_value
        FROM emp;
    ELSIF in_parameter = 'AVG' THEN
        SELECT AVG(salary)
        INTO uv_value
        FROM emp;
    ELSE
        DBMS_OUTPUT.PUT_LINE('WRONG PARAMETERS');
        uv_value := NULL;
END IF;
RETURN uv_value;
EXCEPTION
    WHEN no_data_found THEN
        DBMS_OUTPUT.PUT_LINE('NO DATA FOUND EXCEPTION');
END stat_emp;
