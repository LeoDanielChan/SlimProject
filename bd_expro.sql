-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3307
-- Tiempo de generación: 02-02-2024 a las 04:17:00
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_expro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `areas`
--

CREATE TABLE `areas` (
  `id_area` int(11) NOT NULL,
  `area_de_trabajo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `areas`
--

INSERT INTO `areas` (`id_area`, `area_de_trabajo`) VALUES
(1, 'Administración'),
(2, 'Contabilidad'),
(3, 'Dirección'),
(4, 'Finanzas'),
(5, 'Gestión'),
(6, 'Producción y operaciones'),
(7, 'Recursos humanos'),
(8, 'Ventas y mercadeo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buzon`
--

CREATE TABLE `buzon` (
  `id_buzon` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `motivo` int(11) NOT NULL,
  `comentarios` text NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `id_forma_de_pago` int(11) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `servicio` varchar(255) NOT NULL,
  `contacto` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `id_forma_de_pago`, `nombre`, `servicio`, `contacto`, `logo`) VALUES
(9, 1, 'Fugro', 'Geotécnicos', 'Fugro@gmail.com', 'fugro.png'),
(10, 1, 'WorleyParsons', 'Gestión de la cadena de suministro', 'WorleyParsons@correo.com', 'worley.png'),
(11, 1, 'Schlumberger', 'Yacimientos petrolíferos', 'Schlumberger@correo.com', 'slb.png'),
(12, NULL, 'Noble Corporation', 'Perforación', 'NobleCorporation@correo.com', 'noble.png'),
(18, 1, '213', '123412', '123213', 'noble.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id_estado` int(11) NOT NULL,
  `estado` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formas_de_pago`
--

CREATE TABLE `formas_de_pago` (
  `id_forma_de_pago` int(11) NOT NULL,
  `metodo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formas_de_pago`
--

INSERT INTO `formas_de_pago` (`id_forma_de_pago`, `metodo`) VALUES
(1, 'electrónico'),
(2, 'físico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formularios`
--

CREATE TABLE `formularios` (
  `id_formulario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `involucrados` varchar(255) NOT NULL,
  `motivo` text NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formularios`
--

INSERT INTO `formularios` (`id_formulario`, `fecha`, `involucrados`, `motivo`, `descripcion`) VALUES
(51, '2023-11-30', 'Ingeniero Salomon', 'Falta de capacitación', 'Desconocida'),
(53, '2023-11-29', 'a', 'La neta no se', 'a'),
(56, '2023-12-04', 'asdfasdf', 'svdf', 'asdfdsafsd'),
(57, '2023-12-05', 'sdfgsdfg', 'dsfg', 'sdfgfsdg'),
(58, '2023-11-29', 'sdfgsdfg', 'sdfgfsdgdsf', 'sdfgsdfgfsdg'),
(59, '2023-11-09', 'Ingeniero Solis', 'La neta no se', 'La verdad se desconoce'),
(60, '2023-11-29', '432', '234', '2345432');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id_proveedor` int(11) NOT NULL,
  `id_forma_de_pago` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `servicio` varchar(255) DEFAULT NULL,
  `contacto` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `id_forma_de_pago`, `nombre`, `servicio`, `contacto`, `logo`) VALUES
(16, NULL, 'Halliburton', 'Renta de tubos de perforación', 'halliburton@correo.com', 'halliburton.png'),
(17, NULL, 'Core Laboratories', 'Análisis de núcleos y fluidos', 'CoreLaboratories@correo.com', 'coreLab.jpg'),
(18, NULL, 'KLX Energy Services Hldgs', 'Tecnologías y herramientas de desarrollo', 'KLXEnergyServicesHldgs@correo.com', 'klx.png'),
(20, NULL, 'Weatherford', 'Análisis de fluidos', 'Weatherford', 'weatherford.png'),
(26, NULL, 'Solo', 'ewqrqwe', 'qwerqwer', 'coreLab.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_de_usuarios`
--

CREATE TABLE `tipos_de_usuarios` (
  `id_tipo_de_usuario` int(10) NOT NULL,
  `tipo_de_usuario` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_de_usuarios`
--

INSERT INTO `tipos_de_usuarios` (`id_tipo_de_usuario`, `tipo_de_usuario`) VALUES
(1, 'Administrativo'),
(2, 'Empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_tipo_de_usuario` int(11) DEFAULT NULL,
  `id_area` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido_paterno` varchar(255) DEFAULT NULL,
  `apellido_materno` varchar(255) DEFAULT NULL,
  `name_user` varchar(255) DEFAULT NULL,
  `correo` varchar(255) DEFAULT NULL,
  `contraseña` varchar(40) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `puesto_de_trabajo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_tipo_de_usuario`, `id_area`, `nombre`, `apellido_paterno`, `apellido_materno`, `name_user`, `correo`, `contraseña`, `telefono`, `puesto_de_trabajo`) VALUES
(4, 2, 1, 'Juan', 'Perez', 'Lopez', NULL, 'xxxx@gmail.com', '123455678', '12345697764', 'Ayudante administrativo'),
(5, 2, 1, 'Juan', 'Perez', 'Lopez', NULL, 'xxxx@gmail.com', '123455678', '12345697764', 'Ayudante administrativo'),
(6, 2, 1, 'Juan', 'Perez', 'Lopez', NULL, 'xxxx@gmail.com', '123455678', '12345697764', 'Ayudante administrativo'),
(7, 1, 5, 'Leo', 'Dan', 'Des', NULL, 'aaaaaa@gmail.com', '12345678', '65368423', 'Desarrollador'),
(8, 2, 6, 'sadfdf', 'asdfsa', 'dsaf', NULL, 'afsea@hhsf.com', '12345', '3435464', 'asgfgersg'),
(11, 1, 5, 'Leo', 'Daniel', 'Des', 'Blackwhite1', 'xxxx@gmail.com', '12345678', '9977885532', 'Desarrollador'),
(12, 2, 1, 'sdg', 'sdfg', 'ssdfg', 'lel', 'xxx@gmail.com', '1234', 'dfghdgh', 'dfgh'),
(13, 1, 2, 'dyh', 'dfh', 'dfgh', 'dfgh', 'sdfgsdf@hjsdfg.com', '1234', 'sadf', 'sadfg'),
(16, 1, 1, 'reg', 'sdfg', 'sdafg', 'fdsg', 'Blackwhite1asfdg@sdf', '123', 'asdf', 'adsf'),
(18, 1, 1, 'ssgd', 'sdfg', 'sadgf', 'hola', 'Blackwhite1@jasfdhg', '123', 'asfdraweg', 'adsff'),
(19, 1, 1, 'Edgar', 'López', 'Izquierdo', 'EdgarLopez', 'lopaz@gmail.com', '12345678', '9931997759', 'Auxiliar administrativo'),
(20, 1, 1, 'Leo', 'sol', 'sal', 'lara', 'Blackwhite1@goma.com', '', '458249854656', 'Ayudante administrativo'),
(21, 1, 1, 'sfdg', 'fdsg', 'sdfg', 'fdsg', 'Blackwhite1@dshnfg', '', 'sfdgsdfgsdggsf', 'sdaf'),
(22, 2, 1, 'fgb', 'sdfg', 'sdfg', 'fgsddg', 'Blackwhite1@hdgasfl', '', '6548684984', 'Auxiliar administrativo'),
(23, 1, 1, 'gfsd', 'dsfg', 'sdfg', 'a', 'Blackwhite1@dfsgh', '', '46513', 'Ayudante administrativo'),
(24, 1, 1, 'hgh', 'dgh', 'dfh', 'dfgh', 'Blackwhite1@sadfg', '', 'dsfafsd', 'sadfasd'),
(25, 1, 1, 'ghgdh', 'dfghg', 'dfghfdgh', 'dfgh', 'Blackwhite1@slahdf', '', 'fdsgfdg', 'sdfgsdfg'),
(26, 1, 1, 'dtgh', 'dghhyr', 'reyhtey', 'hdfy', 'dsfgstdg@sdifg', '', '2567842425', 'Auxiliar administrativo'),
(27, 1, 1, 'fhj', 'fhj', 'truy', 'drhyr', 'Blackwhite1@sadfg', '', 'sadf', 'rwq'),
(28, 1, 1, 'trh', 'sdg', 'dsfg', 'sdfg', 'Blackwhite1@sldg', '', 'fsdgfdg', 'sdfg'),
(29, 1, 1, 'asdfw', 'werw', 'werwer', 'ala', 'Blackwhite1@sadhf', '', 'asfdraweg', 'Ayudante administrativo'),
(30, 1, 1, 'asad', 'asdfgf', 'hfdvd', 'hulk', 'Blackwhite1@uisahdof', '', '123456788', 'Auxiliar administrativo'),
(31, 1, 1, 'dghdgh', 'dghdfghdg', 'dghdg', 'dhdgdfh', 'Blackwhite1@añsdjfad', '', '64546', 'asdfasdfsadf'),
(32, 1, 1, 'srgt', 'bfgh', 'xccxfgh', 'gdhxb', 'Blackwhite1@ahsdf', '', '64545565465', 'adsfadfs'),
(33, 1, 1, 'uhluih', 'rsegewt', 'werfgwerfg', 'nose', 'Blackwhite1@ñjksadf', '123', 'asdfawdw', 'asdfaw'),
(34, 1, 6, 'Leonardo Daniel', 'Chan', 'Méndez', 'LeoChan', 'leo1.25@gmail.com', '12345678', '9931997759', 'Desarrollador'),
(35, 1, NULL, 'a', 'a', 'a', 'aaaaa@jadcadc.com', 'aaaaa@jadcadc.com', 'a', '6544468975', 'a'),
(36, 1, NULL, 'a', 'a', 'a', 'assadds', 'aaaaa@jadcadc.com', 'a', '123', '12'),
(37, 1, NULL, 'a', 'a', 'a', 'a', 'aaaaa@jadcadc.com', 'a', '123', 'a'),
(38, 1, NULL, 'a', 'a', 'a', 'a', 'aaaaa@jadcadc.com', 'a', '123', 'a'),
(39, 1, NULL, 'a', 'a', 'a', 'a', 'aaaaa@jadcadc.com', 'a', '123', 'a'),
(40, 1, NULL, 'a', 'a', 'a', 'a', 'aaaaa@jadcadc.com', 'a', '123', 'a'),
(41, 1, NULL, 'a', 'a', 'a', 'a', 'aaaaa@jadcadc.com', 'a', '123', 'a'),
(42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 1, NULL, 'af', 'a', 'a', 'a', 'aaaaa@jadcadc.com', '1', '123', '12'),
(44, 1, 4, 'af', 'a', 'a', 'a', 'aaaaa@jadcadc.com', 'a', '123', '12'),
(45, 1, 4, 'af', 'a', 'a', 'a', 'aaaaa@jadcadc.com', 'a', '123', '12'),
(46, 1, 6, 'Hola', 'Como', 'TRe', 'encuenmtrs', 'eldia@gmail.com', 'Soledad', '887484', 'Nose');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id_area`);

--
-- Indices de la tabla `buzon`
--
ALTER TABLE `buzon`
  ADD PRIMARY KEY (`id_buzon`),
  ADD KEY `usuarios_id_usuario_buzon` (`id_usuario`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `formas_de_pago_id_forma_de_pago_clientes` (`id_forma_de_pago`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `formas_de_pago`
--
ALTER TABLE `formas_de_pago`
  ADD PRIMARY KEY (`id_forma_de_pago`);

--
-- Indices de la tabla `formularios`
--
ALTER TABLE `formularios`
  ADD PRIMARY KEY (`id_formulario`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `formas_de_pago_id_forma_de_pago_proveedores` (`id_forma_de_pago`);

--
-- Indices de la tabla `tipos_de_usuarios`
--
ALTER TABLE `tipos_de_usuarios`
  ADD PRIMARY KEY (`id_tipo_de_usuario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `tipos_de_usuarios_id_tipo_de_usuario_usuarios` (`id_tipo_de_usuario`),
  ADD KEY `areas_id_area_usuarios` (`id_area`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `areas`
--
ALTER TABLE `areas`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `buzon`
--
ALTER TABLE `buzon`
  MODIFY `id_buzon` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `formas_de_pago`
--
ALTER TABLE `formas_de_pago`
  MODIFY `id_forma_de_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `formularios`
--
ALTER TABLE `formularios`
  MODIFY `id_formulario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `tipos_de_usuarios`
--
ALTER TABLE `tipos_de_usuarios`
  MODIFY `id_tipo_de_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `buzon`
--
ALTER TABLE `buzon`
  ADD CONSTRAINT `usuarios_id_usuario_buzon` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `formas_de_pago_id_forma_de_pago_clientes` FOREIGN KEY (`id_forma_de_pago`) REFERENCES `formas_de_pago` (`id_forma_de_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `formas_de_pago_id_forma_de_pago_proveedores` FOREIGN KEY (`id_forma_de_pago`) REFERENCES `formas_de_pago` (`id_forma_de_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `areas_id_area_usuarios` FOREIGN KEY (`id_area`) REFERENCES `areas` (`id_area`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tipos_de_usuarios_id_tipo_de_usuario_usuarios` FOREIGN KEY (`id_tipo_de_usuario`) REFERENCES `tipos_de_usuarios` (`id_tipo_de_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
