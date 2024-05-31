Create database floreria;
CREATE TABLE floreria.clientes (
    cliente_id INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(15),
    email VARCHAR(100),
    PRIMARY KEY(cliente_id)
);

CREATE TABLE floreria.productos (
    producto_id INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    primary key(producto_id)
);

CREATE TABLE floreria.pedidos (
    pedido_id INT AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    fecha_pedido DATETIME NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(pedido_id)
);

CREATE TABLE floreria.detalles_pedido (
    detalle_id INT AUTO_INCREMENT,
    pedido_id INT NOT NULL,
    producto_id INT NOT NULL,
    cantidad INT NOT NULL,
    precio DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(detalle_id)
);

CREATE TABLE floreria.proveedores (
    proveedor_id INT AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    contacto VARCHAR(100),
    telefono VARCHAR(15),
    email VARCHAR(100),
    PRIMARY KEY(proveedor_id)
);

CREATE TABLE floreria.productos_proveedores (
    producto_id INT NOT NULL,
    proveedor_id INT NOT NULL,
    PRIMARY KEY (producto_id, proveedor_id)
);


ALTER TABLE floreria.pedidos ADD FOREIGN KEY (cliente_id)  REFERENCES floreria.clientes(cliente_id)  ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE floreria.detalles_pedido ADD FOREIGN KEY (pedido_id)  REFERENCES floreria.pedidos(pedido_id)  ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE floreria.detalles_pedido ADD FOREIGN KEY (producto_id)  REFERENCES floreria.productos(producto_id)  ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE floreria.productos_proveedores ADD FOREIGN KEY (producto_id) REFERENCES floreria.productos(producto_id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE floreria.productos_proveedores ADD FOREIGN KEY (proveedor_id) REFERENCES floreria.proveedores(proveedor_id)  ON UPDATE CASCADE ON DELETE CASCADE;