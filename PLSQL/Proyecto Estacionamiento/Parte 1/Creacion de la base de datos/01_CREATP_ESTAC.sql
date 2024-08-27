
CREATE TABLE M_FERIADOS
(
	FECHA                DATE NOT NULL 
);



COMMENT ON TABLE M_FERIADOS IS 'Tabla donde est�n los feriados (s�bados y dominingos no se cargan)';




COMMENT ON COLUMN M_FERIADOS.FECHA IS 'Fecha del feriado';



CREATE TABLE M_CARGOS
(
	COD_CARGO            NUMBER(4) NOT NULL ,
	NOMBRE_CARGO         VARCHAR2(50) NOT NULL ,
CONSTRAINT  XPKM_CARGOS PRIMARY KEY (COD_CARGO)
);



COMMENT ON TABLE M_CARGOS IS 'Cargos de administraci�n municipal';




COMMENT ON COLUMN M_CARGOS.COD_CARGO IS 'Codigo de cargo del funcionario';




COMMENT ON COLUMN M_CARGOS.NOMBRE_CARGO IS 'Nombre del cargo del funcionario';


CREATE TABLE M_LOCALIDAD
(	ID_LOCALIDAD         NUMBER(8) NOT NULL ,
	NOMBRE               VARCHAR2(40) NOT NULL ,
	NIVEL_LOCALIDAD      VARCHAR2(1) NOT NULL ,
	ID_LOCALIDAD_PADRE   NUMBER(8) NULL ,
CONSTRAINT  XPKM_LOCALIDAD PRIMARY KEY (ID_LOCALIDAD)
);



COMMENT ON TABLE M_LOCALIDAD IS 'LOCALIDAD GEOGR�FICA (DISTRITOS, BARRIOS)';




COMMENT ON COLUMN M_LOCALIDAD.NOMBRE IS 'Nombre de la localidad';




COMMENT ON COLUMN M_LOCALIDAD.ID_LOCALIDAD IS 'Identificaci�n de la localidad';




COMMENT ON COLUMN M_LOCALIDAD.ID_LOCALIDAD_PADRE IS 'Identificaci�n de la localidad padre';




COMMENT ON COLUMN M_LOCALIDAD.NIVEL_LOCALIDAD IS 'Nivel de la localidad ( (D =departamento, C= ciudad o distrito, B= barrio)';



CREATE TABLE M_MARCAS
(
	COD_MARCA            NUMBER(4) NOT NULL ,
	NOMBRE_MARCA         VARCHAR2(30) NOT NULL ,
CONSTRAINT  XPKM_MARCAS PRIMARY KEY (COD_MARCA)
);



COMMENT ON TABLE M_MARCAS IS 'Marcas de veh�culos';




COMMENT ON COLUMN M_MARCAS.COD_MARCA IS 'C�digo de la marca';




COMMENT ON COLUMN M_MARCAS.NOMBRE_MARCA IS 'Nombre de la marca';


CREATE TABLE M_PERSONAL
(
	CEDULA               NUMBER(11) NOT NULL ,
	NOMBRE               VARCHAR2(30) NOT NULL ,
	APELLIDO             VARCHAR2(30) NOT NULL ,
	FECHA_ING            DATE NOT NULL ,
	FECHA_NACIM          DATE NOT NULL ,
	TELEFONO             VARCHAR2(15) NOT NULL ,
	DIRECCION            VARCHAR2(60) NOT NULL ,
	CEDULA_JEFE          NUMBER(11) NULL,
	COD_CARGO            NUMBER(4) NULL ,
	ID_LOCALIDAD         NUMBER(8) NULL ,
CONSTRAINT  PKEMPLEADOS1 PRIMARY KEY (CEDULA)
);



COMMENT ON TABLE M_PERSONAL IS 'Personal Municipal';




COMMENT ON COLUMN M_PERSONAL.CEDULA IS 'C�dula del funcionario';




COMMENT ON COLUMN M_PERSONAL.NOMBRE IS 'Nombre del funcionario';




COMMENT ON COLUMN M_PERSONAL.APELLIDO IS 'Apellido del funcionario';




COMMENT ON COLUMN M_PERSONAL.FECHA_ING IS 'Fecha de ingreso';




COMMENT ON COLUMN M_PERSONAL.FECHA_NACIM IS 'Fecha de nacimiento';




COMMENT ON COLUMN M_PERSONAL.CEDULA_JEFE IS 'C�dula del jefe';




COMMENT ON COLUMN M_PERSONAL.TELEFONO IS 'Tel�fono particular';




COMMENT ON COLUMN M_PERSONAL.DIRECCION IS 'Direcci�n';




COMMENT ON COLUMN M_PERSONAL.COD_CARGO IS 'Codigo de cargo del funcionario';




COMMENT ON COLUMN M_PERSONAL.ID_LOCALIDAD IS 'Identificaci�n de la localidad';



CREATE TABLE M_RODADOS
(
	MATRICULA            VARCHAR2(10) NOT NULL ,
	ID_USUARIO           NUMBER(8) NOT NULL ,
	NRO_CHASIS           VARCHAR2(20) NOT NULL ,
	ANIO                 NUMBER(4) NOT NULL ,
	DESCRIPCION          VARCHAR2(20) NULL ,
	COD_MARCA            NUMBER(4) NULL ,
	HABILITACION_MUNICIPIO VARCHAR2(20) NULL ,
	COD_TIPO_RODADO      VARCHAR2(1) NULL ,
	VTO_HABILITACION     DATE NULL ,
CONSTRAINT  XPKM_RODADOS PRIMARY KEY (MATRICULA)
);



COMMENT ON TABLE M_RODADOS IS 'Contiene el registro de rodados de los usuarios';




COMMENT ON COLUMN M_RODADOS.MATRICULA IS 'N�mero de Matr�cula del veh�culo';




COMMENT ON COLUMN M_RODADOS.NRO_CHASIS IS 'N�mero de Chasis';




COMMENT ON COLUMN M_RODADOS.ANIO IS 'A�o de fabricaci�n';




COMMENT ON COLUMN M_RODADOS.DESCRIPCION IS 'Describe las caracter�sticas del rodado: Modelo, color, accesorios';




COMMENT ON COLUMN M_RODADOS.COD_MARCA IS 'C�digo de la marca';




COMMENT ON COLUMN M_RODADOS.ID_USUARIO IS 'Identificaci�n de la persona (puede no ser contribuyente)';




COMMENT ON COLUMN M_RODADOS.HABILITACION_MUNICIPIO IS 'Indica si el automotor tiene habilitaci�n del municipio- Valores posibles S (SI) y N (NO)';




COMMENT ON COLUMN M_RODADOS.COD_TIPO_RODADO IS 'C�digo del tipo de rodado (Motocicletas, veh�culos livianos, etc)';


COMMENT ON COLUMN M_RODADOS.VTO_HABILITACION IS 'Fecha de vencimiento de la habilitaci�n';


CREATE TABLE M_TARIFAS
(
	COD_TIPO_TARIFA      NUMBER(4) NOT NULL ,
	NOMBRE_TIPO          VARCHAR2(40) NULL ,
	UNIDAD_TIEMPO        VARCHAR2(1) NULL ,
	DURACION             NUMBER(6) NOT NULL ,
	COSTO_PATENTADO      NUMBER(12) NOT NULL ,
	COSTO_NOPATENTADO    NUMBER(12) NOT NULL ,
	COD_TIPO_RODADO      VARCHAR2(1) NOT NULL ,
	ES_MULTA             VARCHAR2(1) NULL ,
CONSTRAINT  XPKM_TARIFAS PRIMARY KEY (COD_TIPO_TARIFA)
);


COMMENT ON TABLE M_TARIFAS IS 'TARIFAS DE CONCEPTOS A COBRAR';


COMMENT ON COLUMN M_TARIFAS.COD_TIPO_TARIFA IS 'C�digo del tipo de tarifa';


COMMENT ON COLUMN M_TARIFAS.NOMBRE_TIPO IS 'Nombre del tipo de ticket';


COMMENT ON COLUMN M_TARIFAS.DURACION IS 'Duraci�n cuando se trata de ticket de estacionamiento (en horas)';


COMMENT ON COLUMN M_TARIFAS.COSTO_PATENTADO IS 'Costo si el veh�culo tiene patente del municipio';



COMMENT ON COLUMN M_TARIFAS.UNIDAD_TIEMPO IS 'Unidad de tiempo. Puede ser en d�as (D) o bien HORAS (H)';


COMMENT ON COLUMN M_TARIFAS.COSTO_NOPATENTADO IS 'Costo cuando el veh�culo es no patentado en el municipio';


COMMENT ON COLUMN M_TARIFAS.COD_TIPO_RODADO IS 'C�digo del tipo de rodado (Motocicletas, veh�culos livianos, etc)';


COMMENT ON COLUMN M_TARIFAS.ES_MULTA IS 'Determina si el tipo tarifa se trata o no de una multa (S/N)';



CREATE TABLE M_TIPO_RODADO
(
	COD_TIPO_RODADO      VARCHAR2(1) NOT NULL ,
	DESCRIPCION          VARCHAR2(20) NOT NULL ,
CONSTRAINT  XPKM_TIPO_RODADO PRIMARY KEY (COD_TIPO_RODADO)
);



COMMENT ON TABLE M_TIPO_RODADO IS 'Contiene los tipos de rodados';


COMMENT ON COLUMN M_TIPO_RODADO.COD_TIPO_RODADO IS 'C�digo del tipo de rodado (Motocicletas, veh�culos livianos, etc)';


COMMENT ON COLUMN M_TIPO_RODADO.DESCRIPCION IS 'Descripci�n del tipo de rodado';


CREATE TABLE M_USUARIOS
(
	ID_USUARIO           NUMBER(8) NOT NULL ,
	TIPO_PERSONA         VARCHAR2(1) NOT NULL ,
	NOMBRE               VARCHAR2(40) NOT NULL ,
	APELLIDO             VARCHAR2(40) NULL ,
	DIRECCION            VARCHAR2(40) NOT NULL ,
	TELEFONO             VARCHAR2(40) NOT NULL ,
	RUC                  VARCHAR2(12) NULL ,
	CEDULA               VARCHAR2(15) NULL ,
	ES_CONTRIBUYENTE     VARCHAR2(1) NOT NULL ,
	CORREO_ELECTRONICO   VARCHAR2(40) NOT NULL ,
	FECHA_NACIMIENTO     DATE NOT NULL ,
	ID_LOCALIDAD         NUMBER(8) NULL ,
	MONTO_MORA           NUMBER(12) NOT NULL ,
CONSTRAINT  PKPERSONAS1 PRIMARY KEY (ID_USUARIO)
);



COMMENT ON TABLE M_USUARIOS IS 'Usuarios del sistema (Contribuyentes y no contribuyentes que usan el servicio)';


COMMENT ON COLUMN M_USUARIOS.ID_USUARIO IS 'Identificaci�n de la persona (puede no ser contribuyente)';


COMMENT ON COLUMN M_USUARIOS.TIPO_PERSONA IS 'Persona F�sica (F) o Jur�dica (J)';


COMMENT ON COLUMN M_USUARIOS.NOMBRE IS 'Nombre de la persona';


COMMENT ON COLUMN M_USUARIOS.APELLIDO IS 'Apellido de la persona';


COMMENT ON COLUMN M_USUARIOS.DIRECCION IS 'Direcci�n';


COMMENT ON COLUMN M_USUARIOS.TELEFONO IS 'Tel�fono';


COMMENT ON COLUMN M_USUARIOS.RUC IS 'RUC (Incluye el GUI�N)';


COMMENT ON COLUMN M_USUARIOS.CEDULA IS 'C�dula de la persona';


COMMENT ON COLUMN M_USUARIOS.CORREO_ELECTRONICO IS 'Correo electr�nico';


COMMENT ON COLUMN M_USUARIOS.FECHA_NACIMIENTO IS 'Fecha de nacimiento';

COMMENT ON COLUMN M_USUARIOS.ID_LOCALIDAD IS 'Identificaci�n de la localidad';


COMMENT ON COLUMN M_USUARIOS.ES_CONTRIBUYENTE IS 'Indica sl la persona es contribuyente (Valores posibles S y N)';


COMMENT ON COLUMN M_USUARIOS.MONTO_MORA IS 'Si es contribuyente, y tiene mora, se acumula en este campo';

CREATE TABLE M_ZONAS
(
	ID_LOCALIDAD         NUMBER(8) NOT NULL ,
	DIA                  VARCHAR2(3) NOT NULL ,
	HORARIO_INICIAL      VARCHAR2(5) NULL ,
	HORARIO_FINAL        VARCHAR2(5) NULL ,
CONSTRAINT  XPKM_ZONAS PRIMARY KEY (ID_LOCALIDAD,DIA)
);


COMMENT ON TABLE M_ZONAS IS 'Zonas geogr�ficas de demarcaci�n del estacionamiento.';


COMMENT ON COLUMN M_ZONAS.ID_LOCALIDAD IS 'Identificaci�n de la localidad';


COMMENT ON COLUMN M_ZONAS.HORARIO_INICIAL IS 'Horario inicial en el formato ''HH:MM'' (EJ: 08:00)';


COMMENT ON COLUMN M_ZONAS.HORARIO_FINAL IS 'Horario final en el formato ''HH:MM'' (Ejemplo 20:00)';


COMMENT ON COLUMN M_ZONAS.DIA IS 'D�a de la semana. Son 3 letras:';


ALTER TABLE M_LOCALIDAD
	ADD (CONSTRAINT R_LOCAL_LOCALHIJA FOREIGN KEY (ID_LOCALIDAD_PADRE) REFERENCES M_LOCALIDAD (ID_LOCALIDAD));


ALTER TABLE M_PERSONAL
	ADD (CONSTRAINT R_JEFE_EMPLEADO1 FOREIGN KEY (CEDULA_JEFE) REFERENCES M_PERSONAL (CEDULA));



ALTER TABLE M_PERSONAL
	ADD (CONSTRAINT R_CARGOS_PERSONAL FOREIGN KEY (COD_CARGO) REFERENCES M_CARGOS (COD_CARGO));



ALTER TABLE M_PERSONAL
	ADD (CONSTRAINT R_LOCALIDAD_PERSONAL FOREIGN KEY (ID_LOCALIDAD) REFERENCES M_LOCALIDAD (ID_LOCALIDAD));



ALTER TABLE M_RODADOS
	ADD (CONSTRAINT R_MARCA_RODADO FOREIGN KEY (COD_MARCA) REFERENCES M_MARCAS (COD_MARCA));



ALTER TABLE M_RODADOS
	ADD (CONSTRAINT R_CONTRIBUYENTE_ROD FOREIGN KEY (ID_USUARIO) REFERENCES M_USUARIOS (ID_USUARIO));



ALTER TABLE M_RODADOS
	ADD (CONSTRAINT R_TIPO_RODADO FOREIGN KEY (COD_TIPO_RODADO) REFERENCES M_TIPO_RODADO (COD_TIPO_RODADO));



ALTER TABLE M_TARIFAS
	ADD (CONSTRAINT R_TIPORODADO_TICKET FOREIGN KEY (COD_TIPO_RODADO) REFERENCES M_TIPO_RODADO (COD_TIPO_RODADO));



ALTER TABLE M_USUARIOS
	ADD (CONSTRAINT R_LOCAL_CONTRIBUYENTE FOREIGN KEY (ID_LOCALIDAD) REFERENCES M_LOCALIDAD (ID_LOCALIDAD));



ALTER TABLE M_ZONAS
	ADD (CONSTRAINT R_LOCALIDAD_ZONAS FOREIGN KEY (ID_LOCALIDAD) REFERENCES M_LOCALIDAD (ID_LOCALIDAD));


