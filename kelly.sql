-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2023 a las 20:24:47
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `kelly`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `idcomentario` int(11) DEFAULT NULL,
  `comentario` varchar(355) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idusuariointerno` int(11) DEFAULT NULL,
  `idusuarioexterno` int(11) DEFAULT NULL,
  `idnota` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

CREATE TABLE `noticias` (
  `idnota` int(11) NOT NULL,
  `nota` varchar(355) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idusuariointerno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`idnota`, `nota`, `fecha`, `idusuariointerno`) VALUES
(1, 'Bienvenidos a todos', '2024-01-01 05:59:59', 1),
(2, 'hola', '2023-05-07 02:46:41', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `idpersonal` int(11) NOT NULL,
  `apepaterno` varchar(30) DEFAULT NULL,
  `apematerno` varchar(30) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `fechadeingreso` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idusuariointerno` int(11) DEFAULT NULL,
  `idusuarioexterno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`idpersonal`, `apepaterno`, `apematerno`, `nombre`, `direccion`, `fechadeingreso`, `idusuariointerno`, `idusuarioexterno`) VALUES
(1, 'perez', 'gonzalez', 'maria', 'oriente 15 entre norte 2 y 4, #54', '2000-01-01 05:59:59', 1, NULL),
(2, 'flores', 'gonzalez', 'juan', 'oriente 15 entre norte 2 y 4, #54', '2000-01-01 05:59:59', 2, NULL),
(3, 'karenina', NULL, 'karenina', 'oriente 15 entre norte 2 y 4, #54', '2000-01-01 05:59:59', NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `idregistro` int(11) NOT NULL,
  `correoempresa` varchar(30) DEFAULT NULL,
  `contrasena` varchar(355) DEFAULT NULL,
  `correopersonal` varchar(30) DEFAULT NULL,
  `tipo` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registro`
--

INSERT INTO `registro` (`idregistro`, `correoempresa`, `contrasena`, `correopersonal`, `tipo`) VALUES
(0, 'junior@empresa.mx', 'qwerty', NULL, 1),
(1, 'sr@empresa.mx', 'qwerty', NULL, 1),
(2, 'maty@empresa.mx', 'qwerty', NULL, 1),
(3, NULL, 'qwerty', 'mario@gmail.com', 0),
(4, NULL, 'qwerty', 'karen@gmail.com', 0),
(5, NULL, 'qwerty', 'beto@gmail.com', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosexternos`
--

CREATE TABLE `usuariosexternos` (
  `idusuarioexterno` int(11) NOT NULL,
  `correoepersonal` varchar(30) DEFAULT NULL,
  `contrasena` varchar(355) DEFAULT NULL,
  `idregistro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuariosexternos`
--

INSERT INTO `usuariosexternos` (`idusuarioexterno`, `correoepersonal`, `contrasena`, `idregistro`) VALUES
(1, NULL, NULL, 3),
(2, NULL, NULL, 4),
(3, NULL, NULL, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuariosinternos`
--

CREATE TABLE `usuariosinternos` (
  `idusuariointerno` int(11) NOT NULL,
  `correoempresa` varchar(30) DEFAULT NULL,
  `contrasena` varchar(355) DEFAULT NULL,
  `idregistro` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuariosinternos`
--

INSERT INTO `usuariosinternos` (`idusuariointerno`, `correoempresa`, `contrasena`, `idregistro`) VALUES
(1, 'jr@empresa.mx', NULL, 0),
(2, NULL, NULL, 1),
(3, NULL, NULL, 2),
(4, NULL, NULL, 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD KEY `idusuariointerno` (`idusuariointerno`),
  ADD KEY `idusuarioexterno` (`idusuarioexterno`),
  ADD KEY `idnota` (`idnota`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`idnota`),
  ADD KEY `idusuariointerno` (`idusuariointerno`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`idpersonal`),
  ADD KEY `idusuariointerno` (`idusuariointerno`),
  ADD KEY `idusuarioexterno` (`idusuarioexterno`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`idregistro`),
  ADD UNIQUE KEY `correoempresa` (`correoempresa`),
  ADD UNIQUE KEY `correopersonal` (`correopersonal`);

--
-- Indices de la tabla `usuariosexternos`
--
ALTER TABLE `usuariosexternos`
  ADD PRIMARY KEY (`idusuarioexterno`),
  ADD KEY `idregistro` (`idregistro`);

--
-- Indices de la tabla `usuariosinternos`
--
ALTER TABLE `usuariosinternos`
  ADD PRIMARY KEY (`idusuariointerno`),
  ADD KEY `idregistro` (`idregistro`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`idusuariointerno`) REFERENCES `usuariosinternos` (`idusuariointerno`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`idusuarioexterno`) REFERENCES `usuariosexternos` (`idusuarioexterno`),
  ADD CONSTRAINT `comentarios_ibfk_3` FOREIGN KEY (`idnota`) REFERENCES `noticias` (`idnota`);

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `noticias_ibfk_1` FOREIGN KEY (`idusuariointerno`) REFERENCES `usuariosinternos` (`idusuariointerno`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`idusuariointerno`) REFERENCES `usuariosinternos` (`idusuariointerno`),
  ADD CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`idusuarioexterno`) REFERENCES `usuariosexternos` (`idusuarioexterno`);

--
-- Filtros para la tabla `usuariosexternos`
--
ALTER TABLE `usuariosexternos`
  ADD CONSTRAINT `usuariosexternos_ibfk_1` FOREIGN KEY (`idregistro`) REFERENCES `registro` (`idregistro`);

--
-- Filtros para la tabla `usuariosinternos`
--
ALTER TABLE `usuariosinternos`
  ADD CONSTRAINT `usuariosinternos_ibfk_1` FOREIGN KEY (`idregistro`) REFERENCES `registro` (`idregistro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
