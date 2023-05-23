-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-06-2019 a las 07:03:06
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `notas`
--
CREATE DATABASE IF NOT EXISTS `notas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `notas`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

DROP TABLE IF EXISTS `calificacion`;
CREATE TABLE `calificacion` (
  `id_calificacion` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `id_evidencia` int(11) NOT NULL,
  `puntaje` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
CREATE TABLE `estudiante` (
  `id_estudiante` int(11) NOT NULL,
  `nombres_estudiante` varchar(30) NOT NULL,
  `apellidos_estudiante` varchar(30) NOT NULL,
  `correo_estudiante` varchar(50) NOT NULL,
  `fecha_nacimiento_estudiante` date NOT NULL,
  `curso_estudiante` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evidencia`
--

DROP TABLE IF EXISTS `evidencia`;
CREATE TABLE `evidencia` (
  `id_evidencia` int(11) NOT NULL,
  `nombre_evidencia` varchar(50) NOT NULL,
  `descripcion_evidencia` varchar(200) NOT NULL,
  `puntaje_maximo_evidencia` int(11) NOT NULL,
  `fecha_evidencia` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`id_calificacion`),
  ADD KEY `idxIdEstudiante` (`id_estudiante`),
  ADD KEY `idxIdEvidencia` (`id_evidencia`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id_estudiante`);

--
-- Indices de la tabla `evidencia`
--
ALTER TABLE `evidencia`
  ADD PRIMARY KEY (`id_evidencia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id_calificacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `evidencia`
--
ALTER TABLE `evidencia`
  MODIFY `id_evidencia` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD CONSTRAINT `calificacion_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`id_estudiante`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `calificacion_ibfk_2` FOREIGN KEY (`id_evidencia`) REFERENCES `evidencia` (`id_evidencia`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
