USE bmpch;

-- Insertar datos en la tabla `tipos_estados`
INSERT INTO tipos_estados (tipo_estado, activo)
VALUES
    ('Activo', TRUE),
    ('Suspendido', FALSE),
    ('Vencido', FALSE);

-- Insertar datos en la tabla `tipos_textos`
INSERT INTO tipos_textos (tipo_texto)
VALUES
    ('Libro'),
    ('Revista'),
    ('Ensayo');

-- Insertar datos en la tabla `autores`
INSERT INTO autores (seudonimo, nombre, apellido_paterno, apellido_materno)
VALUES
    ('J.Doe', 'John', 'Doe', 'Smith'),
    ('M.Sky', 'Mary', 'Sky', 'Johnson');

-- Insertar datos en la tabla `editoriales`
INSERT INTO editoriales (nombre)
VALUES
    ('Editorial ABC'),
    ('Editorial XYZ');

-- Insertar datos en la tabla `paises`
INSERT INTO paises (pais)
VALUES
    ('Perú'),
    ('Chile');

-- Insertar datos en la tabla `regiones`
INSERT INTO regiones (pais_id, region)
VALUES
    (1, 'Lima'),
    (2, 'Santiago');

-- Insertar datos en la tabla `provincias`
INSERT INTO provincias (region_id, provincia)
VALUES
    (1, 'Lima Metropolitana'),
    (2, 'Santiago Centro');

-- Insertar datos en la tabla `distritos`
INSERT INTO distritos (provincia_id, distrito)
VALUES
    (1, 'Miraflores'),
    (2, 'Las Condes');

-- Insertar datos en la tabla `direcciones_clientes`
INSERT INTO direcciones_clientes (distrito_id, direccion)
VALUES
    (1, 'Av. Pardo 123'),
    (2, 'Av. Apoquindo 456');

-- Insertar datos en la tabla `tipos_prestamos`
INSERT INTO tipos_prestamos (tipo_prestamo)
VALUES
    ('En sala'),
    ('Domicilio');

-- Insertar datos en la tabla `tipos_documentos`
INSERT INTO tipos_documentos (tipo_documento)
VALUES
    ('DNI'),
    ('Pasaporte');

-- Insertar datos en la tabla `roles_usuarios`
INSERT INTO roles_usuarios (rol_usuario)
VALUES
    ('Cliente'),
    ('Administrador');

-- Insertar datos en la tabla `categorias`
INSERT INTO categorias (categoria)
VALUES
    ('Ciencia ficción'),
    ('Drama');

-- Insertar datos en la tabla `niveles_educativos`
INSERT INTO niveles_educativos (nivel_educativo)
VALUES
    ('Escolares'),
    ('Pre. Universitario'),
    ('Institutos'),
    ('Universitario'),
    ('Otros');

-- Insertar datos en la tabla `generos`
INSERT INTO generos (genero)
VALUES
    ('Masculino'),
    ('Femenino');

-- Insertar datos en la tabla `estados_prestamos`
INSERT INTO estados_prestamos (estado_prestamo)
VALUES
    ('Pendiente'),
    ('Completado');

-- Insertar datos en la tabla `carnets`
INSERT INTO carnets (tipo_estado_id, codigo, fecha_emision)
VALUES
    (1, 'CAR-001', '2024-01-01'),
    (2, 'CAR-002', '2024-01-01');

-- Insertar datos en la tabla `recursos_textuales`
INSERT INTO recursos_textuales (titulo, fecha_publicacion, numero_paginas, codigo, tipo_texto_id, editorial_id)
VALUES
    ('El Quijote', '1605-01-16', 850, 'LIB001', 1, 1),
    ('La Odisea', '800-01-01', 300, 'LIB002', 1, 2);

-- Insertar datos en la tabla `clientes`
INSERT INTO clientes (nombre, apellido_paterno, apellido_materno, genero_id, direccion_cliente_id, telefono, correo, documento, tipo_documento_id, carnet_id, nivel_educativo_id)
VALUES
    ('Juan', 'Perez', 'Lopez', 1, 1, '999888777', 'juan.perez@example.com', '12345678', 1, 1, 2),
    ('Maria', 'Gonzalez', 'Torres', 2, 2, '998877665', 'maria.gonzalez@example.com', '87654321', 2, 2, 1);

-- Insertar datos en la tabla `usuarios`
INSERT INTO usuarios (cliente_id, rol_usuario_id, psk)
VALUES
    (1, 1, 'hashed_password_juan'),
    (2, 2, 'hashed_password_maria');

-- Insertar datos en la tabla `prestamos`
INSERT INTO prestamos (usuario_id, recurso_textual_id, tipo_prestamo_id, estado_prestamo_id, fecha_programada)
VALUES
    (1, 1, 1, 1, '2024-09-25'),
    (2, 2, 2, 2, '2024-09-26');

-- Insertar datos en la tabla `recursos_textuales_autores`
INSERT INTO recursos_textuales_autores (recurso_textual_id, autor_id)
VALUES
    (1, 1),
    (2, 2);

-- Insertar datos en la tabla `registros_accesos_usuarios`
INSERT INTO registros_accesos_usuarios (usuario_id, direccion_ip)
VALUES
    (1, '192.168.1.100'),
    (2, '192.168.1.101');

-- Insertar datos en la tabla `categorias_recursos_textuales`
INSERT INTO categorias_recursos_textuales (recurso_textual_id, categoria_id)
VALUES
    (1, 1),
    (2, 2);

