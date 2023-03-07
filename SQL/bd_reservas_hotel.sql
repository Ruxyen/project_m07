-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 07-03-2023 a las 09:56:34
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_reservas_hotel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Client`
--

CREATE TABLE `Client` (
  `id_client` int(5) NOT NULL,
  `nom_client` varchar(50) NOT NULL,
  `cognoms` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasenya` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Client`
--

INSERT INTO `Client` (`id_client`, `nom_client`, `cognoms`, `email`, `contrasenya`) VALUES
(1, 'Maria', 'Garcia Rodriguez', 'mariagr@gmail.com', '12345'),
(2, 'David', 'Lopez Martinez', 'davidlm@hotmail.com', 'abcdef'),
(3, 'Laura', 'Sanchez Torres', 'laurast@gmail.com', 'qwerty'),
(4, 'Juan', 'Pérez', 'juan@gmail.com', 'contraseña123'),
(5, 'María', 'González', 'maria@hotmail.com', 'contraseña000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Habitacio`
--

CREATE TABLE `Habitacio` (
  `id_habitacio` int(5) NOT NULL,
  `tipus_habitacio` varchar(50) NOT NULL,
  `preu_nit` decimal(8,2) NOT NULL,
  `capacitat` int(5) NOT NULL,
  `descripció` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Habitacio`
--

INSERT INTO `Habitacio` (`id_habitacio`, `tipus_habitacio`, `preu_nit`, `capacitat`, `descripció`) VALUES
(1, 'Individual', '50.00', 1, 'Habitació individual amb bany privat.'),
(2, 'Doble', '80.00', 2, 'Habitacio doble amb llit de matrimoni i bany privat.'),
(3, 'Suite', '150.00', 2, 'Habitacio suite amb llit de matrimoni, sala de estar i bany privat.'),
(4, 'Individual', '50.00', 1, 'Habitació individual amb bany privat.'),
(5, 'Doble', '80.00', 2, 'Habitació doble amb llit de matrimoni i bany privat.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Reserva`
--

CREATE TABLE `Reserva` (
  `id_reserva` int(5) NOT NULL,
  `data_entrada` date NOT NULL,
  `data_sortida` date NOT NULL,
  `num_persones` int(2) NOT NULL,
  `id_habitacio` int(5) DEFAULT NULL,
  `id_client` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `Reserva`
--

INSERT INTO `Reserva` (`id_reserva`, `data_entrada`, `data_sortida`, `num_persones`, `id_habitacio`, `id_client`) VALUES
(1, '2023-04-15', '2023-04-20', 2, 1, 1),
(2, '2023-05-10', '2023-05-15', 1, 2, 2),
(3, '2023-06-20', '2023-06-25', 3, 3, 3),
(4, '2023-03-10', '2023-03-15', 2, 1, 1),
(5, '2023-04-20', '2023-04-25', 1, 2, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `Habitacio`
--
ALTER TABLE `Habitacio`
  ADD PRIMARY KEY (`id_habitacio`);

--
-- Indices de la tabla `Reserva`
--
ALTER TABLE `Reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_habitacio` (`id_habitacio`),
  ADD KEY `id_client` (`id_client`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Reserva`
--
ALTER TABLE `Reserva`
  ADD CONSTRAINT `Reserva_ibfk_1` FOREIGN KEY (`id_habitacio`) REFERENCES `Habitacio` (`id_habitacio`),
  ADD CONSTRAINT `Reserva_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `Client` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
