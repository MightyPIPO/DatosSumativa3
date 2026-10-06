--Caso 1: Implementación del modelo

CREATE TABLE AUTOMOVIL 
    ( 
     patente       CHAR (8)  NOT NULL , 
     annio         NUMBER (4)  NOT NULL , 
     cant_puertas  NUMBER (1)  NOT NULL , 
     "k m"         NUMBER (6)  NOT NULL , 
     color         VARCHAR2 (30)  NOT NULL , 
     cod_tipo_auto CHAR (3)  NOT NULL , 
     cod_modelo    NUMBER (5)  NOT NULL , 
     cod_marca     NUMBER (2)  NOT NULL , 
     cl_rut        NUMBER (8)  NOT NULL 
    ) 
;

ALTER TABLE AUTOMOVIL 
    ADD CONSTRAINT AUTOMOVIL_PK PRIMARY KEY ( patente ) ;

CREATE TABLE CIUDAD 
    ( 
     id_ciudad  NUMBER (3)  NOT NULL , 
     nom_ciudad VARCHAR2 (30)  NOT NULL , 
     cod_pais   NUMBER (3)  NOT NULL 
    ) 
;

ALTER TABLE CIUDAD 
    ADD CONSTRAINT CIUDAD_PK PRIMARY KEY ( id_ciudad ) ;

CREATE TABLE CLIENTE 
    ( 
     rut      NUMBER (8)  NOT NULL , 
     dv       CHAR (1)  NOT NULL , 
     pnombre  VARCHAR2 (20)  NOT NULL , 
     snombre  VARCHAR2 (20) , 
     apaterno VARCHAR2 (20)  NOT NULL , 
     amaterno VARCHAR2 (20)  NOT NULL , 
     telefono VARCHAR2 (12) , 
     email    VARCHAR2 (40) , 
     tipo_cli CHAR (1)  NOT NULL 
    ) 
;

ALTER TABLE CLIENTE 
    ADD CONSTRAINT CLIENTE_PK PRIMARY KEY ( rut ) ;

CREATE TABLE DETALLE_SERVICIO 
    ( 
     mantencion_num NUMBER (4)  NOT NULL , 
     cod_servicio   NUMBER (3)  NOT NULL , 
     descuento_serv NUMBER (4,3)  NOT NULL , 
     cantidad       NUMBER (3)  NOT NULL 
    ) 
;

ALTER TABLE DETALLE_SERVICIO 
    ADD CONSTRAINT DETALLE_SERVICIO_PK PRIMARY KEY ( mantencion_num, cod_servicio ) ;

CREATE TABLE ESTANDAR 
    ( 
     cl_rut            NUMBER (8)  NOT NULL , 
     puntaje_fidelidad NUMBER (10)  NOT NULL 
    ) 
;

ALTER TABLE ESTANDAR 
    ADD CONSTRAINT ESTANDAR_PK PRIMARY KEY ( cl_rut ) ;

CREATE TABLE MANTENCION 
    ( 
     num_mantencion NUMBER (4)  NOT NULL , 
     cod_sucursal   CHAR (3)  NOT NULL , 
     fecha_ingreso  DATE  NOT NULL , 
     fecha_salida   DATE , 
     patente_auto   CHAR (8) , 
     cod_mecanico   NUMBER (5)  NOT NULL , 
     costo_total    NUMBER (7)  NOT NULL , 
     estado         VARCHAR2 (15) 
    ) 
;

ALTER TABLE MANTENCION 
    ADD CONSTRAINT MANTENCION_PK PRIMARY KEY ( num_mantencion ) ;

CREATE TABLE MARCA 
    ( 
     id_marca    NUMBER (2)  NOT NULL , 
     descripcion VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE MARCA 
    ADD CONSTRAINT MARCA_PK PRIMARY KEY ( id_marca ) ;

CREATE TABLE MECANICO 
    ( 
     cod_mecanico          NUMBER (5)  NOT NULL , 
     pnombre               VARCHAR2 (20)  NOT NULL , 
     snombre               VARCHAR2 (20)  NOT NULL , 
     apaterno              VARCHAR2 (20)  NOT NULL , 
     amaterno              VARCHAR2 (20)  NOT NULL , 
     bono_jefatura         NUMBER (10) , 
     sueldo                NUMBER (10)  NOT NULL , 
     monto_impuestos       NCHAR (10)  NOT NULL , 
     MECANICO_cod_mecanico NUMBER (5) 
    ) 
;

ALTER TABLE MECANICO 
    ADD CONSTRAINT MECANICO_PK PRIMARY KEY ( cod_mecanico ) ;

CREATE TABLE MODELO 
    ( 
     id_modelo   NUMBER (5)  NOT NULL , 
     marca_id    NUMBER (2)  NOT NULL , 
     descripcion VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE MODELO 
    ADD CONSTRAINT MODELO_PK PRIMARY KEY ( id_modelo, marca_id ) ;

CREATE TABLE PAIS 
    ( 
     id_pais  NUMBER (3)  NOT NULL , 
     nom_pais VARCHAR2 (30)  NOT NULL 
    ) 
;

ALTER TABLE PAIS 
    ADD CONSTRAINT PAIS_PK PRIMARY KEY ( id_pais ) ;

CREATE TABLE PREMIUM 
    ( 
     cl_rut         NUMBER (8)  NOT NULL , 
     pesos_clientes NUMBER (10)  NOT NULL , 
     monto_credito  NUMBER (10) 
    ) 
;

ALTER TABLE PREMIUM 
    ADD CONSTRAINT PREMIUM_PK PRIMARY KEY ( cl_rut ) ;

CREATE TABLE SERVICIO 
    ( 
     id_servicio NUMBER (3)  NOT NULL , 
     descripcion VARCHAR2 (100)  NOT NULL , 
     costo       NUMBER (7)  NOT NULL 
    ) 
;

ALTER TABLE SERVICIO 
    ADD CONSTRAINT SERVICIO_PK PRIMARY KEY ( id_servicio ) ;

CREATE TABLE SUCURSAL 
    ( 
     id_sucursal  CHAR (3)  NOT NULL , 
     nom_sucursal VARCHAR2 (20)  NOT NULL , 
     calle        VARCHAR2 (20)  NOT NULL , 
     num_calle    NUMBER (4)  NOT NULL , 
     cod_ciudad   NUMBER (3)  NOT NULL 
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT SUCURSAL_PK PRIMARY KEY ( id_sucursal ) ;

CREATE TABLE TIPO_AUTOMOVIL 
    ( 
     id_tipo     CHAR (3)  NOT NULL , 
     descripcion VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE TIPO_AUTOMOVIL 
    ADD CONSTRAINT TIPO_AUTOMOVIL_PK PRIMARY KEY ( id_tipo ) ;

ALTER TABLE ESTANDAR 
    ADD CONSTRAINT cl_rut FOREIGN KEY 
    ( 
     cl_rut
    ) 
    REFERENCES CLIENTE 
    ( 
     rut
    ) 
;

ALTER TABLE PREMIUM 
    ADD CONSTRAINT cl_rutv2 FOREIGN KEY 
    ( 
     cl_rut
    ) 
    REFERENCES CLIENTE 
    ( 
     rut
    ) 
;

ALTER TABLE AUTOMOVIL 
    ADD CONSTRAINT cl_rutv3 FOREIGN KEY 
    ( 
     cl_rut
    ) 
    REFERENCES CLIENTE 
    ( 
     rut
    ) 
;

ALTER TABLE SUCURSAL 
    ADD CONSTRAINT cod_ciudad FOREIGN KEY 
    ( 
     cod_ciudad
    ) 
    REFERENCES CIUDAD 
    ( 
     id_ciudad
    ) 
;

ALTER TABLE MANTENCION 
    ADD CONSTRAINT cod_mecanico FOREIGN KEY 
    ( 
     cod_mecanico
    ) 
    REFERENCES MECANICO 
    ( 
     cod_mecanico
    ) 
;

ALTER TABLE AUTOMOVIL 
    ADD CONSTRAINT cod_modelo FOREIGN KEY 
    ( 
     cod_modelo,
     cod_marca
    ) 
    REFERENCES MODELO 
    ( 
     id_modelo,
     marca_id
    ) 
;

ALTER TABLE CIUDAD 
    ADD CONSTRAINT cod_pais FOREIGN KEY 
    ( 
     cod_pais
    ) 
    REFERENCES PAIS 
    ( 
     id_pais
    ) 
;

ALTER TABLE DETALLE_SERVICIO 
    ADD CONSTRAINT cod_servicio FOREIGN KEY 
    ( 
     cod_servicio
    ) 
    REFERENCES SERVICIO 
    ( 
     id_servicio
    ) 
;

ALTER TABLE MECANICO 
    ADD CONSTRAINT cod_supervisor FOREIGN KEY 
    ( 
     MECANICO_cod_mecanico
    ) 
    REFERENCES MECANICO 
    ( 
     cod_mecanico
    ) 
;

ALTER TABLE AUTOMOVIL 
    ADD CONSTRAINT cod_tipo_auto FOREIGN KEY 
    ( 
     cod_tipo_auto
    ) 
    REFERENCES TIPO_AUTOMOVIL 
    ( 
     id_tipo
    ) 
;

ALTER TABLE MANTENCION 
    ADD CONSTRAINT id_sucursal FOREIGN KEY 
    ( 
     cod_sucursal
    ) 
    REFERENCES SUCURSAL 
    ( 
     id_sucursal
    ) 
;

ALTER TABLE DETALLE_SERVICIO 
    ADD CONSTRAINT mantencion_num FOREIGN KEY 
    ( 
     mantencion_num
    ) 
    REFERENCES MANTENCION 
    ( 
     num_mantencion
    ) 
;

ALTER TABLE MODELO 
    ADD CONSTRAINT marca_id FOREIGN KEY 
    ( 
     marca_id
    ) 
    REFERENCES MARCA 
    ( 
     id_marca
    ) 
;

ALTER TABLE MANTENCION 
    ADD CONSTRAINT patente_auto FOREIGN KEY 
    ( 
     patente_auto
    ) 
    REFERENCES AUTOMOVIL 
    ( 
     patente
    ) 
;

-- Caso 2: Modificación del modelo

-- PUNTO 1
ALTER TABLE MANTENCION
DROP COLUMN costo_total;

-- PUNTO 2


-- PUNTO 3
ALTER TABLE CLIENTE
ADD UNIQUE (email);

-- PUNTO 4


-- PUNTO 5
ALTER TABLE MECANICO
ADD CHECK (sueldo >= 510000);

-- Caso 3: Poblamiento del modelo

CREATE SEQUENCE secuencia_id_servicio
START WITH 400
INCREMENT BY 2
MINVALUE 400
MAXVALUE 408
cycle;

INSERT INTO SERVICIO (id_servicio, descripcion, costo)
VALUES 
(secuencia_id_servicio.NEXTVAL, 'Cambio Luces', 45000),
(secuencia_id_servicio.NEXTVAL, 'Desabolladura', 67000),
(secuencia_id_servicio.NEXTVAL, 'Revision Frenos', 30000),
(secuencia_id_servicio.NEXTVAL, 'Cambio Puerta Trasera', 50000);

CREATE SEQUENCE secuencia_id_ciudad
START WITH 165
INCREMENT BY 5
MINVALUE 165
MAXVALUE 175
cycle;

INSERT INTO CIUDAD (id_ciudad, nom_ciudad, cod_pais)
VALUES
(secuencia_id_ciudad.NEXTVAL, 'Santiago', 9),
(secuencia_id_ciudad.NEXTVAL, 'Lima',    12),
(secuencia_id_ciudad.NEXTVAL, 'Bogota',  15);

INSERT INTO MECANICO (cod_mecanico, pnombre, snombre, apaterno, amaterno, bono_jefatura, sueldo, monto_impuestos, MECANICO_cod_mecanico)
VALUES
(460,'Jorge','Pablo','Soto','Sierpe',5400000,2759000,223580,null),
(467,'Pedro','Jose','Manriquez','Corral',null,759000,23980,null),
(474,'Sandra','Josefa','Letelier','S.',0,659000,22358,460),
(481,'Felipe','M.','Vidal','A.',null,759000,23580,460),
(488,'Jose','Miguel','Troncoso','B.',null,659000,44580,474),
(495,'Juan','Pablo','Sanchez','R.',null,859000,23380,474),
(502,'Carlos','Felipe','Soto','J.',0,597000,23580,474),
(509,'Alberto','P.','Cerda','Ramirez',null,55900,22380,460),
(516,'Alejandra','Gabriela','Infanti','R.',null,659000,22380,460),
(523,'Roberto','Patricio','Gutierrez','Sosa',null,859000,22380,460);

INSERT INTO MANTENCION (num_mantencion, cod_sucursal, fecha_ingreso, fecha_salida, patente_auto, cod_mecanico, estado)
VALUES
(101,'S01',12-04-2023,null,null,481,'Reserva'),
(102,'S02',21-02-2023,21-02-2023,null,502,'Entregado'),
(103,'S02',09-10-2023,null,null,502,'Anulado'),
(104,'S03',11-08-2023,18-08-2023,null,509,'Entregado'),
(105,'S03',03-12-2023,null,null,509,'Ingresado');

INSERT INTO SUCURSAL (id_sucursal, nom_sucursal, calle, num_calle, cod_ciudad)
VALUES
('S01','Providencia','Av. A. Varas',234,165),
('S02','Las 4 esquinas','Av. Latina',669,170),
('S03','El Cafetero','Av. El Faro',900,175);

INSERT INTO PAIS (id_pais, nom_pais)
VALUES
(9,'Chile'),
(12,'Peru'),
(15,'Colombia');

-- Caso 4: Recuperación de Datos

SELECT cod_mecanico, pnombre+' '+snombre+' '+apaterno+' '+amaterno, sueldo, monto_impuestos, monto_impuestos*0.8, sueldo-(monto_impuestos*0.8)