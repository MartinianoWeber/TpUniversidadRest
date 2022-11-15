-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-11-2022 a las 05:07:46
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gestionestacionamiento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autos`
--

CREATE TABLE `autos` (
  `id` int(11) NOT NULL,
  `patente` varchar(30) NOT NULL,
  `entrada` time DEFAULT NULL,
  `cliente` int(11) NOT NULL,
  `estacionamiento` int(11) NOT NULL,
  `salida` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `autos`
--

INSERT INTO `autos` (`id`, `patente`, `entrada`, `cliente`, `estacionamiento`, `salida`) VALUES
(29, 'pruebDeEdit', '17:32:00', 3, 1, '19:32:00'),
(30, 'aoa 002', '18:32:00', 1, 5, '19:32:00'),
(31, 'aoa 002', '15:43:00', 1, 1, '19:33:00'),
(32, 'aoa 002', '19:54:00', 1, 1, '21:55:00'),
(33, 'aoa 0022', '13:36:00', 2, 5, '22:36:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `telefono` int(40) NOT NULL,
  `DNI` int(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `telefono`, `DNI`) VALUES
(1, 'Martiniano', 2147483647, 44242921),
(2, 'María Jesús Camila', 2147483647, 24525507),
(3, 'Leo Sardina', 2147483647, 22321232);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionamientos`
--

CREATE TABLE `estacionamientos` (
  `numeroEstacionamiento` int(11) NOT NULL,
  `libre` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estacionamientos`
--

INSERT INTO `estacionamientos` (`numeroEstacionamiento`, `libre`) VALUES
(1, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ganancias`
--

CREATE TABLE `ganancias` (
  `id` int(11) NOT NULL,
  `autos` int(11) NOT NULL,
  `valorHora` int(11) NOT NULL,
  `totalGanado` int(11) NOT NULL,
  `horas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ganancias`
--

INSERT INTO `ganancias` (`id`, `autos`, `valorHora`, `totalGanado`, `horas`) VALUES
(4, 32, 155, 310, 2),
(5, 33, 155, 1395, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `maintabla`
--

CREATE TABLE `maintabla` (
  `id` int(11) NOT NULL,
  `ganancias` int(11) NOT NULL,
  `cantidadClientes` int(11) NOT NULL,
  `estacionamientosLibres` int(11) NOT NULL,
  `totalAutos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `tipo` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `contraseña`, `tipo`) VALUES
(12, 'empleado', '$2y$10$WhJOMtT2yT4rRk5O0.B.HeTqP/rrCtJUC6MLMluYSe.FXQDfqTMKS', 'empleado'),
(13, 'empleado', '$2y$10$Jw3cajhNbFABy9E1I/snluLzzLmWFTIgRveOZIr2M.r1ZUu4BeB9S', 'empleado'),
(14, 'admin', '$2y$10$dajXNi8M4bywNUmFuIfStuMLfnWf10pM6yfZABTkKh5pzCfwXvOam', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autos`
--
ALTER TABLE `autos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CLIENTE_FK` (`cliente`),
  ADD KEY `ESTACIONAMIENTO_FK` (`estacionamiento`) USING BTREE;

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estacionamientos`
--
ALTER TABLE `estacionamientos`
  ADD PRIMARY KEY (`numeroEstacionamiento`);

--
-- Indices de la tabla `ganancias`
--
ALTER TABLE `ganancias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auto_FK` (`autos`) USING BTREE;

--
-- Indices de la tabla `maintabla`
--
ALTER TABLE `maintabla`
  ADD PRIMARY KEY (`id`),
  ADD KEY `GANANCIAS_FK` (`ganancias`) USING BTREE;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autos`
--
ALTER TABLE `autos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ganancias`
--
ALTER TABLE `ganancias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `maintabla`
--
ALTER TABLE `maintabla`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `autos`
--
ALTER TABLE `autos`
  ADD CONSTRAINT `autos_ibfk_1` FOREIGN KEY (`estacionamiento`) REFERENCES `estacionamientos` (`numeroEstacionamiento`) ON DELETE CASCADE,
  ADD CONSTRAINT `autos_ibfk_2` FOREIGN KEY (`cliente`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `ganancias`
--
ALTER TABLE `ganancias`
  ADD CONSTRAINT `ganancias_ibfk_1` FOREIGN KEY (`autos`) REFERENCES `autos` (`id`);

--
-- Filtros para la tabla `maintabla`
--
ALTER TABLE `maintabla`
  ADD CONSTRAINT `maintabla_ibfk_1` FOREIGN KEY (`ganancias`) REFERENCES `ganancias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
