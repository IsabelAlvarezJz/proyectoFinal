CREATE TABLE `cliente` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `perfil_tipo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `compras` (
  `idCompras` int(10) UNSIGNED NOT NULL,
  `idPago` int(10) UNSIGNED NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `fechaCompra` Date NULL,
  `monto` double (18,2) DEFAULT NULL,
  `estado` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `detalle_compras` (
  `idDetalle` int(10) UNSIGNED NOT NULL,
  `idCompras` int(10) UNSIGNED NOT NULL,
  `codProducto` varchar(10) NOT NULL,
  `cantidad` int(10) UNSIGNED DEFAULT NULL,
  `precioCompra` double (18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pago` (
  `idPago` int(10) UNSIGNED NOT NULL,
  `monto` double (18,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `producto` (
  `codProducto` varchar(10) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `foto` longblob,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` double (18,2) DEFAULT NULL,
  `stock` int(10) UNSIGNED DEFAULT NULL,
  `ruta` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tarjeta` (
  `idTarjeta` int(10) UNSIGNED NOT NULL,
  `cardName` varchar(255) DEFAULT NULL,
  `cardNumber` varchar(16) DEFAULT NULL,
  `cardDate` varchar(10) DEFAULT NULL,
  `cardCode` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `perfil` (
  `idperfil` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cedula`),
  ADD KEY `Cliente_FKIndex1` (`perfil_tipo`);

ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompras`),
  ADD KEY `Compras_FKIndex1` (`idPago`),
  ADD KEY `Compras_FKIndex2` (`cedula`);

ALTER TABLE `detalle_compras`
  ADD PRIMARY KEY (`idDetalle`,`codProducto`,`idCompras`),
  ADD KEY `Producto_has_Compras_FKIndex1` (`codProducto`),
  ADD KEY `Producto_has_Compras_FKIndex2` (`idCompras`);

ALTER TABLE `pago`
  ADD PRIMARY KEY (`idPago`);

ALTER TABLE `producto`
  ADD PRIMARY KEY (`codProducto`);
  
ALTER TABLE `tarjeta`
  ADD PRIMARY KEY (`idTarjeta`);

ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idperfil`);


ALTER TABLE `compras`
  MODIFY `idCompras` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `detalle_compras`
  MODIFY `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `pago`
  MODIFY `idPago` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
ALTER TABLE `tarjeta`
  MODIFY `idTarjeta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `perfil`
  MODIFY `idperfil` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`cedula`) REFERENCES `cliente` (`cedula`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`codProducto`) REFERENCES `producto` (`codProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ALTER TABLE `cliente`
--  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`perfil_tipo`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- PERFILES
INSERT INTO `bdd_tienda`.`perfil` (`idperfil`, `tipo`, `descripcion`) VALUES ('1', 'Administrador', 'Perfil para Administrador');
INSERT INTO `bdd_tienda`.`perfil` (`idperfil`, `tipo`, `descripcion`) VALUES ('2', 'Cliente', 'Perfil para Cliente');
INSERT INTO `bdd_tienda`.`perfil` (`idperfil`, `tipo`, `descripcion`) VALUES ('3', 'Proveedor', 'Perfil para Proveedores');

-- USUARIOS
INSERT INTO `bdd_tienda`.`cliente` (`cedula`, `nombres`, `direccion`, `email`, `password`, `perfil_tipo`) 
VALUES ('1231231230', 'Usuario Administrador', 'Quito', 'admin@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `bdd_tienda`.`cliente` (`cedula`, `nombres`, `direccion`, `email`, `password`, `perfil_tipo`) 
VALUES ('1234123400', 'Usuario Cliente', 'Quito', 'cliente@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '2');

#Clave Admin:      123456
#Clave Cliente:    123456

-- COMPRAS
INSERT INTO `bdd_tienda`.`compras` (`idCompras`, `idPago`, `cedula`, `fechaCompra`, `monto`, `estado`) 
VALUES (1, '1', '1234123400', '2022-03-18', '2200', 'PROCESADO');
INSERT INTO `bdd_tienda`.`compras` (`idCompras`, `idPago`, `cedula`, `fechaCompra`, `monto`, `estado`) 
VALUES (2, '1', '1234123400', '2022-03-18', '2200', 'PROCESADO');
INSERT INTO `bdd_tienda`.`compras` (`idCompras`, `idPago`, `cedula`, `fechaCompra`, `monto`, `estado`) 
VALUES (3, '1', '1234123400', '2022-03-18', '2200', 'PROCESADO');
INSERT INTO `bdd_tienda`.`compras` (`idCompras`, `idPago`, `cedula`, `fechaCompra`, `monto`, `estado`) 
VALUES (4, '1', '1234123400', '2022-03-18', '2200', 'PROCESADO');
INSERT INTO `bdd_tienda`.`compras` (`idCompras`, `idPago`, `cedula`, `fechaCompra`, `monto`, `estado`) 
VALUES (5, '1', '1234123400', '2022-03-18', '2200', 'PROCESADO');


-- PRODUCTOS
INSERT INTO `bdd_tienda`.`producto` (`codProducto`, `nombres`, `descripcion`, `precio`, `stock`, `ruta`) 
VALUES ('001', 'Producto 1', 'Descripción producto 1', '35', '100', 'http://localhost/img/producto1.jpg');
INSERT INTO `bdd_tienda`.`producto` (`codProducto`, `nombres`, `descripcion`, `precio`, `stock`, `ruta`) 
VALUES ('002', 'Producto 2', 'Descripción producto 2', '45', '60', 'http://localhost/img/producto2.jpg');
INSERT INTO `bdd_tienda`.`producto` (`codProducto`, `nombres`, `descripcion`, `precio`, `stock`, `ruta`) 
VALUES ('003', 'Producto 3', 'Descripción producto 3', '10', '200', 'http://localhost/img/producto3.jpg');
INSERT INTO `bdd_tienda`.`producto` (`codProducto`, `nombres`, `descripcion`, `precio`, `stock`, `ruta`) 
VALUES ('004', 'Producto 4', 'Descripción producto 4', '80', '50', 'http://localhost/img/producto4.jpg');
INSERT INTO `bdd_tienda`.`producto` (`codProducto`, `nombres`, `descripcion`, `precio`, `stock`, `ruta`) 
VALUES ('005', 'Producto 5', 'Descripción producto 5', '14', '30', 'http://localhost/img/producto5.jpg');


-- DETALLE COMPRA
INSERT INTO `bdd_tienda`.`detalle_compras` (`idDetalle`, `idCompras`, `codProducto`, `cantidad`, `precioCompra`) 
VALUES (1, 1, '001', '2', '35');
INSERT INTO `bdd_tienda`.`detalle_compras` (`idDetalle`, `idCompras`, `codProducto`, `cantidad`, `precioCompra`) 
VALUES (2, 1, '002', '1', '45');
INSERT INTO `bdd_tienda`.`detalle_compras` (`idDetalle`, `idCompras`, `codProducto`, `cantidad`, `precioCompra`) 
VALUES (3, 2, '001', '1', '45');
INSERT INTO `bdd_tienda`.`detalle_compras` (`idDetalle`, `idCompras`, `codProducto`, `cantidad`, `precioCompra`) 
VALUES (4, 2, '004', '1', '80');
INSERT INTO `bdd_tienda`.`detalle_compras` (`idDetalle`, `idCompras`, `codProducto`, `cantidad`, `precioCompra`) 
VALUES (5, 3, '005', '10', '14');
INSERT INTO `bdd_tienda`.`detalle_compras` (`idDetalle`, `idCompras`, `codProducto`, `cantidad`, `precioCompra`) 
VALUES (6, 4, '002', '10', '45');
INSERT INTO `bdd_tienda`.`detalle_compras` (`idDetalle`, `idCompras`, `codProducto`, `cantidad`, `precioCompra`) 
VALUES (7, 5, '001', '10', '35');


-- PAGO
INSERT INTO `bdd_tienda`.`pago` (`idPago`, `monto`) VALUES (1, '80');
INSERT INTO `bdd_tienda`.`pago` (`idPago`, `monto`) VALUES (2, '125');
INSERT INTO `bdd_tienda`.`pago` (`idPago`, `monto`) VALUES (3, '14');
INSERT INTO `bdd_tienda`.`pago` (`idPago`, `monto`) VALUES (4, '45');
INSERT INTO `bdd_tienda`.`pago` (`idPago`, `monto`) VALUES (5, '35');


























