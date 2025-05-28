-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-02-2025 a las 17:47:36
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `insai`
--

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `registro_carnet_hierro`
--
ALTER TABLE `registro_carnet_hierro`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `registro_carnet_hierro`
--
ALTER TABLE `registro_carnet_hierro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
