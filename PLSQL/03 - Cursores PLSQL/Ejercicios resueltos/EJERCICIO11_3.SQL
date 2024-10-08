SET SERVEROUTPUT ON;
DECLARE
	CURSOR C_LOCALIDAD IS
		SELECT ID, NOMBRE
		FROM B_LOCALIDAD;
	CURSOR C_CLIENTES (LOCALIDAD NUMBER) IS 
		SELECT 
			P.NOMBRE||' '||P.APELLIDO AS "NOM_APE",
			SUM(V.MONTO_TOTAL) AS MONTO_TOTAL	
		FROM B_PERSONAS P
		INNER JOIN B_VENTAS V ON P.ID = V.ID_CLIENTE
		WHERE P.ID_LOCALIDAD = LOCALIDAD
		GROUP BY P.NOMBRE, P.APELLIDO, V.ID_CLIENTE;
	R_CLIENTES C_CLIENTES%ROWTYPE;
	V_ERROR_CODE NUMBER;
    V_ERROR_MESSAGE VARCHAR2(255);
BEGIN
	BEGIN
		FOR R_LOCALIDAD IN C_LOCALIDAD LOOP
			DBMS_OUTPUT.PUT_LINE('CLIENTES DE LA LOCALIDAD: '||R_LOCALIDAD.NOMBRE||' ID: '||R_LOCALIDAD.ID);
			DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------');
			BEGIN
				OPEN C_CLIENTES(R_LOCALIDAD.ID);
					FETCH C_CLIENTES INTO R_CLIENTES;
					IF C_CLIENTES%FOUND THEN
						WHILE C_CLIENTES%FOUND LOOP
							DBMS_OUTPUT.PUT_LINE('	NOMBRE Y APELLIDO: '||R_CLIENTES.NOM_APE||' MONTO TOTAL DE VENTAS: '|| R_CLIENTES.MONTO_TOTAL);
							--DBMS_OUTPUT.NEW_LINE;
							FETCH C_CLIENTES INTO R_CLIENTES;
						END LOOP;
					ELSE
						DBMS_OUTPUT.PUT_LINE('	NO SE ENCONTRÓ CLIENTES EN LA LOCALIDAD: ' || R_LOCALIDAD.NOMBRE);
						--DBMS_OUTPUT.NEW_LINE;
					END IF;
				CLOSE C_CLIENTES;
			END;
		END LOOP;
	END;
EXCEPTION
	WHEN OTHERS THEN
        V_ERROR_CODE := SQLCODE;
        V_ERROR_MESSAGE := SQLERRM;
        DBMS_OUTPUT.PUT_LINE (TO_CHAR(V_ERROR_CODE)||': '|| V_ERROR_MESSAGE);
END;
/