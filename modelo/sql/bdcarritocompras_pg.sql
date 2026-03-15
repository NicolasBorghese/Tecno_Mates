-- ============================================================
-- PostgreSQL schema para bdcarritocompras
-- ============================================================
-- Antes de ejecutar este archivo, crear la base de datos:
--   CREATE DATABASE bdcarritocompras;
-- Luego conectarse a ella:
--   \c bdcarritocompras
-- ============================================================

-- Eliminar tablas existentes en orden para respetar FK
DROP TABLE IF EXISTS usuariorol CASCADE;
DROP TABLE IF EXISTS menurol CASCADE;
DROP TABLE IF EXISTS compraitem CASCADE;
DROP TABLE IF EXISTS compraestado CASCADE;
DROP TABLE IF EXISTS compra CASCADE;
DROP TABLE IF EXISTS menu CASCADE;
DROP TABLE IF EXISTS compraestadotipo CASCADE;
DROP TABLE IF EXISTS producto CASCADE;
DROP TABLE IF EXISTS rol CASCADE;
DROP TABLE IF EXISTS usuario CASCADE;

-- ----------------------------------------------------------------------------------
-- Tabla: usuario
-- ----------------------------------------------------------------------------------
CREATE TABLE usuario (
    idusuario  bigserial    PRIMARY KEY,
    usnombre   varchar(50)  NOT NULL,
    uspass     varchar(50)  NOT NULL,
    usmail     varchar(50)  NOT NULL,
    usdeshabilitado timestamp NULL DEFAULT NULL
);

INSERT INTO usuario (idusuario, usnombre, uspass, usmail, usdeshabilitado) VALUES
(1, 'Moya',       '81dc9bdb52d04dc20036dbd8313ed055', 'moya@gmail.com',          '1900-01-01 00:00:00'), -- 1234
(2, 'Farias',     '81b073de9370ea873f548e31b8adc081', 'farias@gmail.com',         '1900-01-01 00:00:00'), -- 2345
(3, 'Lopez',      'def7924e3199be5e18060bb3e1d547a7', 'lopez@gmail.com',          '1900-01-01 00:00:00'), -- 3456
(4, 'Ramirez',    '6562c5c1f33db6e05a082a88cddab5ea', 'ramirez@gmail.com',        '1900-01-01 00:00:00'), -- 4567
(5, 'Admin',      '81dc9bdb52d04dc20036dbd8313ed055', 'admin@mail.com',           '1900-01-01 00:00:00'), -- 1234
(6, 'Deposito',   '81dc9bdb52d04dc20036dbd8313ed055', 'deposito@mail.com',        '1900-01-01 00:00:00'), -- 1234
(7, 'Cliente',    '81dc9bdb52d04dc20036dbd8313ed055', 'cliente@mail.com',         '1900-01-01 00:00:00'), -- 1234
(8, 'Nicolas',    '81dc9bdb52d04dc20036dbd8313ed055', 'nicolas@mail.com',         '1900-01-01 00:00:00'), -- 1234
(9, 'AdminTotal', '81dc9bdb52d04dc20036dbd8313ed055', 'adminTotal@mail.com',      '1900-01-01 00:00:00'); -- 1234

SELECT setval('usuario_idusuario_seq', (SELECT MAX(idusuario) FROM usuario));

-- ----------------------------------------------------------------------------------
-- Tabla: rol
-- ----------------------------------------------------------------------------------
CREATE TABLE rol (
    idrol          bigserial   PRIMARY KEY,
    rodescripcion  varchar(50) NOT NULL
);

INSERT INTO rol (idrol, rodescripcion) VALUES
(1, 'Admin'),
(2, 'Deposito'),
(3, 'Cliente');

SELECT setval('rol_idrol_seq', (SELECT MAX(idrol) FROM rol));

-- ----------------------------------------------------------------------------------
-- Tabla: producto
-- ----------------------------------------------------------------------------------
CREATE TABLE producto (
    idproducto     bigserial    PRIMARY KEY,
    pronombre      varchar(250) NOT NULL,
    prodetalle     varchar(512) NOT NULL,
    procantstock   integer      NOT NULL,
    tipo           varchar(20)  NOT NULL,
    imagenproducto varchar(512) NOT NULL
);

INSERT INTO producto (idproducto, pronombre, prodetalle, procantstock, tipo, imagenproducto) VALUES
(1,  'Mate Termico Argentina',                                  '4900',  10,  'Mates',     '../img/Productos/mates/mate1.png'),
(2,  'Mate Pampa Negro Afa',                                    '17999', 10,  'Mates',     '../img/Productos/mates/mate2.png'),
(3,  'Mate De Madera Imperial',                                 '19800', 10,  'Mates',     '../img/Productos/mates/mate3.png'),
(4,  'Yerba Mate De Campo La Merced',                           '1665',  100, 'Yerbas',    '../img/Productos/yerbas/yerba1.png'),
(5,  'Yerba mate Canarias sabor tradicional',                   '4222',  100, 'Yerbas',    '../img/Productos/yerbas/yerba2.png'),
(6,  'Yerba Mate Grapia Milenaria',                             '2700',  100, 'Yerbas',    '../img/Productos/yerbas/yerba3.png'),
(8,  'Bombilla Mate Pico De Loro Uruguaya Gruesa Original',     '3299',  110, 'Bombillas', '../img/Productos/bombillas/bombilla1.png'),
(9,  'Bombilla Acero Inoxidable - Un Mate No Se Tapa',          '3997',  110, 'Bombillas', '../img/Productos/bombillas/bombilla2.png'),
(10, 'Bombillon Torneado De Acero Inoxidable',                  '7600',  80,  'Bombillas', '../img/Productos/bombillas/bombilla3.png'),
(11, 'Termo Kushiro 1200ml Manija Y Pico Cebador 24hs Doble Capa Color Gris', '22499', 50, 'Termos', '../img/Productos/termos/Termo1.png'),
(12, 'Termo Stanley Original Mate System Classic 1.2 Litros',  '95863', 50,  'Termos',    '../img/Productos/termos/Termo2.png'),
(13, 'Termo Acero Inoxidable Discovery Antiderrame 500 Ml Color Azul', '12900', 60, 'Termos', '../img/Productos/termos/Termo3.png'),
(14, 'Set Matero Completo Termo Stanley Mate Calabaza Y Cuero', '180199', 100, 'SETS',     '../img/Productos/sets/set1.png'),
(15, 'Set Matero Canasta + Mate + Bombilla + Yerbero + Azucarero', '18242', 100, 'SETS',  '../img/Productos/sets/set2.png'),
(16, 'Set Matero Mate Térmico Acero Inox Sumate Latas Y Canasta', '12927', 100, 'SETS',   '../img/Productos/sets/set3.png'),
(17, 'Mate basico madera',                                      '5000',  5,   'Mates',     '../img/Productos/mates/mate4.png'),
(18, 'Mate de aluminio',                                        '4000',  8,   'Mates',     '../img/Productos/mates/mate5.png'),
(19, 'Mate de plastico terere',                                 '3500',  10,  'Mates',     '../img/Productos/mates/mate6.png'),
(20, 'Yerba Mate Playadito',                                    '2000',  10,  'Yerbas',    '../img/Productos/yerbas/yerba4.png'),
(21, 'Yerba mate Amanda',                                       '3000',  5,   'Yerbas',    '../img/Productos/yerbas/yerba5.png'),
(22, 'Yerba Mate VerdeFlor',                                    '4000',  20,  'Yerbas',    '../img/Productos/yerbas/yerba6.png'),
(23, 'Bombilla Mate Pico De Loro Sincelada',                    '3500',  100, 'Bombillas', '../img/Productos/bombillas/bombilla4.png'),
(24, 'Bombilla Stanley Acero Inoxidable',                       '3000',  50,  'Bombillas', '../img/Productos/bombillas/bombilla5.png'),
(25, 'Bombillon De Acero Inoxidable',                           '8000',  80,  'Bombillas', '../img/Productos/bombillas/bombilla6.png'),
(26, 'Termo Media Manija Y Pico Cebador 24hs Color Gris',       '20000', 50,  'Termos',    '../img/Productos/termos/Termo4.png'),
(27, 'Termo 1lt Termolar Color Rosa',                           '18000', 30,  'Termos',    '../img/Productos/termos/Termo5.png'),
(28, 'Termo Acero Inoxidable BOCA',                             '30000', 60,  'Termos',    '../img/Productos/termos/Termo6.png'),
(29, 'Set Matero Bostero 0 DESCENSOS',                          '26000', 11,  'SETS',      '../img/Productos/sets/set4.png'),
(30, 'Set Matero Campero Completo',                             '19600', 20,  'SETS',      '../img/Productos/sets/set5.png'),
(31, 'Set Matero Campeones Del Mundo',                          '18120', 50,  'SETS',      '../img/Productos/sets/set6.png');

SELECT setval('producto_idproducto_seq', (SELECT MAX(idproducto) FROM producto));

-- ----------------------------------------------------------------------------------
-- Tabla: compraestadotipo  (sin autoincrement, IDs explícitos)
-- ----------------------------------------------------------------------------------
CREATE TABLE compraestadotipo (
    idcompraestadotipo  integer      PRIMARY KEY,
    cetdescripcion      varchar(50)  NOT NULL,
    cetdetalle          varchar(256) NOT NULL
);

INSERT INTO compraestadotipo (idcompraestadotipo, cetdescripcion, cetdetalle) VALUES
(1, 'iniciada',  'cuando el usuario : cliente inicia la compra de uno o mas productos del carrito'),
(2, 'aceptada',  'cuando el usuario administrador da ingreso a uno de las compras en estado = 1'),
(3, 'enviada',   'cuando el usuario administrador envia a uno de las compras en estado = 2'),
(4, 'cancelada', 'un usuario administrador podra cancelar una compra en cualquier estado y un usuario cliente solo en estado = 1');

-- ----------------------------------------------------------------------------------
-- Tabla: menu  (sin autoincrement, IDs explícitos, FK self-referencial)
-- ----------------------------------------------------------------------------------
CREATE TABLE menu (
    idmenu          bigint       PRIMARY KEY,
    menombre        varchar(100) NOT NULL,
    medescripcion   varchar(124) NOT NULL,
    idpadre         bigint       NULL REFERENCES menu(idmenu) ON UPDATE CASCADE,
    medeshabilitado timestamp    NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX fkmenu_1 ON menu(idpadre);

INSERT INTO menu (idmenu, menombre, medescripcion, idpadre, medeshabilitado) VALUES
(0,  'Invisible',         '../Nada/',                      NULL, '1900-01-01 00:00:00'),
(1,  'Home',              '../Home/',                      NULL, '1900-01-01 00:00:00'),
(2,  'Administrador',     '../Administrador/',             NULL, '1900-01-01 00:00:00'),
(3,  'Deposito',          '../Deposito/',                  NULL, '1900-01-01 00:00:00'),
(4,  'Cliente',           '../Cliente/',                   NULL, '1900-01-01 00:00:00'),
(11, 'Inicio',            'home.php',                      1,    '1900-01-01 00:00:00'),
(12, 'Crear Cuenta',      'crearCuenta.php',               1,    '1900-01-01 00:00:00'),
(13, 'Login',             'login.php',                     1,    '1900-01-01 00:00:00'),
(21, 'Crear Usuarios',    'crearUsuarios.php',             2,    '1900-01-01 00:00:00'),
(22, 'Gestionar Usuarios','gestionarUsuarios.php',         2,    '1900-01-01 00:00:00'),
(23, 'Gestionar Roles',   'gestionarRoles.php',            2,    '1900-01-01 00:00:00'),
(24, 'Asignar Roles',     'asignarRoles.php',              0,    '1900-01-01 00:00:00'),
(25, 'Quitar Roles',      'quitarRol.php',                 0,    '1900-01-01 00:00:00'),
(26, 'Actualizar Usuario','formActualizarUsuario.php',     0,    '1900-01-01 00:00:00'),
(27, 'Crear Rol',         'crearRol.php',                  0,    '1900-01-01 00:00:00'),
(31, 'Crear Productos',   'crearProductos.php',            3,    '1900-01-01 00:00:00'),
(32, 'Gestionar Productos','gestionarProductos.php',       3,    '1900-01-01 00:00:00'),
(33, 'Gestionar Compras', 'gestionarCompras.php',          3,    '1900-01-01 00:00:00'),
(34, 'Modificar Productos','modificarProductos.php',       0,    '1900-01-01 00:00:00'),
(41, 'Productos',         'productos.php',                 4,    '1900-01-01 00:00:00'),
(42, 'Mis Compras',       'misCompras.php',                4,    '1900-01-01 00:00:00'),
(43, 'Carrito',           'carrito.php',                   4,    '1900-01-01 00:00:00'),
(44, 'Agregar Productos', 'agregarProductoAlCarrito.php',  0,    '1900-01-01 00:00:00');

-- ----------------------------------------------------------------------------------
-- Tabla: compra
-- ----------------------------------------------------------------------------------
CREATE TABLE compra (
    idcompra  bigserial  PRIMARY KEY,
    cofecha   timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    idusuario bigint     NOT NULL REFERENCES usuario(idusuario) ON UPDATE CASCADE
);

CREATE INDEX fkcompra_1 ON compra(idusuario);

INSERT INTO compra (idcompra, cofecha, idusuario) VALUES
(1, '2021-11-19 02:43:15', 1),
(2, '2021-11-19 02:45:20', 1),
(3, '2021-11-19 02:53:10', 1),
(4, '2021-11-19 02:54:14', 1),
(5, '1900-01-01 00:00:00', 7); -- Compra test (carrito pendiente)

SELECT setval('compra_idcompra_seq', (SELECT MAX(idcompra) FROM compra));

-- ----------------------------------------------------------------------------------
-- Tabla: compraestado
-- ----------------------------------------------------------------------------------
CREATE TABLE compraestado (
    idcompraestado      bigserial  PRIMARY KEY,
    idcompra            bigint     NOT NULL REFERENCES compra(idcompra) ON UPDATE CASCADE,
    idcompraestadotipo  integer    NOT NULL REFERENCES compraestadotipo(idcompraestadotipo) ON UPDATE CASCADE,
    cefechaini          timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    cefechafin          timestamp  NULL DEFAULT NULL
);

CREATE INDEX fkcompraestado_1 ON compraestado(idcompra);
CREATE INDEX fkcompraestado_2 ON compraestado(idcompraestadotipo);

INSERT INTO compraestado (idcompraestado, idcompra, idcompraestadotipo, cefechaini, cefechafin) VALUES
(1, 1, 1, '2021-11-19 02:43:16', '1900-01-01 00:00:00'),
(2, 2, 2, '2021-11-19 02:45:21', '1900-01-01 00:00:00'),
(3, 3, 3, '2021-11-19 02:53:12', '1900-01-01 00:00:00'),
(4, 4, 4, '2021-11-19 02:54:15', '1900-01-01 00:00:00');

SELECT setval('compraestado_idcompraestado_seq', (SELECT MAX(idcompraestado) FROM compraestado));

-- ----------------------------------------------------------------------------------
-- Tabla: compraitem
-- ----------------------------------------------------------------------------------
CREATE TABLE compraitem (
    idcompraitem bigserial  PRIMARY KEY,
    idproducto   bigint     NOT NULL REFERENCES producto(idproducto) ON UPDATE CASCADE,
    idcompra     bigint     NOT NULL REFERENCES compra(idcompra) ON UPDATE CASCADE,
    cicantidad   integer    NOT NULL
);

CREATE INDEX fkcompraitem_1 ON compraitem(idcompra);
CREATE INDEX fkcompraitem_2 ON compraitem(idproducto);

INSERT INTO compraitem (idcompraitem, idproducto, idcompra, cicantidad) VALUES
(1, 1, 1, 1),
(2, 2, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 1);

SELECT setval('compraitem_idcompraitem_seq', (SELECT MAX(idcompraitem) FROM compraitem));

-- ----------------------------------------------------------------------------------
-- Tabla: menurol
-- ----------------------------------------------------------------------------------
CREATE TABLE menurol (
    idmenu bigint NOT NULL REFERENCES menu(idmenu) ON UPDATE CASCADE,
    idrol  bigint NOT NULL REFERENCES rol(idrol)   ON UPDATE CASCADE,
    PRIMARY KEY (idmenu, idrol)
);

CREATE INDEX fkmenurol_2 ON menurol(idrol);

INSERT INTO menurol (idmenu, idrol) VALUES
(11, 1), -- Admin - Inicio
(21, 1), -- Admin - Crear Usuarios
(22, 1), -- Admin - Gestionar Usuarios
(23, 1), -- Admin - Gestionar Roles
(24, 1), -- Admin - Asignar Roles
(25, 1), -- Admin - Quitar Roles
(26, 1), -- Admin - Actualizar Usuario
(27, 1), -- Admin - Crear Rol
(11, 2), -- Deposito - Inicio
(31, 2), -- Deposito - Crear Productos
(32, 2), -- Deposito - Gestionar Productos
(33, 2), -- Deposito - Gestionar Compras
(34, 2), -- Deposito - Modificar Productos
(11, 3), -- Cliente - Inicio
(41, 3), -- Cliente - Productos
(42, 3), -- Cliente - Mis Compras
(43, 3), -- Cliente - Carrito
(44, 3); -- Cliente - Agregar Producto

-- ----------------------------------------------------------------------------------
-- Tabla: usuariorol
-- ----------------------------------------------------------------------------------
CREATE TABLE usuariorol (
    idusuario bigint NOT NULL REFERENCES usuario(idusuario) ON UPDATE CASCADE,
    idrol     bigint NOT NULL REFERENCES rol(idrol)         ON UPDATE CASCADE,
    PRIMARY KEY (idusuario, idrol)
);

CREATE INDEX usuariorol_idrol ON usuariorol(idrol);

INSERT INTO usuariorol (idusuario, idrol) VALUES
(1, 1), -- Moya - Admin
(2, 2), -- Farias - Deposito
(3, 3), -- Lopez - Cliente
(4, 3), -- Ramirez - Cliente
(5, 1), -- Admin/1234
(6, 2), -- Deposito/1234
(7, 3), -- Cliente/1234
(8, 3), -- Nicolas/1234
(9, 1), -- AdminTotal - Admin
(9, 2), -- AdminTotal - Deposito
(9, 3); -- AdminTotal - Cliente
