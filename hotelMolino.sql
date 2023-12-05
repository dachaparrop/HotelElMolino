-- -----------------------------------------------------
-- Hotel El Molino
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS hotel;
CREATE SCHEMA hotel;
USE hotel;

DROP TABLE IF EXISTS trabajador_aseo;
DROP TABLE IF EXISTS trabajador_cuidador;
DROP TABLE IF EXISTS trabajador_celador;
DROP TABLE IF EXISTS trabajador_administrador_inventario;
DROP TABLE IF EXISTS trabajador_atencion_cliente;
DROP TABLE IF EXISTS trabajador_administrador_jefe;
DROP TABLE IF EXISTS trabajador_administrador_reservas;
DROP TABLE IF EXISTS trabajador_administrador_jefe_de;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS mascota;
DROP TABLE IF EXISTS cuidador_cuida_mascota;
DROP TABLE IF EXISTS cabaña;
DROP TABLE IF EXISTS trabajador_asea_cabaña;
DROP TABLE IF EXISTS parqueadero;
DROP TABLE IF EXISTS servicio;
DROP TABLE IF EXISTS sugerencia;
DROP TABLE IF EXISTS reserva;
DROP TABLE IF EXISTS registro_paseos;
DROP TABLE IF EXISTS historial_inventario;
DROP TABLE IF EXISTS historial_empleados;
DROP TABLE IF EXISTS reserva_has_cabañas;
DROP TABLE IF EXISTS inventario;
DROP TABLE IF EXISTS cabaña_has_servicio;

-- -----------------------------------------------------
-- Tabla trabajador_aseo
-- -----------------------------------------------------
CREATE TABLE trabajador_aseo
(
  tra_id BIGINT NOT NULL PRIMARY KEY,
  tra_nombre VARCHAR(45) NOT NULL,
  tra_apellido VARCHAR(45) NOT NULL,
  tra_telefono BIGINT NOT NULL,
  tra_jornada ENUM("Entre semana", "Fin de semana") NOT NULL
);

-- -----------------------------------------------------
-- Tabla trabajador_cuidador
-- -----------------------------------------------------
CREATE TABLE trabajador_cuidador
(
  tra_id BIGINT NOT NULL PRIMARY KEY,
  tra_nombre VARCHAR(45) NOT NULL,
  tra_apellido VARCHAR(45) NOT NULL,
  tra_telefono BIGINT NOT NULL,
  tra_jornada ENUM("Entre semana", "Fin de semana") NOT NULL
);

-- -----------------------------------------------------
-- Tabla trabajador_celador
-- -----------------------------------------------------
CREATE TABLE trabajador_celador
(
  tra_id BIGINT NOT NULL PRIMARY KEY,
  tra_nombre VARCHAR(45) NOT NULL,
  tra_apellido VARCHAR(45) NOT NULL,
  tra_telefono BIGINT NOT NULL,
  tra_jornada ENUM("diurna", "nocturna") NOT NULL
);

-- -----------------------------------------------------
-- Tabla trabajador_administrador_inventario
-- -----------------------------------------------------
CREATE TABLE trabajador_administrador_inventario
(
  tra_id BIGINT NOT NULL PRIMARY KEY,
  tra_nombre VARCHAR(45) NOT NULL,
  tra_apellido VARCHAR(45) NOT NULL,
  tra_telefono BIGINT NOT NULL,
  tra_jornada ENUM("Entre semana", "Fin de semana") NOT NULL
);

-- -----------------------------------------------------
-- Tabla trabajador_atencion_cliente
-- -----------------------------------------------------
CREATE TABLE trabajador_atencion_cliente
(
  tra_id BIGINT NOT NULL PRIMARY KEY,
  tra_nombre VARCHAR(45) NOT NULL,
  tra_apellido VARCHAR(45) NOT NULL,
  tra_telefono BIGINT NOT NULL,
  tra_jornada ENUM("Entre semana", "Fin de semana") NOT NULL
);

-- -----------------------------------------------------
-- Tabla trabajador_administrador_jefe
-- -----------------------------------------------------
CREATE TABLE trabajador_administrador_jefe
(
  tra_id BIGINT NOT NULL PRIMARY KEY,
  tra_nombre VARCHAR(45) NOT NULL,
  tra_apellido VARCHAR(45) NOT NULL,
  tra_telefono BIGINT NOT NULL,
  tra_jornada ENUM("diurna", "nocturna") NOT NULL
);

-- -----------------------------------------------------
-- Tabla trabajador_administrador_reservas
-- -----------------------------------------------------
CREATE TABLE trabajador_administrador_reservas
(
  tra_id BIGINT NOT NULL PRIMARY KEY,
  tra_nombre VARCHAR(45) NOT NULL,
  tra_apellido VARCHAR(45) NOT NULL,
  tra_telefono BIGINT NOT NULL,
  tra_jornada ENUM("diurna", "nocturna") NOT NULL
);

-- -----------------------------------------------------
-- Tabla trabajador_administrador_jefe_de
-- -----------------------------------------------------
CREATE TABLE trabajador_administrador_jefe_de
(
  trabajador_administrador_id BIGINT NOT NULL REFERENCES trabajador_administrador_jefe(tra_id),
  trabajador_id BIGINT NOT NULL
);

-- -----------------------------------------------------
-- Table cliente
-- -----------------------------------------------------
CREATE TABLE cliente
(
  cli_id BIGINT NOT NULL PRIMARY KEY,
  cli_nombre VARCHAR(45) NOT NULL,
  cli_apellido VARCHAR(45) NOT NULL,
  cli_vehiculo VARCHAR(8) NULL,
  cli_nacionalidad VARCHAR(45) DEFAULT 'Colombiana',
  cli_telefono BIGINT NOT NULL
);

-- -----------------------------------------------------
-- Table mascota
-- -----------------------------------------------------
CREATE TABLE mascota
(
  mas_cli_id BIGINT REFERENCES cliente(cli_id),
  mas_nombre VARCHAR(45) NOT NULL,
  mas_raza VARCHAR(25) NOT NULL,
  mas_especie VARCHAR(25) NOT NULL,
  mas_genero ENUM("macho", "hembra") NOT NULL,
  PRIMARY KEY(mas_cli_id, mas_nombre)
);

-- -----------------------------------------------------
-- Table cuidador_cuida_mascota
-- -----------------------------------------------------
CREATE TABLE cuidador_cuida_mascota
(
  trabajador_cuidador_id BIGINT REFERENCES trabajador_cuidador(tra_id),
  mas_cli_id BIGINT REFERENCES cliente(cli_id),
  mas_nombre VARCHAR(45) REFERENCES mascota(mas_nombre),
  hora_recogida TIME NOT NULL, 
  hora_entrega TIME NOT NULL
);

-- -----------------------------------------------------
-- Table cabaña
-- -----------------------------------------------------
CREATE TABLE cabaña
(
  cab_id TINYINT NOT NULL PRIMARY KEY,
  cab_capacidad INT NOT NULL,
  cab_cantidad_cama_doble INT DEFAULT 1,
  cab_cantidad_cama_sencilla INT NOT NULL,
  cab_cantidad_habitaciones INT DEFAULT 1
);

-- -----------------------------------------------------
-- Table trabajador_asea_cabaña
-- -----------------------------------------------------
CREATE TABLE trabajador_asea_cabaña
(
  tra_id BIGINT REFERENCES trabajador_aseo(tra_id),
  cab_id TINYINT REFERENCES cabaña(cab_id)
);

-- -----------------------------------------------------
-- Table parqueadero
-- -----------------------------------------------------
CREATE TABLE parqueadero
(
  par_id TINYINT NOT NULL,
  par_ocupado BOOLEAN NOT NULL,
  par_cab_id TINYINT REFERENCES cabaña(cab_id)
);

-- -----------------------------------------------------
-- Table servicio
-- -----------------------------------------------------
CREATE TABLE servicio
(
  sev_nombre VARCHAR(45) NOT NULL
);

-- -----------------------------------------------------
-- Table sugerencia
-- -----------------------------------------------------
CREATE TABLE sugerencia
(
  sug_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  sug_fecha DATETIME NOT NULL,
  sug_descripcion VARCHAR(300) NOT NULL,
  sug_res_id INT NOT NULL REFERENCES reserva(res_id)  
);

-- -----------------------------------------------------
-- Table reserva
-- -----------------------------------------------------
CREATE TABLE reserva
(
  res_id INT AUTO_INCREMENT PRIMARY KEY,
  res_cli_id BIGINT NOT NULL REFERENCES cliente(cli_id),
  res_cantidad_dias TINYINT NOT NULL,
  res_check_in DATETIME NOT NULL,
  res_check_out DATETIME NOT NULL,
  res_costo DECIMAL(15) NOT NULL DEFAULT 70.000,
  res_metodo_pago ENUM("Tarjeta debito", "Tarjeta credito", "Efectivo", "Banco digital") NOT NULL,
  res_cantidad_huespedes INT DEFAULT 1,
  res_tra_admin_res_id BIGINT NOT NULL REFERENCES trabajador_administrador_reservas(tra_id),
  res_tra_atencion_cli_id BIGINT NOT NULL REFERENCES trabajador_atencion_cliente(tra_id)
);

-- -----------------------------------------------------
-- Table reserva_has_cabañas
-- -----------------------------------------------------
CREATE TABLE reserva_has_cabañas
(
  res_id INT NOT NULL REFERENCES reserva(res_id),
  cab_id TINYINT NOT NULL REFERENCES cabaña(cab_id)
);

-- -----------------------------------------------------
-- Table inventario
-- -----------------------------------------------------
CREATE TABLE inventario
(
  inv_nombre VARCHAR(45) NOT NULL PRIMARY KEY,
  inv_proovedor VARCHAR(45) NOT NULL,
  inv_costo_producto DECIMAL NOT NULL,
  inv_cantidad_habitacion INT NULL,
  inv_cantidad_hotel INT NOT NULL,
  inv_tra_id_administrador BIGINT REFERENCES trabajador_administrador_inventario(tra_id)
);

-- -----------------------------------------------------
-- Table cabaña_has_servicios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cabaña_has_servicio
(
  sev_nombre VARCHAR(45) NOT NULL REFERENCES servicio(sev_nombre),
  cab_id INT NOT NULL REFERENCES cabaña(cab_id)
);

-- -----------------------------------------------------
-- Table registro_paseos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS registro_paseos
(
  reg_paseos INT PRIMARY KEY AUTO_INCREMENT,
  mas_cli_id BIGINT REFERENCES cliente(cli_id),
  mas_nombre VARCHAR(45) REFERENCES mascota(mas_nombre),
  hor_inicio TIME,
  hor_final TIME,
  fecha DATE,
  usu_registro_paseos VARCHAR(45)
);

-- -----------------------------------------------------
-- Table historial_empleados
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS historial_empleados
(
  hist_emp_id INT PRIMARY KEY AUTO_INCREMENT,
  fechaIn DATETIME NOT NULL,
  fechaFin DATETIME NULL,
  emp_puesto VARCHAR(45) NOT NULL,
  trabajador_id BIGINT NOT NULL,
  usu_empleador VARCHAR(45) NOT NULL,
  empleador_id BIGINT NULL REFERENCES trabajador_administrador_jefe(tra_id), 
  usu_finalizar VARCHAR(45) NULL
);

-- -----------------------------------------------------
-- Table historial_inventario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS historial_inventario
(
  inv_id_hist INT PRIMARY KEY AUTO_INCREMENT,
  accion VARCHAR(10),
  inv_hist_old_nombre VARCHAR(45) DEFAULT NULL,
  inv_hist_new_nombre VARCHAR(45),
  inv_hist_old_proovedor VARCHAR(45) DEFAULT NULL,
  inv_hist_new_proovedor VARCHAR(45),
  inv_hist_old_costo_producto DECIMAL DEFAULT NULL,
  inv_hist_new_costo_producto DECIMAL,
  inv_hist_old_cantidad_habitacion INT DEFAULT NULL,
  inv_hist_new_cantidad_habitacion INT,
  inv_hist_old_cantidad_hotel INT DEFAULT NULL,
  inv_hist_new_cantidad_hotel INT,
  inv_hist_old_tra_id_administrador BIGINT DEFAULT NULL REFERENCES trabajador_administrador_inventario(tra_id),
  inv_hist_new_tra_id_administrador BIGINT REFERENCES trabajador_administrador_inventario(tra_id),
  fecha_accion DATETIME,
  usuario VARCHAR(45)
);

-- Vistas
-- para personal de aseo
DROP VIEW IF EXISTS VistaAseoCa, VistaAseoIn;
CREATE VIEW VistaAseoCa AS SELECT ta.*, tac.cab_id as cabañaLimpiar FROM trabajador_aseo ta join trabajador_asea_cabaña tac on(tac.tra_id=ta.tra_id);
CREATE VIEW VistaAseoIn AS SELECT i.inv_nombre, i.inv_cantidad_hotel FROM inventario i;

-- para personal de mascotas
DROP VIEW IF EXISTS PaseadorMas, Paseo;
CREATE VIEW PaseadorMas AS SELECT c.cli_nombre, c.cli_apellido, c.cli_telefono, m.mas_nombre,m.mas_raza,m.mas_especie,m.mas_genero,res.cab_id FROM cabaña cb JOIN reserva_has_cabañas res ON res.cab_id=cb.cab_id JOIN reserva r ON (res.res_id=r.res_id) JOIN cliente c ON (cli_id=res_cli_id) JOIN mascota m  ON (cli_id=mas_cli_id);
CREATE VIEW Paseo AS SELECT c.mas_nombre, c.hora_recogida,c.hora_entrega, cu.tra_nombre, cu.tra_apellido, cu.tra_telefono, cu.tra_jornada from cuidador_cuida_mascota c join trabajador_cuidador cu on (c.trabajador_cuidador_id =cu.tra_id);

-- para personal de vigilancia
DROP VIEW IF EXISTS CeladorMas, CeladorPar, CeladorPlacasReservas;
CREATE VIEW CeladorMas AS SELECT c.cli_id, c.cli_nombre, c.cli_apellido, m.mas_nombre,m.mas_especie,res.cab_id FROM cabaña cb JOIN reserva_has_cabañas res ON res.cab_id=cb.cab_id JOIN reserva r ON (res.res_id=r.res_id) JOIN cliente c ON (cli_id=res_cli_id) JOIN mascota m  ON (cli_id=mas_cli_id);
CREATE VIEW CeladorPlacasReservas as select c.*,res.cab_id,r.res_check_in, r.res_check_out FROM cabaña cb JOIN reserva_has_cabañas res ON res.cab_id=cb.cab_id JOIN reserva r ON (res.res_id=r.res_id) JOIN cliente c ON (cli_id=res_cli_id);
CREATE VIEW CeladorPar AS SELECT p.* from parqueadero p;

-- Para personal de atencion
DROP VIEW IF EXISTS atencionCliente;
CREATE VIEW atencionCliente AS SELECT r.*, c.* from reserva r join cliente c on(res_cli_id=cli_id);

-- Para admin de reservas
DROP VIEW IF EXISTS vista_admin_reserva_cabaña, vista_admin_reserva_cabaña_servicio, vista_admin_reserva_huespedes;
CREATE VIEW vista_admin_reserva_cabaña AS SELECT 
    r.res_id,
    r.res_cli_id,
    r.res_cantidad_dias,
    r.res_check_in,
    r.res_check_out,
    r.res_costo,
    r.res_metodo_pago,
    r.res_cantidad_huespedes,
    r.res_tra_admin_res_id,
    r.res_tra_atencion_cli_id,
    c.cab_capacidad,
    c.cab_cantidad_cama_doble,
    c.cab_cantidad_cama_sencilla,
    c.cab_cantidad_habitaciones
FROM reserva r
INNER JOIN reserva_has_cabañas rc ON r.res_id = rc.res_id
INNER JOIN cabaña c ON rc.cab_id = c.cab_id;

CREATE VIEW vista_admin_reserva_cabaña_servicio AS
SELECT c.cab_id, c.cab_capacidad, c.cab_cantidad_cama_doble, c.cab_cantidad_cama_sencilla, c.cab_cantidad_habitaciones, s.sev_nombre
FROM cabaña c
LEFT JOIN cabaña_has_servicio chs ON c.cab_id = chs.cab_id
LEFT JOIN servicio s ON chs.sev_nombre = s.sev_nombre;

CREATE VIEW vista_admin_reserva_huespedes  AS
SELECT c.cli_id, c.cli_nombre, c.cli_apellido, c.cli_vehiculo, c.cli_nacionalidad, c.cli_telefono,
       m.mas_nombre, m.mas_raza, m.mas_genero
FROM cliente c
LEFT JOIN mascota m ON c.cli_id = m.mas_cli_id;

-- Permisos
-- Creacion de roles y usuarios
DROP ROLE IF EXISTS Aseo;
CREATE ROLE Aseo;
GRANT SELECT ON hotel.VistaAseoCa TO Aseo;
GRANT SELECT ON hotel.VistaAseoIn TO Aseo;

DROP ROLE IF EXISTS Cuidador;
CREATE ROLE Cuidador;
GRANT SELECT ON hotel.PaseadorMas TO Cuidador;
GRANT SELECT ON hotel.registro_paseos TO Cuidador;
GRANT SELECT, INSERT ON hotel.Paseo TO Cuidador;

DROP ROLE IF EXISTS Celador;
CREATE ROLE Celador;
GRANT SELECT ON hotel.CeladorMas TO Celador;
GRANT SELECT ON hotel.CeladorPlacasReservas TO Celador;
GRANT SELECT, UPDATE ON hotel.CeladorPar TO Celador;


DROP ROLE IF EXISTS Administrador_Inventarios;
CREATE ROLE Administrador_Inventarios;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.inventario TO Administrador_Inventarios;
GRANT SELECT ON hotel.historial_inventario TO Administrador_Inventarios;

DROP ROLE IF EXISTS Atencion_Al_Cliente;
CREATE ROLE Atencion_Al_Cliente;
GRANT SELECT ON hotel.cabaña TO Atencion_Al_Cliente;
GRANT SELECT ON hotel.servicio TO Atencion_Al_Cliente;
GRANT SELECT ON hotel.parqueadero TO Atencion_Al_Cliente;
GRANT SELECT ON hotel.cabaña_has_servicio TO Atencion_Al_Cliente;
GRANT SELECT, INSERT ON hotel.cliente TO Atencion_Al_Cliente;
GRANT SELECT, INSERT ON hotel.mascota TO Atencion_Al_Cliente;
GRANT SELECT, INSERT ON hotel.atencionCliente TO Atencion_Al_Cliente;
GRANT SELECT, INSERT ON hotel.reserva TO Atencion_Al_Cliente;

DROP ROLE IF EXISTS Administrador_Jefe;
CREATE ROLE Administrador_Jefe;
GRANT SELECT ON hotel.registro_paseos TO Administrador_Jefe;
GRANT SELECT ON hotel.historial_empleados TO Administrador_Jefe;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.trabajador_administrador_jefe TO Administrador_Jefe;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.trabajador_administrador_reservas TO Administrador_Jefe;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.trabajador_administrador_jefe_de TO Administrador_Jefe;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.trabajador_atencion_cliente TO Administrador_Jefe;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.trabajador_administrador_inventario TO Administrador_Jefe;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.trabajador_celador TO Administrador_Jefe;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.trabajador_cuidador TO Administrador_Jefe;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.trabajador_aseo TO Administrador_Jefe;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.cuidador_cuida_mascota TO Administrador_Jefe; 
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.trabajador_asea_cabaña TO Administrador_Jefe;

DROP ROLE IF EXISTS Administrador_Reservas;
CREATE ROLE Administrador_Reservas;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.vista_admin_reserva_cabaña TO Administrador_Reservas;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.sugerencia TO Administrador_Reservas;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.mascota TO Administrador_Reservas;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.cliente TO Administrador_Reservas;
GRANT SELECT ON hotel.registro_paseos TO Administrador_Reservas;
GRANT SELECT, DELETE ON hotel.reserva TO Administrador_Reservas;
GRANT SELECT, UPDATE, INSERT, DELETE ON hotel.vista_admin_reserva_huespedes TO Administrador_Reservas;
GRANT SELECT, UPDATE ON hotel.parqueadero TO Administrador_Reservas;
GRANT SELECT ON hotel.vista_admin_reserva_cabaña_servicio TO Administrador_Reservas;


-- Crear usuarios y asignar al rol "Aseo"

-- Usuario 1
DROP USER IF EXISTS 'juan_perez'@'localhost';
CREATE USER 'juan_perez'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'juan_perez'@'localhost';
SET DEFAULT ROLE Aseo TO 'juan_perez'@'localhost';

-- Usuario 2
DROP USER IF EXISTS 'maria_gomez'@'localhost';
CREATE USER 'maria_gomez'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'maria_gomez'@'localhost';
SET DEFAULT ROLE Aseo TO 'maria_gomez'@'localhost';

-- Usuario 3
DROP USER IF EXISTS 'sandra_lopez'@'localhost';
CREATE USER 'sandra_lopez'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'sandra_lopez'@'localhost';
SET DEFAULT ROLE Aseo TO 'sandra_lopez'@'localhost';

-- Usuario 4
DROP USER IF EXISTS 'carlos_gonzalez'@'localhost';
CREATE USER 'carlos_gonzalez'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'carlos_gonzalez'@'localhost';
SET DEFAULT ROLE Aseo TO 'carlos_gonzalez'@'localhost';

-- Usuario 5
DROP USER IF EXISTS 'luisa_fernandez'@'localhost';
CREATE USER 'luisa_fernandez'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'luisa_fernandez'@'localhost';
SET DEFAULT ROLE Aseo TO 'luisa_fernandez'@'localhost';

-- Usuario 6
DROP USER IF EXISTS 'pedro_ramirez'@'localhost';
CREATE USER 'pedro_ramirez'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'pedro_ramirez'@'localhost';
SET DEFAULT ROLE Aseo TO 'pedro_ramirez'@'localhost';

-- Usuario 7
DROP USER IF EXISTS 'ana_martinez'@'localhost';
CREATE USER 'ana_martinez'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'ana_martinez'@'localhost';
SET DEFAULT ROLE Aseo TO 'ana_martinez'@'localhost';

-- Usuario 8
DROP USER IF EXISTS 'laura_dias'@'localhost';
CREATE USER 'laura_dias'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'laura_dias'@'localhost';
SET DEFAULT ROLE Aseo TO 'laura_dias'@'localhost';

-- Usuario 9
DROP USER IF EXISTS 'javier_gomez'@'localhost';
CREATE USER 'javier_gomez'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'javier_gomez'@'localhost';
SET DEFAULT ROLE Aseo TO 'javier_gomez'@'localhost';

-- Usuario 10
DROP USER IF EXISTS 'elena_torres'@'localhost';
CREATE USER 'elena_torres'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'elena_torres'@'localhost';
SET DEFAULT ROLE Aseo TO 'elena_torres'@'localhost';

-- Usuario 11
DROP USER IF EXISTS 'Roberto_sanchez'@'localhost';
CREATE USER 'Roberto_sanchez'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'Roberto_sanchez'@'localhost';
SET DEFAULT ROLE Aseo TO 'Roberto_sanchez'@'localhost';

-- Usuario 12
DROP USER IF EXISTS 'isabel_luna'@'localhost';
CREATE USER 'isabel_luna'@'localhost' IDENTIFIED BY '12345';
GRANT Aseo TO 'isabel_luna'@'localhost';
SET DEFAULT ROLE Aseo TO 'isabel_luna'@'localhost';

-- Crear usuarios y asignar al rol "Cuidador"

-- Usuario 1
DROP USER IF EXISTS 'pedro_rodriguez'@'localhost';
CREATE USER 'pedro_rodriguez'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'pedro_rodriguez'@'localhost';
SET DEFAULT ROLE Cuidador TO 'pedro_rodriguez'@'localhost';

-- Usuario 2
DROP USER IF EXISTS 'Laura_martinez'@'localhost';
CREATE USER 'Laura_martinez'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'Laura_martinez'@'localhost';
SET DEFAULT ROLE Cuidador TO 'Laura_martinez'@'localhost';

-- Usuario 3
DROP USER IF EXISTS 'santiago_hernandez'@'localhost';
CREATE USER 'santiago_hernandez'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'santiago_hernandez'@'localhost';
SET DEFAULT ROLE Cuidador TO 'santiago_hernandez'@'localhost';

-- Usuario 4
DROP USER IF EXISTS 'valentina_garcia'@'localhost';
CREATE USER 'valentina_garcia'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'valentina_garcia'@'localhost';
SET DEFAULT ROLE Cuidador TO 'valentina_garcia'@'localhost';

-- Usuario 5
DROP USER IF EXISTS 'andres_perez'@'localhost';
CREATE USER 'andres_perez'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'andres_perez'@'localhost';
SET DEFAULT ROLE Cuidador TO 'andres_perez'@'localhost';

-- Usuario 6
DROP USER IF EXISTS 'mariana_lopez'@'localhost';
CREATE USER 'mariana_lopez'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'mariana_lopez'@'localhost';
SET DEFAULT ROLE Cuidador TO 'mariana_lopez'@'localhost';

-- Usuario 7
DROP USER IF EXISTS 'carlos_martinez'@'localhost';
CREATE USER 'carlos_martinez'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'carlos_martinez'@'localhost';
SET DEFAULT ROLE Cuidador TO 'carlos_martinez'@'localhost';

-- Usuario 8
DROP USER IF EXISTS 'laura_diaz'@'localhost';
CREATE USER 'laura_diaz'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'laura_diaz'@'localhost';
SET DEFAULT ROLE Cuidador TO 'laura_diaz'@'localhost';

-- Usuario 9
DROP USER IF EXISTS 'javier_gomez'@'localhost';
CREATE USER 'javier_gomez'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'javier_gomez'@'localhost';
SET DEFAULT ROLE Cuidador TO 'javier_gomez'@'localhost';

-- Usuario 10
DROP USER IF EXISTS 'elena_torres'@'localhost';
CREATE USER 'elena_torres'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'elena_torres'@'localhost';
SET DEFAULT ROLE Cuidador TO 'elena_torres'@'localhost';

-- Usuario 11
DROP USER IF EXISTS 'roberto_sanchez'@'localhost';
CREATE USER 'roberto_sanchez'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'roberto_sanchez'@'localhost';
SET DEFAULT ROLE Cuidador TO 'roberto_sanchez'@'localhost';

-- Usuario 12
DROP USER IF EXISTS 'isabel_luna'@'localhost';
CREATE USER 'isabel_luna'@'localhost' IDENTIFIED BY '12345';
GRANT Cuidador TO 'isabel_luna'@'localhost';
SET DEFAULT ROLE Cuidador TO 'isabel_luna'@'localhost';

-- Crear usuarios y asignar al rol "Celador"

-- Usuario 1
DROP USER IF EXISTS 'carlos_garcia'@'localhost';
CREATE USER 'carlos_garcia'@'localhost' IDENTIFIED BY '12345';
GRANT Celador TO 'carlos_garcia'@'localhost';
SET DEFAULT ROLE Celador TO 'carlos_garcia'@'localhost';

-- Usuario 2
DROP USER IF EXISTS 'sofia_lopez'@'localhost';
CREATE USER 'sofia_lopez'@'localhost' IDENTIFIED BY '12345';
GRANT Celador TO 'sofia_lopez'@'localhost';
SET DEFAULT ROLE Celador TO 'sofia_lopez'@'localhost';

-- Usuario 3
DROP USER IF EXISTS 'sergio_ramirez'@'localhost';
CREATE USER 'sergio_ramirez'@'localhost' IDENTIFIED BY '12345';
GRANT Celador TO 'sergio_ramirez'@'localhost';
SET DEFAULT ROLE Celador TO 'sergio_ramirez'@'localhost';

-- Usuario 4
DROP USER IF EXISTS 'luis_hernandez'@'localhost';
CREATE USER 'luis_hernandez'@'localhost' IDENTIFIED BY '12345';
GRANT Celador TO 'luis_hernandez'@'localhost';
SET DEFAULT ROLE Celador TO 'luis_hernandez'@'localhost';

-- Usuario 5
DROP USER IF EXISTS 'laura_Martinez'@'localhost';
CREATE USER 'laura_Martinez'@'localhost' IDENTIFIED BY '12345';
GRANT Celador TO 'laura_Martinez'@'localhost';
SET DEFAULT ROLE Celador TO 'laura_Martinez'@'localhost';

-- Usuario 6
DROP USER IF EXISTS 'javier_Sanchez'@'localhost';
CREATE USER 'javier_Sanchez'@'localhost' IDENTIFIED BY '12345';
GRANT Celador TO 'javier_Sanchez'@'localhost';
SET DEFAULT ROLE Celador TO 'javier_Sanchez'@'localhost';

-- Usuario 7
DROP USER IF EXISTS 'Elena_luna'@'localhost';
CREATE USER 'Elena_luna'@'localhost' IDENTIFIED BY '12345';
GRANT Celador TO 'Elena_luna'@'localhost';
SET DEFAULT ROLE Celador TO 'Elena_luna'@'localhost';

-- Usuario 8
DROP USER IF EXISTS 'roberto_Gutierrez'@'localhost';
CREATE USER 'roberto_Gutierrez'@'localhost' IDENTIFIED BY '12345';
GRANT Celador TO 'roberto_Gutierrez'@'localhost';
SET DEFAULT ROLE Celador TO 'roberto_Gutierrez'@'localhost';

-- Eliminar usuarios existentes antes de crear nuevos usuarios y asignar al rol "Administrador_Inventarios"

-- Usuario 1
DROP USER IF EXISTS 'luis_fernandez'@'localhost';
CREATE USER 'luis_fernandez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Inventarios TO 'luis_fernandez'@'localhost';
SET DEFAULT ROLE 'Administrador_Inventarios' TO 'luis_fernandez'@'localhost';

-- Usuario 2
DROP USER IF EXISTS 'ana_diaz'@'localhost';
CREATE USER 'ana_diaz'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Inventarios TO 'ana_diaz'@'localhost';
SET DEFAULT ROLE 'Administrador_Inventarios' TO 'ana_diaz'@'localhost';

-- Usuario 3
DROP USER IF EXISTS 'sergio_ramirez'@'localhost';
CREATE USER 'sergio_ramirez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Inventarios TO 'sergio_ramirez'@'localhost';
SET DEFAULT ROLE 'Administrador_Inventarios' TO 'sergio_ramirez'@'localhost';

-- Usuario 4
DROP USER IF EXISTS 'Luis_hernandez'@'localhost';
CREATE USER 'Luis_hernandez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Inventarios TO 'Luis_hernandez'@'localhost';
SET DEFAULT ROLE 'Administrador_Inventarios' TO 'Luis_hernandez'@'localhost';

-- Usuario 5
DROP USER IF EXISTS 'sandra_perez'@'localhost';
CREATE USER 'sandra_perez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Inventarios TO 'sandra_perez'@'localhost';
SET DEFAULT ROLE 'Administrador_Inventarios' TO 'sandra_perez'@'localhost';

-- Usuario 6
DROP USER IF EXISTS 'pedro_Garcia'@'localhost';
CREATE USER 'pedro_Garcia'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Inventarios TO 'pedro_Garcia'@'localhost';
SET DEFAULT ROLE 'Administrador_Inventarios' TO 'pedro_Garcia'@'localhost';

-- Usuario 7
DROP USER IF EXISTS 'sofia_gomeZ'@'localhost';
CREATE USER 'sofia_gomeZ'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Inventarios TO 'sofia_gomeZ'@'localhost';
SET DEFAULT ROLE 'Administrador_Inventarios' TO 'sofia_gomeZ'@'localhost';

-- Usuario 8
DROP USER IF EXISTS 'carlos_diaz'@'localhost';
CREATE USER 'carlos_diaz'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Inventarios TO 'carlos_diaz'@'localhost';
SET DEFAULT ROLE 'Administrador_Inventarios' TO 'carlos_diaz'@'localhost';

-- Eliminar usuarios existentes antes de crear nuevos usuarios y asignar al rol "Atencion_Al_Cliente"

-- Usuario 1
DROP USER IF EXISTS 'javier_gutierrez'@'localhost';
CREATE USER 'javier_gutierrez'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'javier_gutierrez'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'javier_gutierrez'@'localhost';

-- Usuario 2
DROP USER IF EXISTS 'elena_ramirez'@'localhost';
CREATE USER 'elena_ramirez'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'elena_ramirez'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'elena_ramirez'@'localhost';

-- Usuario 3
DROP USER IF EXISTS 'luis_Hernandez'@'localhost';
CREATE USER 'luis_Hernandez'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'luis_Hernandez'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'luis_Hernandez'@'localhost';

-- Usuario 4
DROP USER IF EXISTS 'Maria_perez'@'localhost';
CREATE USER 'Maria_perez'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'Maria_perez'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'Maria_perez'@'localhost';

-- Usuario 5
DROP USER IF EXISTS 'Pedro_garcia'@'localhost';
CREATE USER 'Pedro_garcia'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'Pedro_garcia'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'Pedro_garcia'@'localhost';

-- Usuario 6
DROP USER IF EXISTS 'sofia_gomez'@'localhost';
CREATE USER 'sofia_gomez'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'sofia_gomez'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'sofia_gomez'@'localhost';

-- Usuario 7
DROP USER IF EXISTS 'Carlos_diaz'@'localhost';
CREATE USER 'Carlos_diaz'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'Carlos_diaz'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'Carlos_diaz'@'localhost';

-- Usuario 8
DROP USER IF EXISTS 'laurA_martinez'@'localhost';
CREATE USER 'laurA_martinez'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'laurA_martinez'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'laurA_martinez'@'localhost';

-- Usuario 9
DROP USER IF EXISTS 'Javier_Sanchez'@'localhost';
CREATE USER 'Javier_Sanchez'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'Javier_Sanchez'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'Javier_Sanchez'@'localhost';

-- Usuario 10
DROP USER IF EXISTS 'elena_luna'@'localhost';
CREATE USER 'elena_luna'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'elena_luna'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'elena_luna'@'localhost';

-- Usuario 11
DROP USER IF EXISTS 'Roberto_gutierrez'@'localhost';
CREATE USER 'Roberto_gutierrez'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'Roberto_gutierrez'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'Roberto_gutierrez'@'localhost';

-- Usuario 12
DROP USER IF EXISTS 'isabel_ramirez'@'localhost';
CREATE USER 'isabel_ramirez'@'localhost' IDENTIFIED BY '12345';
GRANT Atencion_Al_Cliente TO 'isabel_ramirez'@'localhost';
SET DEFAULT ROLE 'Atencion_Al_Cliente' TO 'isabel_ramirez'@'localhost';

-- Eliminar usuarios existentes antes de crear nuevos usuarios y asignar al rol "Administrador_Jefe"

-- Usuario 1
DROP USER IF EXISTS 'roberto_Sanchez'@'localhost';
CREATE USER 'roberto_Sanchez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Jefe TO 'roberto_Sanchez'@'localhost';
SET DEFAULT ROLE 'Administrador_Jefe' TO 'roberto_Sanchez'@'localhost';

-- Usuario 2
DROP USER IF EXISTS 'isabel_torres'@'localhost';
CREATE USER 'isabel_torres'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Jefe TO 'isabel_torres'@'localhost';
SET DEFAULT ROLE 'Administrador_Jefe' TO 'isabel_torres'@'localhost';

-- Usuario 3
DROP USER IF EXISTS 'lucia_hernandez'@'localhost';
CREATE USER 'lucia_hernandez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Jefe TO 'lucia_hernandez'@'localhost';
SET DEFAULT ROLE 'Administrador_Jefe' TO 'lucia_hernandez'@'localhost';

-- Usuario 4
DROP USER IF EXISTS 'rafael_perez'@'localhost';
CREATE USER 'rafael_perez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Jefe TO 'rafael_perez'@'localhost';
SET DEFAULT ROLE 'Administrador_Jefe' TO 'rafael_perez'@'localhost';

-- Usuario 5
DROP USER IF EXISTS 'alejandra_garcia'@'localhost';
CREATE USER 'alejandra_garcia'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Jefe TO 'alejandra_garcia'@'localhost';
SET DEFAULT ROLE 'Administrador_Jefe' TO 'alejandra_garcia'@'localhost';

-- Usuario 6
DROP USER IF EXISTS 'andres_gomez'@'localhost';
CREATE USER 'andres_gomez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Jefe TO 'andres_gomez'@'localhost';
SET DEFAULT ROLE 'Administrador_Jefe' TO 'andres_gomez'@'localhost';

-- Crear usuarios y asignar al rol "Administrador_Reservas"

-- Usuario 4
DROP USER IF EXISTS 'diego_vargas'@'localhost';
CREATE USER 'diego_vargas'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Reservas TO 'diego_vargas'@'localhost';
SET DEFAULT ROLE Administrador_Reservas To 'diego_vargas'@'localhost';

-- Usuario 5
DROP USER IF EXISTS 'laura_lopez'@'localhost';
CREATE USER 'laura_lopez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Reservas TO 'laura_lopez'@'localhost';
SET DEFAULT ROLE Administrador_Reservas TO 'laura_lopez'@'localhost';

-- Usuario 6
DROP USER IF EXISTS 'andres_martinez'@'localhost';
CREATE USER 'andres_martinez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Reservas TO 'andres_martinez'@'localhost';
SET DEFAULT ROLE Administrador_Reservas TO 'andres_martinez'@'localhost';

-- Usuario 7
DROP USER IF EXISTS 'gabriela_ramirez'@'localhost';
CREATE USER 'gabriela_ramirez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Reservas TO 'gabriela_ramirez'@'localhost';
SET DEFAULT ROLE Administrador_Reservas TO 'gabriela_ramirez'@'localhost';

-- Usuario 8
DROP USER IF EXISTS 'sergio_gomez'@'localhost';
CREATE USER 'sergio_gomez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Reservas TO 'sergio_gomez'@'localhost';
SET DEFAULT ROLE Administrador_Reservas TO 'sergio_gomez'@'localhost';

-- Usuario 9
DROP USER IF EXISTS 'maria_diaz'@'localhost';
CREATE USER 'maria_diaz'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Reservas TO 'maria_diaz'@'localhost';
SET DEFAULT ROLE Administrador_Reservas TO 'maria_diaz'@'localhost';

-- Usuario 10
DROP USER IF EXISTS 'eduardo_perez'@'localhost';
CREATE USER 'eduardo_perez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Reservas TO 'eduardo_perez'@'localhost';
SET DEFAULT ROLE Administrador_Reservas TO 'eduardo_perez'@'localhost';

-- Usuario 11
DROP USER IF EXISTS 'luisa_sanchez'@'localhost';
CREATE USER 'luisa_sanchez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Reservas TO 'luisa_sanchez'@'localhost';
SET DEFAULT ROLE Administrador_Reservas TO 'luisa_sanchez'@'localhost';

-- Usuario 12
DROP USER IF EXISTS 'carlos_gutierrez'@'localhost';
CREATE USER 'carlos_gutierrez'@'localhost' IDENTIFIED BY '12345';
GRANT Administrador_Reservas TO 'carlos_gutierrez'@'localhost';
SET DEFAULT ROLE Administrador_Reservas TO 'carlos_gutierrez'@'localhost';

-- Indices
/*
Justificación: Estos índices se crean para mejorar la velocidad de búsqueda cuando se realicen consultas que filtran por la jornada laboral de los trabajadores en las respectivas tablas. Al indexar la columna de jornada, las consultas que buscan trabajadores por su jornada se ejecutarán más rápidamente.
*/
CREATE INDEX idx_trabajador_aseo_jornada ON trabajador_aseo(tra_jornada);
CREATE INDEX idx_trabajador_cuidador_jornada ON trabajador_cuidador(tra_jornada);
CREATE INDEX idx_trabajador_celador_jornada ON trabajador_celador(tra_jornada);
CREATE INDEX idx_trabajador_admin_inventario_jornada ON trabajador_administrador_inventario(tra_jornada);
CREATE INDEX idx_trabajador_atencion_cliente_jornada ON trabajador_atencion_cliente(tra_jornada);
CREATE INDEX idx_trabajador_admin_jefe_jornada ON trabajador_administrador_jefe(tra_jornada);
CREATE INDEX idx_trabajador_admin_reservas_jornada ON trabajador_administrador_reservas(tra_jornada);
/*
Justificación: Este índice se crea para mejorar la velocidad de búsqueda al obtener todas las mascotas asociadas a un cliente. Al indexar la columna mas_cli_id en la tabla mascota, se acelera la búsqueda de mascotas para un cliente específico.*/
CREATE INDEX idx_mascota_cliente ON mascota(mas_cli_id);
/*
Justificación: Este índice mejora la velocidad de búsqueda al obtener las mascotas cuidadas por un cuidador en particular. Al indexar las columnas trabajador_cuidador_id y mas_cli_id en la tabla cuidador_cuida_mascota, se optimiza la búsqueda de mascotas asociadas a un cuidador.*/
CREATE INDEX idx_cuidador_cuida_mascota ON cuidador_cuida_mascota(trabajador_cuidador_id, mas_cli_id);
/*
Justificación: Este índice mejora la velocidad de búsqueda al obtener todas las reservas asociadas a un cliente. Al indexar la columna res_cli_id en la tabla reserva, se acelera la búsqueda de reservas para un cliente específico.*/
CREATE INDEX idx_reserva_cliente ON reserva(res_cli_id);
/*
Justificación: Estos índices mejoran la velocidad de búsqueda al filtrar reservas por las fechas de check-in y check-out. Al indexar las columnas res_check_in y res_check_out en la tabla reserva, se optimiza la búsqueda de reservas para un rango de fechas.*/
CREATE INDEX idx_reserva_check_in ON reserva(res_check_in);
CREATE INDEX idx_reserva_check_out ON reserva(res_check_out);
/*
ustificación: Este índice mejora la velocidad de búsqueda al obtener todos los productos de un proveedor específico en la tabla inventario. Al indexar la columna inv_proovedor, se acelera la búsqueda de productos asociados a un proveedor*/
CREATE INDEX idx_inventario_proveedor ON inventario(inv_proovedor);
/*
Justificación: Estos índices mejoran la velocidad de búsqueda al filtrar reservas por el trabajador de atención al cliente y el administrador de reservas. Al indexar las columnas res_tra_atencion_cli_id y res_tra_admin_res_id en la tabla reserva, se optimiza la búsqueda de reservas asociadas a trabajadores específicos.*/
CREATE INDEX idx_reserva_tra_atencion_cli ON reserva(res_tra_atencion_cli_id);
CREATE INDEX idx_reserva_tra_admin_res ON reserva(res_tra_admin_res_id);
/*
Justificación: Este índice mejora la velocidad de búsqueda al obtener las cabañas ocupadas en el parqueadero. Al indexar la columna par_ocupado en la tabla parqueadero, se optimiza la búsqueda de cabañas ocupadas.*/
CREATE INDEX idx_parqueadero_ocupado ON parqueadero(par_ocupado);
/*
Justificación: Los siguientes índices mejoran la velocidad de búsqueda cuando se accede a un trabajador específico por su identificador único (tra_id).
*/
CREATE INDEX idx_trabajador_aseo_id ON trabajador_aseo(tra_id);
CREATE INDEX idx_trabajador_cuidador_id ON trabajador_cuidador(tra_id);
CREATE INDEX idx_trabajador_celador_id ON trabajador_celador(tra_id);
CREATE INDEX idx_trabajador_admin_inventario_id ON trabajador_administrador_inventario(tra_id);
CREATE INDEX idx_trabajador_atencion_cliente_id ON trabajador_atencion_cliente(tra_id);
CREATE INDEX idx_trabajador_administrador_jefe_id ON trabajador_administrador_jefe(tra_id);
CREATE INDEX idx_trabajador_administrador_reservas_id ON trabajador_administrador_reservas(tra_id);
/*
Justificación: Este índice mejora la velocidad de búsqueda cuando se accede a un cliente específico por su identificador único (cli_id).
*/
CREATE UNIQUE INDEX idx_cliente_id ON cliente(cli_id);
/*
Justificación: Este índice mejora la velocidad de búsqueda cuando se accede a una mascota específica por la combinación única de mas_cli_id y mas_nombre.
*/
CREATE UNIQUE INDEX idx_mascota_id ON mascota(mas_cli_id, mas_nombre);
/*
Justificación: Este índice mejora la velocidad de búsqueda cuando se accede a una relación específica entre un cuidador y una mascota.
*/
CREATE UNIQUE INDEX idx_cuidador_cuida_mascota_id ON cuidador_cuida_mascota(trabajador_cuidador_id, mas_cli_id, mas_nombre);
/*
Justificación: Este índice mejora la velocidad de búsqueda cuando se accede a una cabaña específica por su identificador único (cab_id).
*/
CREATE UNIQUE INDEX idx_cabaña_id ON cabaña(cab_id);
/*
Justificación: Este índice mejora la velocidad de búsqueda cuando se accede a una cabaña específica por su identificador único (cab_id).
*/
CREATE UNIQUE INDEX idx_trabajador_asea_cabaña_id ON trabajador_asea_cabaña(tra_id, cab_id);
/*
Justificación: Este índice mejora la velocidad de búsqueda cuando se accede a un parqueadero específico por su identificador único (par_id).
*/
CREATE UNIQUE INDEX idx_parqueadero_id ON parqueadero(par_id);
/*
Justificación: Este índice mejora la velocidad de búsqueda cuando se accede a un servicio específico por su nombre único (sev_nombre).
*/
CREATE UNIQUE INDEX idx_servicio_nombre ON servicio(sev_nombre);
/*
Justificación: Este índice mejora la velocidad de búsqueda cuando se accede a una sugerencia específica por su identificador único (sug_id).
*/
CREATE UNIQUE INDEX idx_sugerencia_id ON sugerencia(sug_id);
/*
Justificación: Este índice mejora la velocidad de búsqueda cuando se accede a una reserva específica por su identificador único (res_id)
*/
CREATE UNIQUE INDEX idx_reserva_id ON reserva(res_id);
/*
Justificación: Este índice mejora la velocidad de búsqueda cuando se accede a la relación entre una reserva y una cabaña específica.
*/
CREATE UNIQUE INDEX idx_reserva_has_cabañas_id ON reserva_has_cabañas(res_id, cab_id);


-- Triggers Base de datos Hotel el Molino
DROP TRIGGER IF EXISTS registro_contratacion_aseo;
DROP TRIGGER IF EXISTS registro_contratacion_cuidador;
DROP TRIGGER IF EXISTS registro_contratacion_celador;
DROP TRIGGER IF EXISTS registro_contratacion_admin_inventario;
DROP TRIGGER IF EXISTS registro_contratacion_atencion_cliente;
DROP TRIGGER IF EXISTS registro_contratacion_admin_reservas;
DROP TRIGGER IF EXISTS registro_contratacion_admin_jefe;
DROP TRIGGER IF EXISTS registro_salida_trabajador_aseo;
DROP TRIGGER IF EXISTS registro_salida_trabajador_cuidador;
DROP TRIGGER IF EXISTS registro_salida_trabajador_celador;
DROP TRIGGER IF EXISTS registro_salida_trabajador_administrador_inventario;
DROP TRIGGER IF EXISTS registro_salida_trabajador_atencion_cliente;
DROP TRIGGER IF EXISTS registro_salida_trabajador_administrador_reservas;
DROP TRIGGER IF EXISTS registro_salida_trabajador_administrador_jefe;
DROP TRIGGER IF EXISTS revisar_fechaHorarios_reserva;
DROP TRIGGER IF EXISTS registro_insercion_inventario;
DROP TRIGGER IF EXISTS registro_eliminacion_inventario;
DROP TRIGGER IF EXISTS registro_actualizacion_inventario;
DROP TRIGGER IF EXISTS registro_insercion_trabajador_administrador_jefe_de;

-- Revisa si las fechas de la reserva cuadran con los horarios del administrador de reservas y del empleado de atención al cliente
DELIMITER &&
CREATE TRIGGER revisar_fechaHorarios_reserva AFTER INSERT ON reserva FOR EACH ROW
BEGIN
    DECLARE dia VARCHAR(20);
    DECLARE id int;
    DECLARE jornada_empleado VARCHAR(20);
    
    SELECT tra_jornada into jornada_empleado FROM trabajador_atencion_cliente WHERE tra_id = new.res_tra_atencion_cli_id;
    SET dia = CASE
        WHEN DAYOFWEEK(NEW.res_check_in) BETWEEN 2 AND 6 THEN 'Entre semana'
        WHEN DAYOFWEEK(NEW.res_check_in) IN (1, 7) THEN 'Fin de semana'    
    END;
	
    IF dia != jornada_empleado THEN
		SIGNAL SQLSTATE '20000'
        SET MESSAGE_TEXT = 'No se pudo realizar el registro, ya que el empleado no puede recibir al cliente en ese horario';
        select res_id from reserva where res_cli_id=clienteId and fechaIn=res_check_in and fechaFin=res_check_out into id;
        DELETE FROM reserva WHERE id=res_id;
    END IF;
END &&
DELIMITER ;

-- Hace un historial de INSERCIONES al inventario
DELIMITER &&
CREATE TRIGGER registro_insercion_inventario AFTER INSERT ON inventario FOR EACH ROW
BEGIN
	SET @accion = "INSERT",
		@inv_hist_old_nombre = null,
        @inv_hist_new_nombre = new.inv_nombre,
        @inv_hist_old_proovedor = null,
        @inv_hist_new_proovedor = new.inv_proovedor,
        @inv_hist_old_costo_producto = null,
        @inv_hist_new_costo_producto = new.inv_costo_producto,
        @inv_hist_old_cantidad_habitacion = null,
        @inv_hist_new_cantidad_habitacion = new.inv_cantidad_habitacion,
        @inv_hist_old_cantidad_hotel = null,
        @inv_hist_new_cantidad_hotel = new.inv_cantidad_hotel,
        @inv_hist_old_tra_id_administrador = null,
        @inv_hist_new_tra_id_administrador = new.inv_tra_id_administrador;
    INSERT INTO historial_inventario VALUES 
    (null,@accion,@inv_hist_old_nombre,@inv_hist_new_nombre,@inv_hist_old_proovedor,@inv_hist_new_proovedor,
	@inv_hist_old_costo_producto,@inv_hist_new_costo_producto,@inv_hist_old_cantidad_habitacion,@inv_hist_new_cantidad_habitacion,
    @inv_hist_old_cantidad_hotel,@inv_hist_new_cantidad_hotel,@inv_hist_old_tra_id_administrador,@inv_hist_new_tra_id_administrador,NOW(), USER());
END &&
DELIMITER ;


-- Hace un historial de ELIMINACIONES al inventario
DELIMITER &&
CREATE TRIGGER registro_eliminacion_inventario AFTER DELETE ON inventario FOR EACH ROW
BEGIN
	SET @accion = "DELETE",
		@inv_hist_old_nombre = old.inv_nombre,
        @inv_hist_new_nombre = null,
        @inv_hist_old_proovedor = old.inv_proovedor,
        @inv_hist_new_proovedor = null,
        @inv_hist_old_costo_producto = old.inv_costo_producto,
        @inv_hist_new_costo_producto = null,
        @inv_hist_old_cantidad_habitacion = old.inv_cantidad_habitacion,
        @inv_hist_new_cantidad_habitacion = null,
        @inv_hist_old_cantidad_hotel = old.inv_cantidad_hotel,
        @inv_hist_new_cantidad_hotel = null,
        @inv_hist_old_tra_id_administrador = old.inv_tra_id_administrador,
        @inv_hist_new_tra_id_administrador = null;
    INSERT INTO historial_inventario VALUES 
    (null,@accion,@inv_hist_old_nombre,@inv_hist_new_nombre,@inv_hist_old_proovedor,@inv_hist_new_proovedor,
	@inv_hist_old_costo_producto,@inv_hist_new_costo_producto,@inv_hist_old_cantidad_habitacion,@inv_hist_new_cantidad_habitacion,
    @inv_hist_old_cantidad_hotel,@inv_hist_new_cantidad_hotel,@inv_hist_old_tra_id_administrador,@inv_hist_new_tra_id_administrador, NOW(), USER());
END &&
DELIMITER ;


-- Hace un historial de ACTUALIZACIONES al inventario
DELIMITER &&
CREATE TRIGGER registro_actualizacion_inventario AFTER UPDATE ON inventario FOR EACH ROW
BEGIN
	SET @accion = "UPDATE",
		@inv_hist_old_nombre = old.inv_nombre,
        @inv_hist_new_nombre = new.inv_nombre,
        @inv_hist_old_proovedor = old.inv_proovedor,
        @inv_hist_new_proovedor = new.inv_proovedor,
        @inv_hist_old_costo_producto = old.inv_costo_producto,
        @inv_hist_new_costo_producto = new.inv_costo_producto,
        @inv_hist_old_cantidad_habitacion = old.inv_cantidad_habitacion,
        @inv_hist_new_cantidad_habitacion = new.inv_cantidad_habitacion,
        @inv_hist_old_cantidad_hotel = old.inv_cantidad_hotel,
        @inv_hist_new_cantidad_hotel = new.inv_cantidad_hotel,
        @inv_hist_old_tra_id_administrador = old.inv_tra_id_administrador,
        @inv_hist_new_tra_id_administrador = new.inv_tra_id_administrador;
    INSERT INTO historial_inventario VALUES 
    (null,@accion,@inv_hist_old_nombre,@inv_hist_new_nombre,@inv_hist_old_proovedor,@inv_hist_new_proovedor,
	@inv_hist_old_costo_producto,@inv_hist_new_costo_producto,@inv_hist_old_cantidad_habitacion,@inv_hist_new_cantidad_habitacion,
    @inv_hist_old_cantidad_hotel,@inv_hist_new_cantidad_hotel,@inv_hist_old_tra_id_administrador,@inv_hist_new_tra_id_administrador, NOW(), USER());
END &&
DELIMITER ;

-- Hace un historial de contratacion del empleados
DELIMITER &&
CREATE TRIGGER registro_contratacion_aseo AFTER INSERT ON trabajador_aseo FOR EACH ROW
BEGIN
    INSERT INTO historial_empleados (fechaIn, emp_puesto, trabajador_id, usu_empleador) VALUES 
    (now(),'trabajador_aseo',new.tra_id,user());
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_contratacion_cuidador AFTER INSERT ON trabajador_cuidador FOR EACH ROW
BEGIN
    INSERT INTO historial_empleados (fechaIn, emp_puesto, trabajador_id, usu_empleador) VALUES 
    (now(),'trabajador_cuidador',new.tra_id,user());
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_contratacion_celador AFTER INSERT ON trabajador_celador FOR EACH ROW
BEGIN
    INSERT INTO historial_empleados (fechaIn, emp_puesto, trabajador_id, usu_empleador) VALUES 
    (now(),'trabajador_celador',new.tra_id,user());
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_contratacion_admin_inventario AFTER INSERT ON trabajador_administrador_inventario FOR EACH ROW
BEGIN
    INSERT INTO historial_empleados (fechaIn, emp_puesto, trabajador_id, usu_empleador) VALUES 
    (now(),'trabajador_administrador_inventario',new.tra_id,user());
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_contratacion_atencion_cliente AFTER INSERT ON trabajador_atencion_cliente FOR EACH ROW
BEGIN
    INSERT INTO historial_empleados (fechaIn, emp_puesto, trabajador_id, usu_empleador) VALUES 
    (now(),'trabajador_atencion_cliente',new.tra_id,user());
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_contratacion_admin_jefe AFTER INSERT ON trabajador_administrador_jefe FOR EACH ROW
BEGIN
    INSERT INTO historial_empleados (fechaIn, emp_puesto, trabajador_id, usu_empleador) VALUES 
    (now(),'trabajador_administrador_jefe',new.tra_id,user());
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_contratacion_admin_reservas AFTER INSERT ON trabajador_administrador_reservas FOR EACH ROW
BEGIN
    INSERT INTO historial_empleados (fechaIn, emp_puesto, trabajador_id, usu_empleador) VALUES 
    (now(),'trabajador_administrador_reservas',new.tra_id,user());
END &&
DELIMITER ;

-- Hace un historial de la salida del empleados
DELIMITER &&
CREATE TRIGGER registro_salida_trabajador_aseo AFTER DELETE ON trabajador_aseo FOR EACH ROW
BEGIN
    UPDATE historial_empleados set fechaFin=now(), usu_finalizar=user() WHERE (trabajador_id=old.tra_id);
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_salida_trabajador_cuidador AFTER DELETE ON trabajador_cuidador FOR EACH ROW
BEGIN
    UPDATE historial_empleados set fechaFin=now(), usu_finalizar=user() WHERE (trabajador_id=old.tra_id);
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_salida_trabajador_celador AFTER DELETE ON trabajador_celador FOR EACH ROW
BEGIN
	UPDATE historial_empleados set fechaFin=now(), usu_finalizar=user() WHERE (trabajador_id=old.tra_id);
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_salida_trabajador_administrador_inventario AFTER DELETE ON trabajador_administrador_inventario FOR EACH ROW
BEGIN
    UPDATE historial_empleados set fechaFin=now(), usu_finalizar=user() WHERE (trabajador_id=old.tra_id);
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_salida_trabajador_atencion_cliente AFTER DELETE ON trabajador_atencion_cliente FOR EACH ROW
BEGIN
    UPDATE historial_empleados set fechaFin=now(), usu_finalizar=user() WHERE (trabajador_id=old.tra_id);
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_salida_trabajador_administrador_jefe AFTER DELETE ON trabajador_administrador_jefe FOR EACH ROW
BEGIN
    UPDATE historial_empleados set fechaFin=now(), usu_finalizar=user() WHERE (trabajador_id=old.tra_id);
END &&
DELIMITER ;
DELIMITER &&
CREATE TRIGGER registro_salida_trabajador_administrador_reservas AFTER DELETE ON trabajador_administrador_reservas FOR EACH ROW
BEGIN
    UPDATE historial_empleados set fechaFin=now(), usu_finalizar=user() WHERE (trabajador_id=old.tra_id);
END &&
DELIMITER ;

-- controla la insercion en trabajador_administrador_jefe_de
DELIMITER &&
CREATE TRIGGER registro_insercion_trabajador_administrador_jefe_de AFTER INSERT ON trabajador_administrador_jefe_de FOR EACH ROW
BEGIN
    UPDATE historial_empleados set empleador_id=new.trabajador_administrador_id WHERE (trabajador_id=new.trabajador_id AND isnull(empleador_id));
END &&
DELIMITER ;


-- Script de creación de Procedimientos almacenados y funciones.
DROP PROCEDURE IF EXISTS pa_facturacion;
DROP PROCEDURE IF EXISTS pa_nuevoCliente;
DROP PROCEDURE IF EXISTS pa_nuevaMascota;
DROP PROCEDURE IF EXISTS pa_nuevaSugerencia;
DROP PROCEDURE IF EXISTS pa_nuevoTrabajador;
DROP PROCEDURE IF EXISTS pa_buscarTrabajador;
DROP PROCEDURE IF EXISTS pa_mascPaseo;
DROP PROCEDURE IF EXISTS pa_parqueadero;
DROP PROCEDURE IF EXISTS pa_disponibilidad;
DROP PROCEDURE IF EXISTS pa_ResAct;
DROP FUNCTION IF EXISTS fun_existeCli;
DROP FUNCTION IF EXISTS fun_existeMasc;
DROP FUNCTION IF EXISTS fun_resAct;
DROP FUNCTION IF EXISTS fun_facturacion;

-- Crea la facturacion de reserva
DELIMITER $$ 
CREATE PROCEDURE pa_facturacion(clienteId int, cantDias int, fechaIn datetime, metPago varchar(25), cantHuesp int, AdminId int, trabId int, cabId int, mascotaServ boolean) 
BEGIN 
DECLARE costo decimal(15);
DECLARE fechaFin datetime;
DECLARE id int;

START TRANSACTION;
IF fun_existeCli(clienteId) THEN
SELECT fechaIn + interval cantDias day INTO fechaFin;
SELECT fun_facturacion(cantDias, mascotaServ) INTO costo;
INSERT INTO reserva (res_cli_id, res_cantidad_dias, res_check_in, res_check_out, res_costo, res_metodo_pago, res_cantidad_huespedes,
res_tra_admin_res_id, res_tra_atencion_cli_id) VALUES (clienteId, cantDias,fechaIn,fechaFin,costo,metPago,cantHuesp,AdminId,trabId);

SELECT res_id FROM reserva WHERE res_cli_id=clienteId AND fechaIn=res_check_in AND fechaFin=res_check_out INTO id;
INSERT INTO reserva_has_cabañas(res_id,cab_id) VALUES (id, cabId);
COMMIT;
ELSE ROLLBACK;
END IF;
END $$ 
DELIMITER ;

-- Permite revisar si ya existe el cliente
DELIMITER //
CREATE FUNCTION fun_existeCli(clienteId INT) RETURNS BOOLEAN deterministic
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe
    FROM cliente
    WHERE  cli_id=clienteId;
    IF existe != 0 THEN
        RETURN TRUE; 
    ELSE
        RETURN FALSE;
    END IF;
END //
DELIMITER ;

-- Permite revisar si el cliente esta en una reserva actualmente
DELIMITER //
CREATE FUNCTION fun_resAct(clienteId INT) RETURNS BOOLEAN deterministic
BEGIN
    DECLARE activa BOOLEAN;
    SELECT COUNT(*) INTO activa
    FROM reserva
    WHERE  res_cli_id=clienteId AND now()<res_check_out AND now()>res_check_in;
    IF activa != 0 THEN
        RETURN TRUE; 
    ELSE
        RETURN FALSE;
    END IF;
END //
DELIMITER ;

-- Permite revisar si ya existe la mascota de ese cliente en los registros del servicio paseo
DELIMITER //
CREATE FUNCTION fun_existeMasc(clienteId INT, mascNombre VARCHAR(45)) RETURNS BOOLEAN deterministic
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe
    FROM cuidador_cuida_mascota
    WHERE  mas_cli_id=clienteId AND mascNombre=mas_nombre;
    IF existe != 0 THEN
        RETURN TRUE; 
    ELSE
        RETURN FALSE;
    END IF;
END //
DELIMITER ;

-- Calcula el precio segun la cantidad de dias y si hay servicio de cuidar mascota o no
DELIMITER $$ 
CREATE FUNCTION fun_facturacion(cantDias INT, mascotaServ BOOLEAN) RETURNS INT deterministic
BEGIN 
DECLARE costo decimal(15);
SET costo = cantDias*70000;
IF mascotaServ = TRUE THEN 
        set costo = costo+(5000*cantDias);
END IF;
RETURN costo;
END $$ 
DELIMITER ;

-- Permite revisar si el cliente se encuentra en una reserva activa, los datos de esta o si eta adelantado o pasado
DELIMITER $$
CREATE PROCEDURE pa_ResAct(clienteId INT)
BEGIN
IF fun_resAct(clienteId) THEN
SELECT * FROM reserva
    WHERE  res_cli_id=clienteId AND now()<res_check_out AND now()>res_check_in;
ELSE
 SELECT now()<res_check_out AS Reserva_sin_iniciar, now()>res_check_in AS Reserva_finalizada FROM reserva
    WHERE  res_cli_id=clienteId;
END IF;
END $$
DELIMITER ;

-- Permite crear nuevos clientes
DELIMITER $$
CREATE PROCEDURE pa_nuevoCliente(clienteId int, nombre varchar(45), apellido varchar(45), vehiculo boolean, placaVeh varchar(8), nacionalidad varchar(45), telefono int)
BEGIN
IF vehiculo= TRUE AND nacionalidad = "0" THEN
	INSERT INTO cliente (cli_id,cli_nombre, cli_apellido, cli_vehiculo, cli_telefono) VALUES
	(clienteId,nombre, apellido, placaVeh, telefono);
ELSEIF vehiculo = false AND nacionalidad = "0" THEN 
	INSERT INTO cliente (cli_id,cli_nombre, cli_apellido, cli_telefono) VALUES
	(clienteId,nombre, apellido, telefono);
ELSEIF vehiculo= TRUE THEN
	INSERT INTO cliente (cli_id,cli_nombre, cli_apellido, cli_vehiculo, cli_nacionalidad, cli_telefono) VALUES
	(clienteId,nombre, apellido, placaVeh, nacionalidad, telefono);
ELSE 
	INSERT INTO cliente (cli_id,cli_nombre, cli_apellido, cli_vehiculo, cli_nacionalidad, cli_telefono) VALUES
	(clienteId,nombre, apellido, nacionalidad, telefono);
END IF;
END $$
DELIMITER ;

-- Permite crear nuevas mascotas
DELIMITER $$
CREATE PROCEDURE pa_nuevaMascota(masClienteId int, nombre varchar(45), raza varchar(45), especie varchar(45), genero varchar(45))
BEGIN
START TRANSACTION;	
    IF  NOT fun_existeMasc(masClienteId,nombre) THEN
    INSERT INTO mascota VALUES (masClienteId, nombre, raza, especie, genero);
    COMMIT;
    ELSE
		ROLLBACK;
    END IF;
END $$
DELIMITER ;

-- Permite crear nuevas sugerencias
DELIMITER $$
CREATE PROCEDURE pa_nuevaSugerencia(reservaId int, fecha DATETIME, sugerencia varchar(300))
BEGIN
DECLARE existe INT;
START TRANSACTION;	
    SELECT COUNT(*) INTO existe
    FROM reserva WHERE res_id=reservaId AND fecha<=res_check_out AND fecha>=res_check_in; 
    IF existe != 0 THEN
        INSERT INTO sugerencia (sug_fecha,sug_descripcion,sug_res_id) VALUES (fecha, sugerencia, reservaId);
		COMMIT;
    ELSE
		ROLLBACK;
    END IF;
END $$
DELIMITER ;

-- Permite crear nuevo/s producto/s en el inventario
DELIMITER $$
CREATE PROCEDURE pa_nuevoProductoInventario(nombre varchar(45), proovedor varchar(45), costo decimal(10,0), cantidadHabitacion int, cantidadHotel int, idAdministrador bigint)
BEGIN
	INSERT INTO inventario (inv_nombre,inv_proovedor, inv_costo_producto, inv_cantidad_habitacion, inv_cantidad_hotel, inv_tra_id_administrador) VALUES
	(nombre, proovedor, costo, cantidadHabitacion, cantidadHotel, idAdministrador);
END $$
DELIMITER ;

-- Permite revisar la disponibilidad de cabañas segun la fecha y cantidad de personas y saber la cantidad de opciones
DELIMITER $$
CREATE PROCEDURE pa_disponibilidad(cantHuespedes int, fechaIn date, out cantOp int)
BEGIN
SELECT cabaña.cab_id, cab_capacidad, cab_cantidad_cama_doble, cab_cantidad_cama_sencilla, cab_cantidad_habitaciones, res_check_out from cabaña join reserva_has_cabañas on cabaña.cab_id = reserva_has_cabañas.cab_id join reserva on reserva.res_id = reserva_has_cabañas.res_id where cab_capacidad>= cantHuespedes and fechaIn>=res_check_out;
SELECT count(*) INTO cantOp FROM cabaña JOIN reserva_has_cabañas ON cabaña.cab_id = reserva_has_cabañas.cab_id JOIN reserva on reserva.res_id = reserva_has_cabañas.res_id where cab_capacidad>= cantHuespedes and fechaIn>=res_check_out;
END $$
DELIMITER ;

-- Permite crear nuevos trabajadores
DELIMITER $$
CREATE PROCEDURE pa_nuevoTrabajador(trabJefeId int, trabId int, nombre varchar(45), apellido varchar(45), telefono int, jornada varchar(45), tabla varchar(45))
BEGIN
if tabla = "trabajador_aseo" then
	INSERT INTO trabajador_aseo (tra_id, tra_nombre, tra_apellido, tra_telefono, tra_jornada) VALUES
	(trabId,nombre, apellido, telefono, jornada);
elseif tabla = "trabajador_cuidador" then
	INSERT INTO trabajador_cuidador (tra_id, tra_nombre, tra_apellido, tra_telefono, tra_jornada) VALUES
	(trabId,nombre, apellido, telefono, jornada);
elseif tabla = "trabajador_celador" then
	INSERT INTO trabajador_celador VALUES (trabId,nombre, apellido, telefono, jornada);
elseif tabla = "trabajador_administrador_inventario" then
	INSERT INTO trabajador_administrador_inventario VALUES (trabId,nombre, apellido, telefono, jornada);
elseif tabla = "trabajador_atencion_cliente" then
	INSERT INTO trabajador_atencion_cliente VALUES (trabId,nombre, apellido, telefono, jornada);
elseif tabla = "trabajador_administrador_jefe" then
	INSERT INTO trabajador_administrador_jefe VALUES (trabId,nombre, apellido, telefono, jornada);
elseif tabla = "trabajador_administrador_reservas" then
	INSERT INTO trabajador_administrador_reservas VALUES (trabId,nombre, apellido, telefono, jornada);
end if;
insert into trabajador_administrador_jefe_de VALUES (trabJefeId,trabId);
END $$
DELIMITER ;

-- Permite ubicar la informacion de los empleados
DELIMITER $$
CREATE PROCEDURE pa_buscarTrabajador(trabId int, puesto varchar(45))
BEGIN
if puesto = "trabajador_aseo" then
	SELECT * from trabajador_aseo join trabajador_administrador_jefe_de on trabId=trabajador_id where trabId=tra_id;
elseif puesto = "trabajador_cuidador" then
	SELECT * from trabajador_cuidador join trabajador_administrador_jefe_de on trabId=trabajador_id where trabId=tra_id;
elseif puesto = "trabajador_celador" then
	SELECT * from trabajador_celador join trabajador_administrador_jefe_de on trabId=trabajador_id where trabId=tra_id;
elseif puesto = "trabajador_administrador_inventario" then
	SELECT * from trabajador_administrador_inventario join trabajador_administrador_jefe_de on trabId=trabajador_id where trabId=tra_id;
elseif puesto = "trabajador_atencion_cliente" then
	SELECT * from trabajador_atencion_cliente join trabajador_administrador_jefe_de on trabId=trabajador_id where trabId=tra_id;
elseif puesto = "trabajador_administrador_jefe" then
	SELECT * from trabajador_administrador_jefe join trabajador_administrador_jefe_de on trabId=trabajador_id where trabId=tra_id;
elseif puesto = "trabajador_administrador_reservas" then
	SELECT * , puesto from trabajador_administrador_reservas join trabajador_administrador_jefe_de on trabId=trabajador_id where trabId=tra_id;
end if;
END $$
DELIMITER ;

-- Permite manipular los parqueaderos
DELIMITER $$
CREATE PROCEDURE pa_parqueadero(id int, ocupado boolean)
BEGIN
	update parqueadero set par_ocupado = ocupado where par_id=id;
END $$
DELIMITER ;

-- Permite manejar la tabla de paseos
DELIMITER $$
CREATE PROCEDURE pa_mascPaseo(trabId int, cliId int, mascNombre varchar(45), cantTiempo time)
BEGIN
declare horaInicio time;
set horaInicio = (SUBTIME(CURRENT_TIME(), cantTiempo));
	insert into registro_paseos (mas_cli_id, mas_nombre, hor_inicio, hor_final, fecha, usu_registro_paseos) VALUES (cliId, mascNombre,horaInicio, now(), now(), user());
if fun_existeMasc(cliId,mascNombre) then
    update cuidador_cuida_mascota set trabajador_cuidador_id=trabId, mas_cli_id=cliId, mas_nombre=mascNombre, hora_recogida=horaInicio, hora_entrega=CURRENT_TIME() where mas_cli_id=cliId and mas_nombre=mascNombre;
else
	insert into cuidador_cuida_mascota VALUES(trabId, cliId, mascNombre, horaInicio, CURRENT_TIME());
end if ;    
END $$
DELIMITER ;

grant execute on procedure pa_facturacion to Administrador_Reservas, Atencion_Al_Cliente;
grant execute on procedure pa_nuevoCliente to Administrador_Reservas, Atencion_Al_Cliente;
grant execute on procedure pa_nuevaMascota to Administrador_Reservas, Atencion_Al_Cliente;
grant execute on procedure pa_disponibilidad to Administrador_Reservas, Atencion_Al_Cliente;
grant execute on procedure pa_nuevoTrabajador to Administrador_Jefe;
grant execute on procedure pa_nuevaSugerencia to Administrador_Reservas;
grant execute on procedure pa_nuevoProductoInventario to Administrador_Inventarios;
grant execute on procedure pa_buscarTrabajador to Administrador_Jefe;
grant execute on procedure pa_parqueadero to Celador, Administrador_Reservas;
grant execute on procedure pa_mascPaseo to Cuidador;
grant execute on procedure pa_ResAct to Administrador_Reservas, Atencion_Al_Cliente;
grant execute on function fun_existeMasc to Atencion_Al_Cliente, Administrador_Reservas;
grant execute on function fun_facturacion to Atencion_Al_Cliente, Administrador_Reservas;
grant execute on function fun_existeCli to Atencion_Al_Cliente, Administrador_Reservas;
grant execute on function fun_resAct to Administrador_Reservas, Atencion_Al_Cliente, Celador, Cuidador, Aseo;


-- Insertar datos en la tabla trabajador_aseo
INSERT INTO trabajador_aseo (tra_id, tra_nombre, tra_apellido, tra_telefono, tra_jornada) VALUES
(456213145,'Juan', 'Perez', 123456789, 'Entre semana'),
(564564564,'María', 'Gómez', 987654321, 'Fin de semana'),
(789456123,'Sandra', 'López', 345678912, 'Entre semana'),
(123654789,'Carlos', 'González', 987123456, 'Fin de semana'),
(321987456,'Luisa', 'Fernández', 654789123, 'Entre semana'),
(654321987,'Pedro', 'Ramírez', 123456789, 'Fin de semana'),
(987654321,'Ana', 'Martínez', 321987654, 'Entre semana'),
(984564564,'Laura', 'Díaz', 111111111, 'Fin de semana'),
(123456455,'Javier', 'Gómez', 222222222, 'Entre semana'),
(231564655,'Elena', 'Torres', 333333333, 'Fin de semana'),
(548942312,'Roberto', 'Sánchez', 444444444, 'Entre semana'),
(432123132,'Isabel', 'Luna', 555555555, 'Fin de semana');

-- Insertar datos en la tabla trabajador_cuidador
INSERT INTO trabajador_cuidador (tra_id, tra_nombre, tra_apellido, tra_telefono, tra_jornada) VALUES
(42715231,'Pedro', 'Rodriguez', 234567890, 'Entre semana'),
(85665654,'Laura', 'Martínez', 876543210, 'Fin de semana'),
(987654321,'Santiago', 'Hernández', 456123789, 'Entre semana'),
(654321987,'Valentina', 'García', 123987456, 'Fin de semana'),
(123456789,'Andrés', 'Pérez', 321987654, 'Entre semana'),
(456123789,'Mariana', 'López', 789654321, 'Fin de semana'),
(741852963,'Carlos', 'Martínez', 987654321, 'Entre semana'),
(123987456,'Laura', 'Díaz', 654789123, 'Fin de semana'),
(222333444,'Javier', 'Gómez', 333222111, 'Entre semana'),
(333222111,'Elena', 'Torres', 111222333, 'Fin de semana'),
(444111222,'Roberto', 'Sánchez', 222333444, 'Entre semana'),
(555444333,'Isabel', 'Luna', 444333222, 'Fin de semana');

-- Insertar datos en la tabla trabajador_celador
INSERT INTO trabajador_celador (tra_id, tra_nombre, tra_apellido, tra_telefono, tra_jornada) VALUES
(54123153,'Carlos', 'García', 345678901, 'diurna'),
(85212543,'Sofía', 'López', 765432109, 'nocturna'),
(111222333,'Sergio', 'Ramírez', 222333444, 'diurna'),
(222333444,'Luis', 'Hernández', 111222333, 'nocturna'),
(777888999,'Laura', 'Martínez', 666777888, 'diurna'),
(888999000,'Javier', 'Sánchez', 777888999, 'nocturna'),
(999000111,'Elena', 'Luna', 888999000, 'diurna'),
(000111222,'Roberto', 'Gutiérrez', 999000111, 'nocturna');

-- Insertar datos en la tabla trabajador_administrador_inventario
INSERT INTO trabajador_administrador_inventario (tra_id, tra_nombre, tra_apellido, tra_telefono, tra_jornada) VALUES
(97756453,'Luis', 'Fernández', 456789012, 'Entre semana'),
(11000354,'Ana', 'Díaz', 654321098, 'Fin de semana'),
(111222333,'Sergio', 'Ramírez', 222333444, 'Fin de semana'),
(222333444,'Luis', 'Hernández', 111222333, 'Entre semana'),
(333444555,'María', 'Pérez', 555444333, 'Fin de semana'),
(444555666,'Pedro', 'García', 333444555, 'Entre semana'),
(555666777,'Sofía', 'Gómez', 444555666, 'Fin de semana'),
(666777888,'Carlos', 'Díaz', 555666777, 'Entre semana');

-- Insertar datos en la tabla trabajador_atencion_cliente
INSERT INTO trabajador_atencion_cliente (tra_id, tra_nombre, tra_apellido, tra_telefono, tra_jornada) VALUES
(98745642,'Javier', 'Gutiérrez', 567890123, 'Entre semana'),
(12345645,'Elena', 'Ramírez', 543210987, 'Fin de semana'),
(222222333,'Luis', 'Hernández', 111222333, 'Entre semana'),
(333222111,'María', 'Pérez', 555444333, 'Fin de semana'),
(444111222,'Pedro', 'García', 333444555, 'Entre semana'),
(555444333,'Sofía', 'Gómez', 444555666, 'Fin de semana'),
(666555444,'Carlos', 'Díaz', 555666777, 'Entre semana'),
(777555666,'Laura', 'Martínez', 666777888, 'Fin de semana'),
(888555777,'Javier', 'Sánchez', 777888999, 'Entre semana'),
(999555888,'Elena', 'Luna', 888999000, 'Fin de semana'),
(000555999,'Roberto', 'Gutiérrez', 999000111, 'Entre semana'),
(111555000,'Isabel', 'Ramírez', 000111222, 'Fin de semana');

-- Insertar datos en la tabla trabajador_administrador_jefe
INSERT INTO trabajador_administrador_jefe (tra_id, tra_nombre, tra_apellido, tra_telefono, tra_jornada) VALUES
(65498521,'Roberto', 'Sánchez', 678901234, 'diurna'),
(79852132,'Isabel', 'Torres', 432109876, 'nocturna'),
(777555666,'Lucía', 'Hernández', 111222333, 'diurna'),
(888555777,'Rafael', 'Pérez', 555444333, 'nocturna'),
(999555888,'Alejandra', 'García', 333444555, 'diurna'),
(000555999,'Andrés', 'Gómez', 444555666, 'nocturna');

-- Insertar datos en la tabla trabajador_administrador_reservas
INSERT INTO trabajador_administrador_reservas (tra_id, tra_nombre, tra_apellido, tra_telefono, tra_jornada) VALUES
(666888555,'Diego', 'Vargas', 222333444, 'nocturna'),
(777999444,'Laura', 'López', 333444555, 'diurna'),
(888000333,'Andrés', 'Martínez', 444555666, 'nocturna'),
(999111222,'Gabriela', 'Ramírez', 555666777, 'diurna'),
(000222333,'Sergio', 'Gómez', 666777888, 'nocturna'),
(111333444,'María', 'Díaz', 777888999, 'diurna'),
(222444555,'Eduardo', 'Pérez', 888999000, 'nocturna'),
(333555666,'Luisa', 'Sánchez', 999000111, 'diurna'),
(444666777,'Carlos', 'Gutiérrez', 101010101, 'nocturna');

-- Insertar datos en la tabla trabajador_administrador_jefe_de
INSERT INTO trabajador_administrador_jefe_de (trabajador_administrador_id, trabajador_id) VALUES
(65498521, 456213145),
(79852132, 564564564),
(777555666, 42715231),
(888555777, 85665654),
(999555888, 54123153),
(000555999, 85212543),
(000555999, 97756453),
(999555888, 11000354),
(888555777, 98745642),
(777555666, 12345645),
(65498521, 789456123),
(79852132, 123654789),
(777555666, 321987456),
(888555777, 654321987),
(999555888, 987654321),
(000555999, 111111111),
(000555999, 222222222),
(999555888, 333333333),
(888555777, 444444444),
(777555666, 555555555),
(79852132, 987654321),
(65498521, 654321987),
(65498521, 123456789),
(79852132, 456123789),
(777555666, 741852963),
(888555777, 123987456),
(999555888, 222333444),
(000555999, 222333444),
(000555999, 444111222),
(999555888, 555444333),
(888555777, 111222333),
(777555666, 222333444),
(79852132, 333444555),
(65498521, 444555666),
(65498521, 555666777),
(79852132, 666777888),
(777555666,777888999),
(888555777, 888999000),
(999555888, 999000111),
(000555999, 000111222),
(79852132, 111222333 ),
(777555666,222333444),
(999555888, 222222333),
(999555888, 000555999),
(222333444, 999555888),
(888555777, 888555777),
(888555777, 777555666),
(79852132, 666555444),
(65498521, 555444333),
(65498521, 444111222),
(79852132, 333222111),
(777555666, 444666777),
(888555777, 333555666),
(999555888, 222444555),
(000555999, 111333444),
(000555999, 000222333),
(999555888, 999111222),
(888555777, 888000333),
(777555666, 777999444),
(79852132, 666888555);

-- Insertar datos en la tabla cliente
INSERT INTO cliente (cli_id,cli_nombre, cli_apellido, cli_vehiculo, cli_nacionalidad, cli_telefono) VALUES
(654512323,'Carlos', 'Gómez', 'ABC123', 'Colombiana', 123456789),
(654654465,'Laura', 'Martínez', 'XYZ789', 'Mexicana', 987654321),
(333555222,'Sergio', 'Hernández', 'ABC123', 'Colombiana', 123456789),
(444555333,'María', 'Pérez', 'XYZ789', 'Mexicana', 987654321),
(555555444,'Andrés', 'Ramírez', 'DEF456', 'Colombiana', 123123123),
(666555555,'Sara', 'García', 'GHI789', 'Venezolana', 456456456),
(777555666,'Carlos', 'López', 'JKL012', 'Colombiana', 789789789),
(888555777,'Laura', 'Martínez', 'MNO345', 'Mexicana', 101010101),
(999555888,'Javier', 'Díaz', 'PQR678', 'Colombiana', 121212121),
(000555999,'Elena', 'Gómez', 'STU901', 'Ecuatoriana', 232323232),
(111555000,'Roberto', 'Sánchez', 'VWX234', 'Colombiana', 343434343),
(222555111,'Isabel', 'Torres', 'YZA567', 'Peruana', 454545454);

-- Insertar datos en la tabla mascota
INSERT INTO mascota (mas_cli_id, mas_nombre, mas_raza, mas_especie, mas_genero) VALUES
(222555111, 'Max', 'Labrador', 'perro', 'macho'),
(111555000, 'Luna', 'Persa', 'gato', 'hembra'),
(000555999, 'Bobby', 'Dálmata', 'perro', 'macho'),
(999555888, 'Milo', 'Siames', 'gato', 'macho'),
(888555777, 'Lola', 'Golden Retriever', 'perro', 'hembra'),
(777555666, 'Bella', 'Persa', 'gato', 'hembra'),
(666555555, 'Maxi', 'Bulldog', 'perro', 'macho'),
(555555444, 'Rocky', 'Criollo', 'perro', 'macho'),
(444555333, 'Luna', 'Labrador', 'perro', 'hembra'),
(333555222, 'Coco', 'Chihuahua', 'perro', 'macho'),
(654654465, 'Lola', 'Bichon Frise', 'perro', 'hembra'),
(654512323, 'Toby', 'Poodle', 'perro', 'macho'),
(444555333, 'Moon', 'Siames', 'gato', 'hembra'),
(333555222, 'Pepe', 'Criollo', 'gato', 'macho'),
(654654465, 'Lilo', 'Criollo', 'perro', 'hembra'),
(654512323, 'Max', 'Criollo', 'gato', 'macho');

-- Insertar datos en la tabla cuidador_cuida_mascota
INSERT INTO cuidador_cuida_mascota (trabajador_cuidador_id, mas_cli_id, mas_nombre, hora_recogida, hora_entrega) VALUES
(555444333, 111555000, 'Max', '08:00:00', '16:00:00'),
(444111222, 222555111, 'Luna', '09:00:00', '17:00:00'),
(333222111, 000555999, 'Bobby', '08:00:00', '16:00:00'),
(222333444, 999555888, 'Milo', '09:00:00', '17:00:00'),
(123987456, 888555777, 'Lola', '10:00:00', '18:00:00'),
(741852963, 777555666, 'Bella', '11:00:00', '19:00:00'),
(456123789, 666555555, 'Maxi', '08:30:00', '16:30:00'),
(123456789, 555555444, 'Rocky', '09:30:00', '17:30:00'),
(654321987, 444555333, 'Luna', '10:30:00', '18:30:00'),
(987654321, 333555222, 'Coco', '11:30:00', '19:30:00'),
(85665654, 654654465, 'Lola', '08:45:00', '16:45:00'),
(42715231, 654512323, 'Toby', '09:45:00', '17:45:00');

-- Insertar datos en la tabla cabaña
INSERT INTO cabaña (cab_id, cab_capacidad, cab_cantidad_cama_doble, cab_cantidad_cama_sencilla, cab_cantidad_habitaciones) VALUES
(1, 7, 6, 1, 2),
(2, 5, 4, 1, 1),
(3, 4, 2, 1, 1),
(4, 5, 3, 1, 1),
(5, 4, 2, 1, 1),
(6, 4, 2, 1, 1),
(7, 2, 0, 1, 4),
(8, 2, 0, 1, 1),
(9, 7, 3, 2, 2),
(10, 2, 0, 1, 1),
(11, 6, 4, 2, 2),
(12, 8, 4, 2, 2);

-- Insertar datos en la tabla trabajador_asea_cabaña
INSERT INTO trabajador_asea_cabaña (tra_id, cab_id) VALUES
(456213145, 1), (456213145, 2),
(432123132, 2), (432123132, 1),
(548942312, 3), (548942312, 4),
(231564655, 4), (231564655, 3),
(123456455, 5), (123456455, 6),
(984564564, 6), (984564564, 5),
(987654321, 7), (987654321, 8),
(654321987, 8), (654321987, 7),
(321987456, 9), (321987456, 10),
(123654789, 10), (123654789, 9),
(789456123, 11), (789456123, 12),
(564564564, 12), (564564564, 11);

-- Insertar datos en la tabla parqueadero
INSERT INTO parqueadero (par_id, par_ocupado, par_cab_id) VALUES
(1, 0, 1),
(2, 1, 2),
(3, 1, 3),
(4, 0, 4),
(5, 1, 5),
(6, 0, 6),
(7, 0, 7),
(8, 1, 8),
(9, 0, 9),
(10, 1, 10),
(11, 0, 11),
(12, 1, 12);
INSERT INTO parqueadero (par_id, par_ocupado) VAlUES
(13, 0),
(14, 1),
(15, 1),
(16, 0),
(17, 1),
(18, 0),
(19, 0),
(20, 1),
(21, 0),
(22, 1),
(23, 0),
(24, 1);

-- Insertar datos en la tabla servicio
INSERT INTO servicio (sev_nombre) VALUES
('Balcon'),
('Nevera'),
('Sala'),
('Ventilador extra');

-- Insertar datos en la tabla sugerencia
INSERT INTO sugerencia (sug_fecha, sug_descripcion, sug_res_id) VALUES
('2023-10-29 14:30:00', 'Excelente servicio en el restaurante.',1),
('2023-10-30 10:15:00', 'Sugerencia: mejorar la señal de WiFi.',1),
('2023-11-01 14:30:00', 'La atención al cliente es excelente.',2),
('2023-11-02 10:15:00', 'Sugerencia: ampliar el menú del restaurante.',3),
('2023-11-03 09:45:00', 'Las instalaciones del spa son increíbles.',4),
('2023-11-04 16:20:00', 'Sugerencia: mejorar la señal de WiFi en las habitaciones.',1),
('2023-11-05 11:30:00', 'El gimnasio es pequeño pero funcional.',6),
('2023-11-06 15:10:00', 'Sugerencia: añadir más actividades recreativas para niños.',6),
('2023-11-07 17:45:00', 'La comida en el restaurante es deliciosa.',7),
('2023-11-08 14:00:00', 'Sugerencia: ofrecer opciones de comida vegetariana en el menú.',9),
('2023-11-09 12:15:00', 'La piscina es muy relajante.',9),
('2023-11-10 08:30:00', 'Sugerencia: proporcionar más sillas y sombrillas en la piscina.',10);

-- Insertar datos en la tabla reserva
INSERT INTO reserva (res_cli_id, res_cantidad_dias, res_check_in, res_check_out, res_costo, res_metodo_pago, res_cantidad_huespedes, res_tra_admin_res_id, res_tra_atencion_cli_id) VALUES
(654512323, 3, '2023-11-01', '2023-11-04', 210000, 'Tarjeta crédito', 2, 111333444, 98745642),
(654654465, 2, '2023-11-09', '2023-11-11', 140000, 'Efectivo', 1, 111333444, 222222333),
(333555222, 4, '2023-11-05', '2023-11-09', 280000, 'Tarjeta crédito', 2, 111333444, 12345645),
(222555111, 5, '2023-11-02', '2023-11-07', 350000, 'Efectivo', 2, 777999444, 444111222),
(111555000, 3, '2023-11-12', '2023-11-15', 210000, 'Tarjeta crédito', 1, 666888555, 333222111),
(999555888, 6, '2023-11-12', '2023-11-18', 420000, 'Efectivo', 3, 888000333, 111555000	),
(000555999, 2, '2023-11-12', '2023-11-14', 140000, 'Tarjeta crédito', 2, 999111222, 555444333),
(888555777, 7, '2023-11-22', '2023-11-29', 490000, 'Efectivo', 4, 000222333, 666555444),
(777555666, 3, '2023-11-19', '2023-11-22', 210000, 'Tarjeta crédito', 1, 111333444, 777555666),
(555555444, 4, '2023-11-24', '2023-11-28', 280000, 'Efectivo', 5, 222444555, 888555777),	
(444555333,5,'2023-11-28', '2023-11-30', 350000, 'Efectivo', 2, 333555666, 888555777),
(666555555,7,'2023-11-27', '2023-11-30 ', 490000, 'Efectivo', 5, 444666777, 000555999),
(555555444, 2, '2023-11-30', '2023-12-02', 140000, 'Efectivo', 2, 222444555, 888555777),	
(444555333, 2, '2023-12-04', '2023-12-06', 140000, 'Efectivo', 2, 333555666, 888555777),
(654654465, 2, '2023-11-06', '2023-11-08', 140000, 'Efectivo', 1, 111333444, 222222333);

-- Insertar datos en la tabla reserva_has_cabañas
INSERT INTO reserva_has_cabañas (res_id, cab_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11,11),
(12,12),
(13,10),
(14,11),
(15,2);

-- Insertar datos en la tabla inventario
INSERT INTO inventario (inv_nombre, inv_proovedor, inv_costo_producto, inv_cantidad_habitacion, inv_cantidad_hotel, inv_tra_id_administrador) VALUES
('Toalla', 'Proovedor A', 10500, 100, 200, 666777888),
('Cubierto', 'Proovedor B', 5600, 50, 100, 666777888),
('Sábana', 'Proovedor C', 9500, 50, 100, 666777888),
('Almohadas', 'Proovedor D', 3200, 30, 60, 333444555),
('Toallas de piscina', 'Proovedor A', 7500, 80, 160, 666777888),
('Cafeteras', 'Proovedor E', 15000, 25, 50, 555666777),
('Ventilador', 'Proovedor H', 60000, 25, 50, 555666777),
('Secadores de pelo', 'Proovedor F', 5800, 40, 80, 444555666),
('Planchas y tablas de planchar', 'Proovedor G', 8700, 35, 70, 333444555),
('Productos de limpieza', 'Proovedor H', 3500, 100, 200, 222333444),
('Mini refrigeradores', 'Proovedor I', 16000, 15, 30, 111222333),
('Juegos de baño', 'Proovedor J', 8900, 60, 120, 11000354),
('Servilletas y manteles', 'Proovedor K', 5200, 45, 90, 97756453);

-- Insertar datos en la tabla cabaña_has_servicios
INSERT INTO cabaña_has_servicio (sev_nombre, cab_id) VALUES
('Balcon', 1),
('Nevera', 1),
('Ventilador extra', 1),
('Balcon', 2),
('Sala', 2),
('Nevera', 4),
('Nevera', 7),
('Nevera', 8),
('Nevera', 9),
('Sala', 10),
('Ventilador extra', 11),
('Sala', 11),
('Balcon', 11);

-- Prueba de algunas funciones y procedimientos almacenados
call pa_nuevoProductoInventario('Manteles', 'Proovedor W', 5200, 45, 90, 97756453);
call pa_facturacion(777555666,2,'2023-12-08','Tarjeta Debito',1,333555666,888555777,6,false);
call pa_nuevoCliente(1001114586,"Tatiana", "Perez",false,'0',"0",30235695);
call pa_nuevoCliente(1001118986,"Angie", "Perez",true,'DAF326',"Mexicana",30555695);
call pa_nuevaMascota(777555666,"Pepe", "Husky","Perro","hembra");
call pa_nuevoTrabajador(65498521,114562378,"Camilo","Sanchez",1238569,"diurna",'trabajador_celador');
delete from trabajador_celador where tra_id=114562378;
call pa_parqueadero(14,1);
call pa_mascPaseo(555444333,111555000,'Max','02:00:00');
call pa_buscarTrabajador(666888555,"trabajador_administrador_reservas" );
call pa_disponibilidad(4,"2023-11-08",@cantDispo);
call pa_ResAct(777555666);
select fun_resAct(654654465);
