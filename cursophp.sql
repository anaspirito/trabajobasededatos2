-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-11-2023 a las 04:11:01
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cursophp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_dni` int(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_dni`, `nombre`, `apellido`) VALUES
(32456897, 'Manuel', 'Bravo'),
(35685214, 'Martina', 'Rodriguez'),
(36258674, 'Jesus', 'Melendez'),
(37523346, 'Cristina', 'Acuña'),
(40523664, 'Juan', 'Nuñez'),
(40539688, 'Jonathan', 'Andreani'),
(42586948, 'Marta', 'Bustos'),
(43017338, 'Ana', 'Spirito'),
(43526100, 'Sebastian', 'Rojas'),
(44449476, 'Carla', 'Miño');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id_compras` int(11) NOT NULL,
  `concepto` varchar(30) NOT NULL,
  `clientes_dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id_compras`, `concepto`, `clientes_dni`) VALUES
(1, 'consumidor', 43017338),
(2, 'consumidor', 44449476),
(3, 'consumidor', 37523346),
(4, 'consumidor', 36258674),
(5, 'consumidor', 40539688),
(6, 'consumidor', 40523664),
(7, 'consumidor', 32456897),
(8, 'consumidor', 42586948),
(9, 'consumidor', 35685214),
(10, 'consumidor', 43526100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompra`
--

CREATE TABLE `lineascompra` (
  `id_numero` int(11) NOT NULL,
  `compras_id` int(11) NOT NULL,
  `producto` text NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineascompra`
--

INSERT INTO `lineascompra` (`id_numero`, `compras_id`, `producto`, `importe`) VALUES
(1, 1, 'galletitas', 600),
(2, 2, 'gaseosa', 800),
(3, 3, 'fideos', 450),
(4, 4, 'twistos x2', 2000),
(5, 5, 'harina', 300),
(6, 6, 'chocolate', 1300),
(7, 7, 'shampoo', 1900),
(8, 8, 'avena', 980),
(9, 9, 'azúcar', 1200),
(10, 10, 'lentejas', 840);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id_compras`),
  ADD KEY `clientes_dni` (`clientes_dni`);

--
-- Indices de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD PRIMARY KEY (`id_numero`),
  ADD KEY `compras_id` (`compras_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id_compras` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  MODIFY `id_numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`id_dni`);

--
-- Filtros para la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD CONSTRAINT `lineascompra_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id_compras`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
