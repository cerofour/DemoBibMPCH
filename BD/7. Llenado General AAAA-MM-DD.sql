-- Insertar datos en la tabla tipos_estados
INSERT INTO tipos_estados (tipo_estado, activo) VALUES 
('Activo', TRUE), 
('Inactivo', FALSE),
('Suspendido', FALSE);

-- Insertar datos en la tabla tipos_textos
INSERT INTO tipos_textos (tipo_texto) VALUES 
('Libro'), 
('Revista'), 
('Tesis');

-- Insertar datos en la tabla autores
INSERT INTO autores (seudonimo, nombre, apellidos) VALUES 
('J.K. Rowling', 'Joanne', 'Rowling'),
('Gabo', 'Gabriel', 'García Márquez'),
('Stephen King', 'Stephen', 'King');

-- Insertar datos en la tabla editoriales
INSERT INTO editoriales (nombre) VALUES 
('Penguin Random House'),
('Editorial Planeta'),
('HarperCollins');

-- Insertar datos en la tabla paises
INSERT INTO paises (pais) VALUES 
('Perú'), 
('Colombia'),
('Estados Unidos');

-- Insertar datos en la tabla regiones
INSERT INTO regiones (pais_id, region) VALUES 
(1, 'Lima'), 
(2, 'Bogotá D.C.'),
(3, 'California');

-- Insertar datos en la tabla provincias
INSERT INTO provincias (region_id, provincia) VALUES 
(1, 'Lima Metropolitana'), 
(2, 'Bogotá'), 
(3, 'Los Ángeles');

-- Insertar datos en la tabla distritos
INSERT INTO distritos (provincia_id, distrito) VALUES 
(1, 'Miraflores'), 
(2, 'Chapinero'), 
(3, 'Downtown LA');

-- Insertar datos en la tabla direcciones_clientes
INSERT INTO direcciones_clientes (distrito_id, direccion) VALUES 
(1, 'Av. Pardo 123'), 
(2, 'Calle 85 45-67'), 
(3, 'Main St 456');

-- Insertar datos en la tabla tipos_prestamos
INSERT INTO tipos_prestamos (tipo_prestamo) VALUES 
('Sala'), 
('Domicilio');

-- Insertar datos en la tabla tipos_documentos
INSERT INTO tipos_documentos (tipo_documento) VALUES 
('DNI'), 
('Pasaporte');

-- Insertar datos en la tabla administradores
INSERT INTO administradores (usuario, correo, psk) VALUES 
('admin1', 'admin1@biblioteca.com', 'hashedpassword1'), 
('admin2', 'admin2@biblioteca.com', 'hashedpassword2');

-- Insertar datos en la tabla navegadores
INSERT INTO navegadores (navegador) VALUES 
('Google Chrome'), 
('Mozilla Firefox'), 
('Safari');

-- Insertar datos en la tabla carnets
INSERT INTO carnets (fecha_emision, fecha_vencimiento, tipo_estado_id) VALUES 
('2024-01-01', '2025-01-01', 1),
('2023-05-10', '2024-05-10', 1);

-- Insertar datos en la tabla recursos_textuales
INSERT INTO recursos_textuales (titulo, fecha_publicacion, stock, numero_paginas, edicion, volumen, editorial_id, tipo_texto_id) VALUES 
('Cien Años de Soledad', '1967-05-30', 5, 471, 1, 1, 2, 1),
('It', '1986-09-15', 3, 1138, 1, 1, 3, 1);

-- Insertar datos en la tabla registros_accesos_administradores
INSERT INTO registros_accesos_administradores (administrador_id, navegador_id, direccion_ip) VALUES 
(1, 1, '192.168.1.1'),
(2, 2, '172.16.254.1');

-- Insertar datos en la tabla clientes
INSERT INTO clientes (documento, tipo_documento_id, nombre, apellido_paterno, apellido_materno, direccion_cliente_id, telefono, correo, carnet_id) VALUES 
('12345678', 1, 'Juan', 'Pérez', 'Gómez', 1, '999999999', 'juan.perez@gmail.com', 1),
('98765432', 2, 'Ana', 'Martínez', 'Lopez', 2, '888888888', 'ana.martinez@gmail.com', 2);

-- Insertar datos en la tabla usuarios_clientes
INSERT INTO usuarios_clientes (usuario, psk, cliente_id) VALUES 
('juan123', 'hashedpassword123', 1), 
('ana456', 'hashedpassword456', 2);

-- Insertar datos en la tabla prestamos
INSERT INTO prestamos (usuario_cliente_id, recurso_textual_id, tipo_prestamo_id, recogido, devuelto, fecha_programada) VALUES 
(1, 1, 1, TRUE, FALSE, '2024-10-01'), 
(2, 2, 2, FALSE, FALSE, '2024-09-15');

-- Insertar datos en la tabla recursos_textuales_autores
INSERT INTO recursos_textuales_autores (recurso_textual_id, autor_id) VALUES 
(1, 2), 
(2, 3);

-- Insertar datos en la tabla registros_accesos_clientes
INSERT INTO registros_accesos_clientes (usuario_cliente_id, navegador_id, direccion_ip) VALUES 
(1, 1, '192.168.1.2'), 
(2, 2, '172.16.254.2');
