CREATE DATABASE BMPCH;

USE BMPCH;

/*
FORMATO DE FECHA: AAAA/MM/DD
*/

CREATE TABLE tipos_estados (
	id_tipo_estado BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	tipo_estado VARCHAR(255) UNIQUE NOT NULL

);

CREATE TABLE tipos_textos (
	id_tipo_texto BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	tipo_texto VARCHAR(255) UNIQUE NOT NULL

);

CREATE TABLE autores (
	id_autor BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	seudonimo VARCHAR(255) UNIQUE NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	apellidos VARCHAR(255) NOT NULL

);

CREATE TABLE editoriales (
	id_editorial BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	nombre VARCHAR(255) UNIQUE NOT NULL

);

CREATE TABLE paises (
	id_pais BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	pais VARCHAR(255) UNIQUE NOT NULL

);

CREATE TABLE regiones (
	id_region BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	pais_id BIGINT UNSIGNED NOT NULL,
	region VARCHAR(255) UNIQUE NOT NULL,
	FOREIGN KEY (pais_id) REFERENCES paises(id_pais)

);

CREATE TABLE provincias (
	id_provincia BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	region_id BIGINT UNSIGNED NOT NULL,
	provincia VARCHAR(255) NOT NULL,
	FOREIGN KEY (region_id) REFERENCES regiones(id_region)

);

CREATE TABLE distritos (
	id_distrito BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	provincia_id BIGINT UNSIGNED NOT NULL,
	distrito VARCHAR(255) NOT NULL,
	FOREIGN KEY (provincia_id) REFERENCES provincias(id_provincia)

);

CREATE TABLE direcciones_clientes (
	id_direccion_cliente BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	distrito_id BIGINT UNSIGNED NOT NULL,
	direccion VARCHAR(255) NOT NULL,
	FOREIGN KEY (distrito_id) REFERENCES distritos(id_distrito)

);

CREATE TABLE tipos_prestamos (
	id_tipo_prestamo BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	tipo_prestamo VARCHAR(255) UNIQUE NOT NULL

);

CREATE TABLE tipos_documentos (
	id_tipo_documento BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	tipo_documento VARCHAR(255) UNIQUE NOT NULL

);

CREATE TABLE administradores (
	id_administrador BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	usuario VARCHAR(255) UNIQUE NOT NULL,
	correo VARCHAR(255) UNIQUE NOT NULL,
	psk VARCHAR(255) NOT NULL,
    CONSTRAINT chk_correo_admin CHECK (correo RLIKE '^[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}$')

);

CREATE TABLE navegadores (
	id_navegador BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	navegador VARCHAR(255) UNIQUE NOT NULL

);

CREATE TABLE carnets (
	id_carnet BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	fecha_emision DATE NOT NULL DEFAULT (CURRENT_DATE),
	fecha_vencimiento DATE NOT NULL DEFAULT (DATE_ADD(fecha_emision, INTERVAL 1 YEAR)),
	tipo_estado_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (tipo_estado_id) REFERENCES tipos_estados(id_tipo_estado),
    CONSTRAINT chk_fecha_vencimiento CHECK (fecha_vencimiento > fecha_emision)
    
);

CREATE TABLE recursos_textuales (
	id_recurso_textual BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	titulo VARCHAR(255) NOT NULL,
	fecha_publicacion DATE NOT NULL,
	stock TINYINT UNSIGNED NOT NULL DEFAULT 0,
	numero_paginas SMALLINT UNSIGNED NOT NULL,
	edicion TINYINT UNSIGNED NOT NULL DEFAULT 0,
	volumen TINYINT UNSIGNED NOT NULL DEFAULT 0,
	editorial_id BIGINT UNSIGNED NOT NULL,
	tipo_texto_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (editorial_id) REFERENCES editoriales(id_editorial),
	FOREIGN KEY (tipo_texto_id) REFERENCES tipos_textos(id_tipo_texto),
    CONSTRAINT chk_numero_paginas CHECK (numero_paginas > 0)

);

CREATE TABLE registros_accesos_administradores (
	id_registro_acceso_admin BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	administrador_id BIGINT UNSIGNED NOT NULL,
	navegador_id BIGINT UNSIGNED NOT NULL,
	fecha_ingreso DATETIME NOT NULL DEFAULT (NOW()),
	direccion_ip VARCHAR(255) NOT NULL,
	FOREIGN KEY (administrador_id) REFERENCES administradores(id_administrador),
	FOREIGN KEY (navegador_id) REFERENCES navegadores(id_navegador),
    CONSTRAINT chk_direccion_ip_admins CHECK (
		direccion_ip RLIKE '^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
        OR direccion_ip RLIKE '(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))'
    )

);

CREATE TABLE clientes (
	id_clientes BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	documento VARCHAR(20) UNIQUE NOT NULL,
	tipo_documento_id BIGINT UNSIGNED NOT NULL,
	nombre VARCHAR(255) NOT NULL,
	apellido_paterno VARCHAR(255) NOT NULL,
	apellido_materno VARCHAR(255) NOT NULL,
	direccion_cliente_id BIGINT UNSIGNED NOT NULL,
	telefono VARCHAR(255) UNIQUE NOT NULL,
	correo VARCHAR(255) UNIQUE NOT NULL,
	carnet_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (tipo_documento_id) REFERENCES tipos_documentos(id_tipo_documento),
	FOREIGN KEY (direccion_cliente_id) REFERENCES direcciones_clientes(id_direccion_cliente),
	FOREIGN KEY (carnet_id) REFERENCES carnets(id_carnet),
    CONSTRAINT chk_documento CHECK (documento RLIKE '^\d{8,20}$'),
    CONSTRAINT chk_telefono CHECK (telefono RLIKE '^\d{9}$'),
    CONSTRAINT chk_correo_cliente CHECK (correo RLIKE '^[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}$')
    
);

CREATE TABLE prestamos (
	id_prestamo BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	usuario_cliente_id BIGINT UNSIGNED NOT NULL,
	recurso_textual_id BIGINT UNSIGNED NOT NULL,
	tipo_prestamo_id BIGINT UNSIGNED NOT NULL,
	recogido BOOLEAN NOT NULL DEFAULT FALSE,
	devuelto BOOLEAN NOT NULL DEFAULT FALSE,
	fecha_inicial DATETIME NOT NULL DEFAULT (CURRENT_DATE),
	fecha_programada DATETIME NOT NULL,
	fecha_devolucion DATETIME DEFAULT NULL,
	FOREIGN KEY (usuario_cliente_id) REFERENCES clientes(id_clientes),
	FOREIGN KEY (recurso_textual_id) REFERENCES recursos_textuales(id_recurso_textual),
	FOREIGN KEY (tipo_prestamo_id) REFERENCES tipos_prestamos(id_tipo_prestamo),
    CONSTRAINT chk_fecha_programada CHECK (fecha_programada >= fecha_inicial),
    CONSTRAINT chk_fecha_devolucion CHECK (fecha_devolucion >= fecha_inicial OR fecha_devolucion IS NULL)
    
);

CREATE TABLE usuarios_clientes (
	id_usuario_cliente BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	usuario VARCHAR(255) UNIQUE NOT NULL,
	psk VARCHAR(255) NOT NULL,
	cliente_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id_clientes)

);

CREATE TABLE recursos_textuales_autores (
	recurso_textual_id BIGINT UNSIGNED NOT NULL,
	autor_id BIGINT UNSIGNED NOT NULL,
	PRIMARY KEY (recurso_textual_id, autor_id),
	FOREIGN KEY (recurso_textual_id) REFERENCES recursos_textuales(id_recurso_textual),
	FOREIGN KEY (autor_id) REFERENCES autores(id_autor)

);

CREATE TABLE registros_accesos_clientes (
	id_registro_acceso_cliente BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	usuario_cliente_id BIGINT UNSIGNED NOT NULL,
	navegador_id BIGINT UNSIGNED NOT NULL,
	fecha_ingreso DATETIME NOT NULL DEFAULT (NOW()),
	direccion_ip VARCHAR(255) NOT NULL,
	FOREIGN KEY (usuario_cliente_id) REFERENCES usuarios_clientes(id_usuario_cliente),
	FOREIGN KEY (navegador_id) REFERENCES navegadores(id_navegador),
    CONSTRAINT chk_direccion_ip_clientes CHECK (
		direccion_ip RLIKE '^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'
        OR direccion_ip RLIKE '(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])\\.){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))'
    )
);

