-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-05-2025 a las 06:43:27
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
-- Base de datos: `biblioteca_laboratorios_ad_b1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ID_Cliente` int(11) NOT NULL,
  `Nombre` varchar(150) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ID_Cliente`, `Nombre`, `Correo`, `Telefono`) VALUES
(1, 'Laura Torres', 'laura.torres@email.com', '3214567890'),
(2, 'Carlos Pérez', 'carlos.perez@email.com', '3123456789'),
(3, 'Ana Gómez', 'ana.gomez@email.com', '3001234567');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ID_Libro` int(11) NOT NULL,
  `Titulo` varchar(255) NOT NULL,
  `Autor` varchar(150) NOT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `Anio_Publicacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ID_Libro`, `Titulo`, `Autor`, `Genero`, `Anio_Publicacion`) VALUES
(1, 'Cien Años de Soledad', 'Gabriel García Márquez', 'Realismo mágico', 1967),
(2, '1984', 'George Orwell', 'Distopía', 1949),
(3, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Novela clásica', 1605),
(4, 'El Principito', 'Antoine de Saint-Exupéry', 'Fábula', 1943),
(5, 'Rayuela', 'Julio Cortázar', 'Ficción', 1963);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `ID_Prestamo` int(11) NOT NULL,
  `ID_Cliente` int(11) NOT NULL,
  `ID_Libro` int(11) NOT NULL,
  `Fecha_Prestamo` date NOT NULL,
  `Fecha_Devolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`ID_Prestamo`, `ID_Cliente`, `ID_Libro`, `Fecha_Prestamo`, `Fecha_Devolucion`) VALUES
(1, 1, 2, '2025-05-01', '2025-05-08'),
(2, 2, 4, '2025-05-03', NULL),
(3, 3, 1, '2025-04-25', '2025-05-02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID_Libro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_Prestamo`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_Libro` (`ID_Libro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `ID_Libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `ID_Prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `clientes` (`ID_Cliente`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`ID_Libro`) REFERENCES `libros` (`ID_Libro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
