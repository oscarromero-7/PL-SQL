CREATE OR REPLACE FUNCTION F_FACTORIAL (I_NUMERO IN NUMBER) RETURN NUMBER IS
	RESULTADO NUMBER;
	BEGIN
		IF I_NUMERO >= 0 THEN
			IF I_NUMERO = 0 THEN
				RETURN 1;
			ELSE
				RETURN (I_NUMERO * F_FACTORIAL(I_NUMERO - 1));
			END IF;
		ELSE
			DBMS_OUTPUT.PUT_LINE('NO SE PERIMITEN NUMEROS NEGATIVOS');
			 RAISE_APPLICATION_ERROR(-20001, 'NO SE PERMITEN NUMEROS NEGATIVOS');
			 RETURN -1;
		END IF;
	EXCEPTION
			WHEN OTHERS THEN
			-- Manejo de otras excepciones
			DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE || ' - ' || SQLERRM);
			RETURN -1;
	END;
	/
	
	--SHOW ERRORS FUNCTION F_FACTORIAL; ---> PARA VER ERRORES
	--SELECT F_FACTORIAL(5)
	--FROM DUAL;
	
CREATE OR REPLACE FUNCTION F_FIBONACCI(I_NUMERO IN NUMBER) RETURN NUMBER IS
BEGIN
    IF I_NUMERO >= 0 THEN
        IF I_NUMERO = 0 THEN
            RETURN 1;
        ELSIF I_NUMERO = 1 THEN
            RETURN 1;
        ELSE
            RETURN ((F_FIBONACCI(I_NUMERO - 1)) + (F_FIBONACCI(I_NUMERO - 2)));
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('NO SE PERMITEN NUMEROS NEGATIVOS');
        RAISE_APPLICATION_ERROR(-20001, 'NO SE PERMITEN NUMEROS NEGATIVOS');
        RETURN -1;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        -- Manejo de otras excepciones
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLCODE || ' - ' || SQLERRM);
        RETURN -1;
END;
/
--SELECT F_FIBONACCI(6) FROM DUAL; PRUEBA
--SHOW ERRORS FUNCTION F_FIBONACCI; ---> PARA VER ERRORES