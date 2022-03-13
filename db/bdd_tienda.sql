CREATE TABLE `cliente` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `perfil_tipo` varchar(20) DEFAULT NULL
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
  `descripcion` varchar(16) DEFAULT NULL
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

ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`perfil_tipo`) REFERENCES `perfil` (`idperfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;
