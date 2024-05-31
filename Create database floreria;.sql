Create database floreria;

-- Tabla de Clientes
CREATE TABLE floreria.clientes (
    cliente_id INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    email VARCHAR(100),
    PRIMARY KEY(cliente_id)
);

-- Tabla de Productos
CREATE TABLE floreria.productos (
    producto_id INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY(producto_id)
);

-- Tabla de Proveedores
CREATE TABLE floreria.proveedores (
    proveedor_id INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100),
    PRIMARY KEY(proveedor_id)
);

-- Tabla Intermedia Productos-Proveedores (Relación Muchos a Muchos)
CREATE TABLE floreria.productos_proveedores (
    producto_id INT NOT NULL,
    proveedor_id INT NOT NULL,
    PRIMARY KEY (producto_id, proveedor_id),
    FOREIGN KEY (producto_id) REFERENCES floreria.productos(producto_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (proveedor_id) REFERENCES floreria.proveedores(proveedor_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla de Pedidos
CREATE TABLE floreria.pedidos (
    pedido_id INT AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    fecha_pedido DATETIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(pedido_id),
    FOREIGN KEY (cliente_id) REFERENCES floreria.clientes(cliente_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla de Detalles de Pedido
CREATE TABLE floreria.detalles_pedido (
    detalle_id INT AUTO_INCREMENT,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(detalle_id),
    FOREIGN KEY (pedido_id) REFERENCES floreria.pedidos(pedido_id) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (producto_id) REFERENCES floreria.productos(producto_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Insertar Clientes
INSERT INTO floreria.clientes (nombre, direccion, telefono, email) VALUES
('María García', 'Calle Falsa 123, Ciudad X', '555-1234', 'maria.garcia@example.com'),
('Juan Pérez', 'Avenida Siempre Viva 456, Ciudad Y', '555-5678', 'juan.perez@example.com'),
('Ana Torres', 'Boulevard de los Sueños 789, Ciudad Z', '555-8765', 'ana.torres@example.com'),
('Luis Ramírez', 'Camino Real 101, Ciudad W', '555-2345', 'luis.ramirez@example.com'),
('Sofía Martínez', 'Plaza Mayor 202, Ciudad V', '555-3456', 'sofia.martinez@example.com'),
('Pedro Gómez', 'Carretera Central 303, Ciudad U', '555-4567', 'pedro.gomez@example.com'),
('Laura Fernández', 'Calle Luna 404, Ciudad T', '555-5678', 'laura.fernandez@example.com'),
('Daniela Sánchez', 'Avenida Sol 505, Ciudad S', '555-6789', 'daniela.sanchez@example.com'),
('Carlos López', 'Boulevard Estrellas 606, Ciudad R', '555-7890', 'carlos.lopez@example.com'),
('Marta Morales', 'Calle del Cielo 707, Ciudad Q', '555-8901', 'marta.morales@example.com');

-- Insertar Productos
INSERT INTO floreria.productos (nombre, descripcion, precio, stock) VALUES
('Rosas Rojas', 'Un hermoso ramo de 12 rosas rojas', 25.50, 50),
('Tulipanes', 'Ramo de 10 tulipanes de diversos colores', 20.00, 30),
('Orquídeas', 'Elegante planta de orquídea en maceta', 35.75, 20),
('Lirios', 'Ramo de 15 lirios blancos', 22.50, 25),
('Girasoles', 'Ramo de 5 girasoles brillantes', 15.00, 40),
('Claveles', 'Ramo de 20 claveles rojos y blancos', 18.00, 35),
('Margaritas', 'Ramo de 25 margaritas frescas', 12.00, 50),
('Jazmines', 'Ramo de jazmines perfumados', 19.00, 30),
('Gardenias', 'Planta de gardenia en maceta', 28.00, 20),
('Hortensias', 'Ramo de hortensias azules', 24.50, 25);

-- Insertar Proveedores
INSERT INTO floreria.proveedores (nombre, contacto, telefono, email) VALUES
('Flores del Campo', 'Luis Fernández', '555-2345', 'contacto@floresdelcampo.com'),
('Plantitas Verdes', 'Carmen López', '555-3456', 'ventas@plantitasverdes.com'),
('Decoraciones Naturales', 'Miguel Ruiz', '555-4567', 'info@decoracionesnaturales.com'),
('Flores y Más', 'Ana Castillo', '555-5678', 'contacto@floresymas.com'),
('Verde Hogar', 'Jorge Ramírez', '555-6789', 'ventas@verdehogar.com'),
('Jardines Felices', 'Clara Gómez', '555-7890', 'info@jardinesfelices.com'),
('Floristería del Sol', 'Patricia Morales', '555-8901', 'contacto@floristeriadelsol.com'),
('Naturaleza Viva', 'Roberto Pérez', '555-9012', 'ventas@naturalezaviva.com'),
('Plantas y Flores', 'Marta Sánchez', '555-0123', 'info@plantasyflores.com'),
('El Jardín de María', 'María Hernández', '555-1234', 'contacto@eljardindemaria.com');

-- Insertar Productos-Proveedores
INSERT INTO floreria.productos_proveedores (producto_id, proveedor_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- Insertar Pedidos
INSERT INTO floreria.pedidos (cliente_id, fecha_pedido, total) VALUES
(1, '2023-05-15 10:30:00', 51.00),
(2, '2023-05-16 14:45:00', 20.00),
(3, '2023-05-17 09:15:00', 35.75),
(4, '2023-05-18 11:00:00', 22.50),
(5, '2023-05-19 16:20:00', 15.00),
(6, '2023-05-20 12:30:00', 36.00),
(7, '2023-05-21 08:45:00', 12.00),
(8, '2023-05-22 14:10:00', 38.00),
(9, '2023-05-23 10:05:00', 28.00),
(10, '2023-05-24 15:50:00', 49.00);

-- Insertar Detalles de Pedido
INSERT INTO floreria.detalles_pedido (pedido_id, producto_id, cantidad, precio) VALUES
(1, 1, 2, 25.50),
(2, 2, 1, 20.00),
(3, 3, 1, 35.75),
(4, 4, 1, 22.50),
(5, 5, 1, 15.00),
(6, 6, 2, 18.00),
(7, 7, 1, 12.00),
(8, 8, 2, 19.00),
(9, 9, 1, 28.00),
(10, 10, 2, 24.50);

-- Obtener todos los clientes
SELECT * FROM floreria.clientes;

-- Obtener todos los productos
SELECT * FROM floreria.productos;

-- Obtener todos los proveedores
SELECT * FROM floreria.proveedores;

-- Obtener todos los pedidos
SELECT * FROM floreria.pedidos;

-- Obtener todos los detalles de pedidos
SELECT * FROM floreria.detalles_pedido;

-- Obtener el total de ventas (suma del total de todos los pedidos)
SELECT SUM(total) AS total_ventas FROM floreria.pedidos;

-- Obtener los productos que tienen un stock por debajo de un umbral especificado (por ejemplo, 20)
SELECT * FROM floreria.productos WHERE stock < 20;

-- Obtener los clientes que no han realizado ningún pedido
SELECT c.* FROM floreria.clientes c LEFT JOIN floreria.pedidos p ON c.cliente_id = p.cliente_id WHERE p.pedido_id IS NULL;

-- Obtener la cantidad total de productos vendidos agrupados por producto
SELECT p.nombre AS producto_nombre, SUM(dp.cantidad) AS cantidad_total_vendida FROM floreria.detalles_pedido dp JOIN floreria.productos p ON dp.producto_id = p.producto_id GROUP BY p.nombre;

-- Obtener los detalles de un pedido específico por su pedido_id
SELECT dp.*, p.nombre AS producto_nombre FROM floreria.detalles_pedido dp JOIN floreria.productos p ON dp.producto_id = p.producto_id WHERE dp.pedido_id = 1;

-- Obtener todos los pedidos realizados por un cliente específico por su cliente_id
SELECT pe.*, cl.nombre AS cliente_nombre FROM floreria.pedidos pe JOIN floreria.clientes cl ON pe.cliente_id = cl.cliente_id WHERE cl.cliente_id = 1;

-- Obtener el nombre del cliente y los productos que ha comprado en un pedido específico
SELECT cl.nombre AS cliente_nombre, p.nombre AS producto_nombre, dp.cantidad, dp.precio FROM floreria.detalles_pedido dp JOIN floreria.pedidos pe ON dp.pedido_id = pe.pedido_id JOIN floreria.clientes cl ON pe.cliente_id = cl.cliente_id JOIN floreria.productos p ON dp.producto_id = p.producto_id WHERE pe.pedido_id = 1;

-- Obtener la lista de clientes y la cantidad total que han gastado en pedidos
SELECT cl.nombre AS cliente_nombre, SUM(pe.total) AS total_gastado FROM floreria.pedidos pe JOIN floreria.clientes cl ON pe.cliente_id = cl.cliente_id GROUP BY cl.nombre;

-- Obtener los proveedores que suministran un producto específico por su producto_id
SELECT pr.* FROM floreria.proveedores pr JOIN floreria.productos_proveedores pp ON pr.proveedor_id = pp.proveedor_id WHERE pp.producto_id = 1;

-- Obtener la lista de productos junto con los proveedores que los suministran
SELECT p.nombre AS producto_nombre, pr.nombre AS proveedor_nombre FROM floreria.productos p JOIN floreria.productos_proveedores pp ON p.producto_id = pp.producto_id JOIN floreria.proveedores pr ON pp.proveedor_id = pr.proveedor_id;
