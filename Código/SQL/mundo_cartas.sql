-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-03-2018 a las 00:35:17
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mundo_cartas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartas`
--

CREATE TABLE `cartas` (
  `codCar` int(11) NOT NULL,
  `nomCar` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `perteneceA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `cartas`
--

INSERT INTO `cartas` (`codCar`, `nomCar`, `perteneceA`) VALUES
(1, 'Dragón shivano', 1),
(2, 'Charmander', 2),
(3, 'Mago Oscuro', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cartasusuario`
--

CREATE TABLE `cartasusuario` (
  `CodUsu` int(11) NOT NULL,
  `CodCar` int(11) NOT NULL,
  `FechIngCar` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cartasusuario`
--

INSERT INTO `cartasusuario` (`CodUsu`, `CodCar`, `FechIngCar`) VALUES
(1, 1, '0000-00-00 00:00:00'),
(1, 2, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familiacartas`
--

CREATE TABLE `familiacartas` (
  `codFamCar` int(11) NOT NULL,
  `nomFamCar` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `familiacartas`
--

INSERT INTO `familiacartas` (`codFamCar`, `nomFamCar`) VALUES
(1, 'Magic: The Gathering'),
(2, 'Pokémon Trading Card Game'),
(3, 'Yu-Gi-Oh! Trading Card Game');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `CodUsu` int(11) NOT NULL,
  `NomUsu` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CorEleUsu` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ConUsu` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `FecNacUsu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`CodUsu`, `NomUsu`, `CorEleUsu`, `ConUsu`, `FecNacUsu`) VALUES
(1, 'Sonio', 'ibaaponerSoniaperomequivoqué@puesnada.com', 'sdhdfiwebf51', '1900-01-01'),
(2, 'Pepito', 'Pepito@pep.p', 'pepitoELmolon', '1980-03-05'),
(3, 'Rocío', 'holaadios2411@gmail.com', 'teleoperadora', '1999-11-24'),
(4751, 'Rrsmfk', 'prueba@prueba.prueba', 'prueba', '1999-01-30'),
(47851, '485', '74512@sdf.askdm', '98465132', '1800-11-11');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cartas`
--
ALTER TABLE `cartas`
  ADD PRIMARY KEY (`codCar`),
  ADD UNIQUE KEY `Nombre` (`nomCar`) USING BTREE,
  ADD KEY `perteneceA` (`perteneceA`),
  ADD KEY `perteneceA_2` (`perteneceA`);

--
-- Indices de la tabla `cartasusuario`
--
ALTER TABLE `cartasusuario`
  ADD PRIMARY KEY (`CodUsu`,`CodCar`),
  ADD KEY `CodCar` (`CodCar`);

--
-- Indices de la tabla `familiacartas`
--
ALTER TABLE `familiacartas`
  ADD PRIMARY KEY (`codFamCar`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`CodUsu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cartas`
--
ALTER TABLE `cartas`
  MODIFY `codCar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `familiacartas`
--
ALTER TABLE `familiacartas`
  MODIFY `codFamCar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `CodUsu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47852;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cartas`
--
ALTER TABLE `cartas`
  ADD CONSTRAINT `cartas_ibfk_1` FOREIGN KEY (`perteneceA`) REFERENCES `familiacartas` (`codFamCar`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `cartasusuario`
--
ALTER TABLE `cartasusuario`
  ADD CONSTRAINT `cartasusuario_ibfk_1` FOREIGN KEY (`CodCar`) REFERENCES `cartas` (`codCar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cartasusuario_ibfk_2` FOREIGN KEY (`CodUsu`) REFERENCES `usuario` (`CodUsu`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
