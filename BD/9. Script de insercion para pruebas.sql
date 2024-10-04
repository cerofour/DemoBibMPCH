USE BMPCH;

/* Tabla: tipos_estados */
INSERT INTO tipos_estados (tipo_estado, activo) VALUES
('Activo', TRUE),
('Inactivo', FALSE),
('Suspendido', FALSE),
('En revisión', FALSE),
('Finalizado', FALSE);

/* Tabla: tipos_textos */
INSERT INTO tipos_textos (tipo_texto) VALUES
('Libro'),
('Revista'),
('Artículo'),
('Tesis'),
('Ensayo'),
('Informe');

/* Tabla: autores */
INSERT INTO autores (seudonimo, nombre, apellido_paterno, apellido_materno) VALUES
('jdoe', 'John', 'Doe', 'Smith'),
('mkent', 'Maria', 'Kent', 'Brown'),
('rweasley', 'Ron', 'Weasley', 'Granger'),
('hmorgan', 'Harry', 'Morgan', 'Potter'),
('lstorm', 'Linda', 'Storm', 'Reed');

/* Tabla: editoriales */
INSERT INTO editoriales (nombre) VALUES
('Editorial Alpha'),
('Editorial Beta'),
('Editorial Gamma'),
('Editorial Delta'),
('Editorial Epsilon');

/* Tabla: paises */
INSERT INTO paises (pais) VALUES
('Perú'),
('Argentina'),
('Chile'),
('Colombia'),
('México');

/* Tabla: regiones */
INSERT INTO regiones (pais_id, region) VALUES
(1, 'Lima'),
(1, 'Cusco'),
(2, 'Buenos Aires'),
(2, 'Córdoba'),
(3, 'Santiago');

/* Tabla: provincias */
INSERT INTO provincias (region_id, provincia) VALUES
(1, 'Lima Metropolitana'),
(1, 'Huaral'),
(2, 'Cusco'),
(3, 'Capital Federal'),
(4, 'Córdoba Capital');

/* Tabla: distritos */
INSERT INTO distritos (provincia_id, distrito) VALUES
(1, 'Miraflores'),
(1, 'San Isidro'),
(2, 'Huaral Centro'),
(3, 'Cusco Centro'),
(4, 'Belgrano');

/* Tabla: direcciones_clientes */
INSERT INTO direcciones_clientes (distrito_id, direccion) VALUES
(1, 'Av. Larco 123'),
(1, 'Calle Pardo 456'),
(2, 'Jr. Huánuco 789'),
(3, 'Jr. Lima 321'),
(4, 'Av. América 654');

/* Tabla: tipos_prestamos */
INSERT INTO tipos_prestamos (tipo_prestamo) VALUES
('Corto plazo'),
('Largo plazo'),
('Consulta interna'),
('Consulta externa'),
('Reserva');

/* Tabla: tipos_documentos */
INSERT INTO tipos_documentos (tipo_documento) VALUES
('DNI'),
('Pasaporte'),
('Carnet de extranjería'),
('Licencia de conducir'),
('Tarjeta de identificación');

/* Tabla: roles_usuarios */
INSERT INTO roles_usuarios (rol_usuario) VALUES
('Administrador'),
('Usuario regular'),
('Bibliotecario'),
('Gerente'),
('Supervisor');

/* Tabla: categorias */
INSERT INTO categorias (categoria) VALUES
('Ciencia'),
('Tecnología'),
('Arte'),
('Historia'),
('Literatura');

/* Tabla: niveles_educativos */
INSERT INTO niveles_educativos (nivel_educativo) VALUES
('Primaria'),
('Secundaria'),
('Técnico'),
('Universitario'),
('Postgrado');

/* Tabla: generos */
INSERT INTO generos (genero) VALUES
('Masculino'),
('Femenino'),
('No Binario'),
('Prefiero no decirlo'),
('Otro');

/* Tabla: estados_prestamos */
INSERT INTO estados_prestamos (estado_prestamo) VALUES
('Solicitado'),
('En proceso'),
('Devuelto'),
('Pendiente'),
('Cancelado');

/* Tabla: carnets */
INSERT INTO carnets (tipo_estado_id, codigo, fecha_emision, fecha_vencimiento) VALUES
(1, 'CARN001', '2023-09-01', '2024-09-01'),
(1, 'CARN002', '2023-09-15', '2024-09-15'),
(2, 'CARN003', '2023-10-01', '2024-10-01'),
(3, 'CARN004', '2023-10-10', '2024-10-10'),
(4, 'CARN005', '2023-11-01', '2024-11-01');

/* Tabla: recursos_textuales */
INSERT INTO recursos_textuales (titulo, fecha_publicacion, stock, numero_paginas, edicion, volumen, codigo, tipo_texto_id, editorial_id) VALUES
('Fundamentos de Programación', '2021-01-15', 10, 450, 2, 1, 'RP001', 1, 1),
('Revista Científica', '2020-12-30', 20, 50, 1, 3, 'RP002', 2, 2),
('Análisis Económico', '2019-11-20', 5, 200, 1, 0, 'RP003', 3, 3),
('Historia del Perú', '2018-08-05', 15, 600, 1, 2, 'RP004', 4, 4),
('Literatura y Sociedad', '2020-03-10', 12, 300, 1, 0, 'RP005', 5, 5);

/* Tabla: clientes */
INSERT INTO clientes (nombre, apellido_paterno, apellido_materno, genero_id, direccion_cliente_id, telefono, correo, documento, tipo_documento_id, carnet_id, nivel_educativo_id) VALUES
('Ana', 'García', 'Rojas', 2, 1, '987654321', 'ana.garcia@correo.com', '12345678', 1, 1, 4),
('Carlos', 'Fernández', 'Guzmán', 1, 2, '987654322', 'carlos.fernandez@correo.com', '87654321', 1, 2, 4),
('Diana', 'Torres', 'Lopez', 2, 3, '987654323', 'diana.torres@correo.com', '23456789', 2, 3, 4),
('Emanuel', 'Rojas', 'Perez', 1, 4, '987654324', 'emanuel.rojas@correo.com', '34567890', 1, 4, 4),
('Fernanda', 'Gonzales', 'Mendoza', 2, 5, '987654325', 'fernanda.gonzales@correo.com', '45678901', 1, 5, 4);

/* Tabla: usuarios */
INSERT INTO usuarios (cliente_id, rol_usuario_id, psk) VALUES
(1, 2, 'hashed_password1'),
(2, 2, 'hashed_password2'),
(3, 3, 'hashed_password3'),
(4, 4, 'hashed_password4'),
(5, 5, 'hashed_password5');

/* Tabla: prestamos */
INSERT INTO prestamos (usuario_id, recurso_textual_id, tipo_prestamo_id, estado_prestamo_id, fecha_inicial, fecha_programada) VALUES
(1, 1, 1, 1, '2023-09-10 10:00:00', '2023-09-20 18:00:00'),
(2, 2, 2, 2, '2023-09-12 14:30:00', '2023-09-25 18:00:00'),
(3, 3, 3, 3, '2023-09-15 09:00:00', '2023-09-22 18:00:00'),
(4, 4, 1, 1, '2023-09-18 11:30:00', '2023-09-30 18:00:00'),
(5, 5, 2, 2, '2023-09-20 12:00:00', '2023-10-05 18:00:00');

/* Tabla: recursos_textuales_autores */
INSERT INTO recursos_textuales_autores (recurso_textual_id, autor_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

/* Tabla: registros_accesos_usuarios */
INSERT INTO registros_accesos_usuarios (usuario_id, fecha_ingreso, direccion_ip) VALUES
(1, '2023-09-01 09:00:00', '192.168.1.1'),
(2, '2023-09-02 10:15:00', '192.168.1.2'),
(3, '2023-09-03 11:30:00', '192.168.1.3'),
(4, '2023-09-04 12:45:00', '192.168.1.4'),
(5, '2023-09-05 14:00:00', '192.168.1.5');

/* Tabla: categorias_recursos_textuales */
INSERT INTO categorias_recursos_textuales (recurso_textual_id, categoria_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
