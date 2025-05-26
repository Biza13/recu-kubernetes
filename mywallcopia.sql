-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2025 a las 18:08:34
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
-- Base de datos: `mywallcopia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `publicacion_id` int(11) NOT NULL,
  `comentario_resp_id` int(11) DEFAULT NULL,
  `contenido_com` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `usuario_id`, `publicacion_id`, `comentario_resp_id`, `contenido_com`) VALUES
(1, 3, 1, NULL, 'esta es el comentario a la primera publicacion'),
(2, 3, 1, NULL, 'segundo comentario'),
(3, 3, 1, NULL, 'tercer comentario de prueba'),
(4, 3, 2, NULL, 'este es el comentario de pepe a la publicacion de ana'),
(5, 3, 1, 2, 'esta es la respuesta el comentario, segunco comentario de la publicacion con id 1'),
(15, 2, 1, NULL, 'comentario de Ana a la primera publicación de pepe'),
(16, 2, 1, 2, 'respuesta al comentario la primera publicación con el usuario de Ana');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20250125111528', '2025-01-25 12:15:46', 268),
('DoctrineMigrations\\Version20250128173640', '2025-01-28 18:37:11', 63);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `publicaciones`
--

CREATE TABLE `publicaciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` varchar(255) NOT NULL,
  `fecha_pub` datetime NOT NULL,
  `imagen_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `publicaciones`
--

INSERT INTO `publicaciones` (`id`, `usuario_id`, `titulo`, `contenido`, `fecha_pub`, `imagen_path`) VALUES
(1, 3, 'publicacion de prueba', 'esto es una publicacion de prueba para probar y este contenido es para probar la longitud de hasta donde llega la tabla o que pasa con ella si el contenido de la publicacion es muy largo etc', '2025-01-25 14:04:48', NULL),
(2, 2, 'Publicacion de ana', 'Este es el contenido de la primera publicacion de Ana', '2025-01-25 18:21:32', NULL),
(4, 3, 'segunda', 'segunda publicacion de pepe', '2025-01-27 19:46:04', NULL),
(5, 3, 'probando las imagenes', 'vamos a probar si esto funciona o no, voy a intentar subir una imagen', '2025-01-28 19:49:05', 'Horario-679926a1f1658.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`) VALUES
(2, 'ana', '[]', '$2y$13$7gH3MoZAva/oViyW90PL1OcD9QZrunhiidgGLP2ocCPiWM6eXuufy'),
(3, 'pepe', '[]', '$2y$13$.5Q.lGLEiGA0SzcOZa.JY.aTGPmDkqS7g6ie.zDDpk5lkgwOGvLYS'),
(4, 'lucia', '[]', '$2y$13$tBbNiFnpQRZg6TaAQ8aYyuGuzpiPPjyD2tvP56273SOka1NpbJU0O'),
(9, 'amparo', '[]', '$2y$13$Me52k.q1qKSS57vUv8o7uO/HoZcZPfRCPLYuowAhVsXt4COFkS7TC');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F54B3FC0DB38439E` (`usuario_id`),
  ADD KEY `IDX_F54B3FC09ACBB5E7` (`publicacion_id`),
  ADD KEY `IDX_F54B3FC0FB9C7413` (`comentario_resp_id`);

--
-- Indices de la tabla `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indices de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A3A706C0DB38439E` (`usuario_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `FK_F54B3FC09ACBB5E7` FOREIGN KEY (`publicacion_id`) REFERENCES `publicaciones` (`id`),
  ADD CONSTRAINT `FK_F54B3FC0DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_F54B3FC0FB9C7413` FOREIGN KEY (`comentario_resp_id`) REFERENCES `comentarios` (`id`);

--
-- Filtros para la tabla `publicaciones`
--
ALTER TABLE `publicaciones`
  ADD CONSTRAINT `FK_A3A706C0DB38439E` FOREIGN KEY (`usuario_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
