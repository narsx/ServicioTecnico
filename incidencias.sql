-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-03-2022 a las 16:31:17
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `incidencias`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`id`, `nombre`, `apellidos`, `telefono`, `direccion`) VALUES
(1, 'cliente', 'fulatino', '675980965', 'Carlos Garzarán'),
(2, 'Prueba', 'Olmedo', '675980954', '13620'),
(3, 'altoke', '12123', '21331', '121');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220311202201', '2022-03-11 21:23:03', 2208);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia`
--

CREATE TABLE `incidencia` (
  `id` int(11) NOT NULL,
  `id_usuario_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `titulo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `estado` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `incidencia`
--

INSERT INTO `incidencia` (`id`, `id_usuario_id`, `cliente_id`, `titulo`, `fecha_creacion`, `estado`) VALUES
(1, 1, 1, 'prueba', '2022-03-11 20:26:58', 'INICIADA'),
(2, 1, 1, 'hola', '2022-03-12 01:13:21', 'RESUELTA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineas_de_incidencia`
--

CREATE TABLE `lineas_de_incidencia` (
  `id` int(11) NOT NULL,
  `incidencia_id` int(11) DEFAULT NULL,
  `texto` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `lineas_de_incidencia`
--

INSERT INTO `lineas_de_incidencia` (`id`, `incidencia_id`, `texto`, `fecha_creacion`) VALUES
(1, 1, 'solucionada', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `email`, `roles`, `password`, `nombre`, `apellidos`, `telefono`, `foto`) VALUES
(1, 'fernando.olmedo.ortiz.1992@gmail.com', '[\"ROLE_TECNICO\"]', '$argon2id$v=19$m=65536,t=4,p=1$V3BpRktxT2F5WTlGdmVWag$ZRLuHRBKWJ0r3NOAMFhgoUFx+tEsJbzKkErN0IHNCfY', 'Fernando', 'Olmedo', '675980965', '622bb0152c59a . png'),
(2, 'admin@administrador.com', '[\"ROLE_ADMINISTRADOR\"]', '$argon2id$v=19$m=65536,t=4,p=1$LnVzMk5zalN4Mkt3ZUp6dA$HscLuTzL/xd/nVSurG1OCs4ECRQHRz73QyH4XORum7s', 'administrador', 'administrador', '675980965', '622c1f0cdb85b . jpg'),
(3, 'fernan.1992@hotmail.com', '[\"ROLE_ADMINISTRADOR\"]', '$argon2id$v=19$m=65536,t=4,p=1$ZlYuNWZ1Y2ZtZVBWOFhxLw$0xohj4DOt32zaIH7NBWsYxe8GmEyPflYhVffwBwM3j0', 'fertxu.25', 'olmedito', '675980965', '622c1f7f0a60c . png'),
(4, 'final@final.com', '[\"ROLE_ADMINISTRADOR\"]', '$argon2id$v=19$m=65536,t=4,p=1$VXdFVXZBeWRQRi5LdUpSTQ$1bgjcDE9S6F2yFY3mIdAVHhxw/SzxaDOhj1InBXxJa8', 'pruebafinal', 'finalito', '12345', '622c211f999dc . jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C7C6728C7EB2C349` (`id_usuario_id`),
  ADD KEY `IDX_C7C6728CDE734E51` (`cliente_id`);

--
-- Indices de la tabla `lineas_de_incidencia`
--
ALTER TABLE `lineas_de_incidencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7FA37BA1E1605BE2` (`incidencia_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_2265B05DE7927C74` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `lineas_de_incidencia`
--
ALTER TABLE `lineas_de_incidencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD CONSTRAINT `FK_C7C6728C7EB2C349` FOREIGN KEY (`id_usuario_id`) REFERENCES `usuario` (`id`),
  ADD CONSTRAINT `FK_C7C6728CDE734E51` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`);

--
-- Filtros para la tabla `lineas_de_incidencia`
--
ALTER TABLE `lineas_de_incidencia`
  ADD CONSTRAINT `FK_7FA37BA1E1605BE2` FOREIGN KEY (`incidencia_id`) REFERENCES `incidencia` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
