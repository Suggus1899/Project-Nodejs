
--
-- Base de datos: `insai`
--
create database insai;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `id` int(11) NOT NULL,
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`id`, `estado`) VALUES
(1, 'Anzoátegui'),
(2, 'Apure'),
(3, 'Aragua'),
(4, 'Barinas'),
(5, 'Bolívar'),
(6, 'Carabobo'),
(7, 'Cojedes'),
(8, 'Falcón'),
(9, 'Guárico'),
(10, 'Lara'),
(11, 'Mérida'),
(12, 'Miranda'),
(13, 'Monagas'),
(14, 'Nueva Esparta'),
(15, 'Portuguesa'),
(16, 'Sucre'),
(17, 'Táchira'),
(18, 'Trujillo'),
(19, 'Yaracuy'),
(20, 'Zulia'),
(21, 'Distrito Federal'),
(22, 'Territorio Federal Amazonas'),
(23, 'Territorio Federal Delta Amacuro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `nombre`, `usuario`, `contraseña`) VALUES
(1, 'OLIVIER', 'olivier', '123'),
(2, 'LEIDY', 'lau', '3112'),
(3, 'CHERRY', 'profesor', '100');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_carnet_hierro`
--

CREATE TABLE `registro_carnet_hierro` (
  `id` int(11) NOT NULL,
  `propietario` varchar(30) DEFAULT NULL,
  `cedula` int(11) DEFAULT NULL,
  `fundo` varchar(30) DEFAULT NULL,
  `municipio` varchar(20) DEFAULT NULL,
  `entidad_federal` varchar(20) DEFAULT NULL,
  `num_reg` int(11) NOT NULL,
  `year` year(4) DEFAULT NULL,
  `num_folios` varchar(10) DEFAULT NULL,
  `num_libros` int(11) DEFAULT NULL,
  `uso_hierro` varchar(20) DEFAULT NULL,
  `id_ruta_foto_persona` varchar(255) NOT NULL,
  `id_ruta_design_hierro` varchar(255) NOT NULL,
  `id_ruta_firma_estatal` varchar(255) NOT NULL,
  `id_ruta_sello_institucion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `registro_carnet_hierro`
--

INSERT INTO `registro_carnet_hierro` (`id`, `propietario`, `cedula`, `fundo`, `municipio`, `entidad_federal`, `num_reg`, `year`, `num_folios`, `num_libros`, `uso_hierro`, `id_ruta_foto_persona`, `id_ruta_design_hierro`, `id_ruta_firma_estatal`, `id_ruta_sello_institucion`) VALUES
(1, 'CHERRY J RAMIREZ OLIVARES', 17739316, 'CAMPO SUR', 'INFANTE', 'GUARICO', 2112, '2008', '4121-4122', 9, 'CRIADOR', 'id_ruta_foto_persona-1739289652012-266308714.jpg', 'id_ruta_design_hierro-1739289652018-779261966.png', 'id_ruta_firma_estatal-1739289652019-476464984.jpg', 'id_ruta_sello_institucion-1739289652019-494388312.jpg'),
(2, 'RUFO GONZALEZ', 3616653, 'LA FLORIDA', 'MONAGAS', 'PORTUGUESA', 1940, '2002', '1350-1949', 5, 'CRIADOR', 'id_ruta_foto_persona-1739290739858-9981491.jpg', 'id_ruta_design_hierro-1739290739859-403054420.png', 'id_ruta_firma_estatal-1739290739860-990025591.jpg', 'id_ruta_sello_institucion-1739290739862-871920022.jpg'),
(3, 'JEAN CARLOS HERNANDEZ', 17316352, 'LA MARIPOSA', 'MONAGAS', 'GUARICO', 1553, '2010', '2860-6730', 9, 'COMERCIANTE', 'id_ruta_foto_persona-1739291121248-707137417.jpg', 'id_ruta_design_hierro-1739291121252-256678005.png', 'id_ruta_firma_estatal-1739291121253-640682377.jpg', 'id_ruta_sello_institucion-1739291121253-914963014.jpg'),
(4, 'REINALDO VILLARROEL', 8572004, 'LAS PICA PICA', 'MONAGAS', 'GUARICO', 5540, '1975', '1230-4587', 9, 'GANADERO', 'id_ruta_foto_persona-1739291195849-986014427.jpg', 'id_ruta_design_hierro-1739291195850-753622673.png', 'id_ruta_firma_estatal-1739291195850-66618702.jpg', 'id_ruta_sello_institucion-1739291195850-831520441.jpg'),
(5, 'BRANDON JOSUE MORALES MARCHAN', 31158710, 'FINCA BONITA', 'GIRALDO', 'ARAGUA', 7854, '2020', '4579-4754', 3, 'GRANJERO', 'id_ruta_foto_persona-1739291339160-237257455.jpg', 'id_ruta_design_hierro-1739291339161-75498215.png', 'id_ruta_firma_estatal-1739291339161-708436800.jpg', 'id_ruta_sello_institucion-1739291339161-300638666.jpg'),
(11, 'ADRIAN FERNANDO RODRIGUEZ', 31114123, 'CAMPO LINDO', 'PAEZ', 'LARA', 1312, '2008', '45', 2, 'COLEADOR', 'id_ruta_foto_persona-1739291684019-563246732.jpg', 'id_ruta_design_hierro-1739291684023-942204966.png', 'id_ruta_firma_estatal-1739291684023-472573769.jpg', 'id_ruta_sello_institucion-1739291684023-82459642.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro_database`
--

CREATE TABLE `registro_database` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `cedula` int(11) DEFAULT NULL,
  `fundo_institucion` varchar(255) DEFAULT NULL,
  `id_estados` int(11) DEFAULT NULL,
  `id_registro_carnet_hierro` int(11) DEFAULT NULL,
  `id_requisitos_carnet` int(11) DEFAULT NULL,
  `id_ruta_foto_persona` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutas_imagenes`
--

CREATE TABLE `rutas_imagenes` (
  `id` int(11) NOT NULL,
  `ruta_foto_persona` varchar(255) DEFAULT NULL,
  `ruta_diseño_hierro` varchar(255) DEFAULT NULL,
  `ruta_firma_estatal` varchar(255) DEFAULT NULL,
  `ruta_sello_institucion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro_carnet_hierro`
--
ALTER TABLE `registro_carnet_hierro`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `registro_database`
--
ALTER TABLE `registro_database`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rutas_imagenes`
--
ALTER TABLE `rutas_imagenes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estados`
--
ALTER TABLE `estados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `registro_carnet_hierro`
--
ALTER TABLE `registro_carnet_hierro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `registro_database`
--
ALTER TABLE `registro_database`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rutas_imagenes`
--
ALTER TABLE `rutas_imagenes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;