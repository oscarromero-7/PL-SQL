SET SERVEROUTPUT ON
ACCEPT VALOR_INGRESADO NUMBER PROMPT 'Ingrese un valor: ';
DECLARE
	VALOR VARCHAR2(128);
	CANT_CIFRAS NUMBER(2);
	AUX VARCHAR2(128);
BEGIN
	DBMS_OUTPUT.ENABLE(100000);
	VALOR := TRIM(' ' FROM TO_CHAR(&VALOR_INGRESADO,'999999'));
	CANT_CIFRAS := LENGTH(VALOR) + 1;
	FOR I IN 1 .. CANT_CIFRAS LOOP
		IF CANT_CIFRAS = I + 1 AND SUBSTR(VALOR,CANT_CIFRAS - 1,1) = '0' THEN
			EXIT;
		ELSE
			AUX := RPAD(SUBSTR(VALOR, I, 1), CANT_CIFRAS - I, '00');
			DBMS_OUTPUT.PUT_LINE(LPAD(AUX, LENGTH(AUX) + I - 1, '.'));
		END IF;
	END LOOP;
END;
/