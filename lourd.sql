-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2026 a las 22:36:55
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
-- Base de datos: `lourd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citas`
--

CREATE TABLE `citas` (
  `id_citas` int(11) NOT NULL,
  `fecha_cita` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `motivo` text NOT NULL,
  `observaciones` text DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `medicos_id_medicos` int(11) NOT NULL,
  `pacientes_id_pacientes` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_citas`, `fecha_cita`, `hora_inicio`, `hora_fin`, `motivo`, `observaciones`, `fecha_creacion`, `medicos_id_medicos`, `pacientes_id_pacientes`, `creado_por`, `estado`) VALUES
(1, '2026-02-25', '09:00:00', '09:30:00', 'Dolor en el pecho', 'Paciente con antecedentes', '2026-02-23 16:36:20', 1, 1, 2, 1),
(2, '2026-02-26', '10:00:00', '10:30:00', 'Chequeo general', 'Control anual', '2026-02-23 16:36:20', 1, 2, 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_formulas`
--

CREATE TABLE `detalle_formulas` (
  `id_detalle_formulas` int(11) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  `frecuencia` varchar(100) NOT NULL,
  `duracion` varchar(100) NOT NULL,
  `instrucciones` text DEFAULT NULL,
  `formula_medicas_id_formula_medicas` int(11) NOT NULL,
  `medicamentos_id_medicamentos` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_formulas`
--

INSERT INTO `detalle_formulas` (`id_detalle_formulas`, `dosis`, `frecuencia`, `duracion`, `instrucciones`, `formula_medicas_id_formula_medicas`, `medicamentos_id_medicamentos`, `estado`) VALUES
(1, '1 tableta', 'Cada 8 horas', '7 días', 'Después de las comidas', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega_medicamentos`
--

CREATE TABLE `entrega_medicamentos` (
  `id_entrega_medicamentos` int(11) NOT NULL,
  `cantidad_entregada` int(11) NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `detalle_formulas_id_detalle_formulas` int(11) NOT NULL,
  `usuarios_id_usuarios` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `entrega_medicamentos`
--

INSERT INTO `entrega_medicamentos` (`id_entrega_medicamentos`, `cantidad_entregada`, `fecha_entrega`, `detalle_formulas_id_detalle_formulas`, `usuarios_id_usuarios`, `estado`) VALUES
(1, 7, '2026-02-23 16:36:20', 1, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes_medicos`
--

CREATE TABLE `examenes_medicos` (
  `id_examenes_medicos` int(11) NOT NULL,
  `tipo_examen` varchar(100) NOT NULL,
  `resultado` text DEFAULT NULL,
  `fecha_examen` date NOT NULL,
  `historias_clinicas_id_historias_clinicas` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `examenes_medicos`
--

INSERT INTO `examenes_medicos` (`id_examenes_medicos`, `tipo_examen`, `resultado`, `fecha_examen`, `historias_clinicas_id_historias_clinicas`, `estado`) VALUES
(1, 'Electrocardiograma', 'Ritmo cardíaco normal', '2026-02-25', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion_citas`
--

CREATE TABLE `facturacion_citas` (
  `id_facturacion_citas` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `metodo_pago` varchar(45) NOT NULL,
  `fecha_pago` datetime NOT NULL,
  `citas_id_citas` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `facturacion_citas`
--

INSERT INTO `facturacion_citas` (`id_facturacion_citas`, `valor`, `metodo_pago`, `fecha_pago`, `citas_id_citas`, `estado`) VALUES
(1, 120000, 'Efectivo', '2026-02-23 16:36:20', 1, 1),
(2, 80000, 'Tarjeta', '2026-02-23 16:36:20', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula_medicas`
--

CREATE TABLE `formula_medicas` (
  `id_formula_medicas` int(11) NOT NULL,
  `fecha_emision` datetime NOT NULL,
  `observaciones` text DEFAULT NULL,
  `historias_clinicas_id_historias_clinicas` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `formula_medicas`
--

INSERT INTO `formula_medicas` (`id_formula_medicas`, `fecha_emision`, `observaciones`, `historias_clinicas_id_historias_clinicas`, `estado`) VALUES
(1, '2026-02-23 16:36:20', 'Tomar medicamento por 7 días', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historias_clinicas`
--

CREATE TABLE `historias_clinicas` (
  `id_historias_clinicas` int(11) NOT NULL,
  `fecha_atencion` date NOT NULL,
  `sintomas` text NOT NULL,
  `observaciones` text DEFAULT NULL,
  `citas_id_citas` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historias_clinicas`
--

INSERT INTO `historias_clinicas` (`id_historias_clinicas`, `fecha_atencion`, `sintomas`, `observaciones`, `citas_id_citas`, `estado`) VALUES
(1, '2026-02-25', 'Dolor torácico', 'Se recomienda examen', 1, 1),
(2, '2026-02-26', 'Sin síntomas graves', 'Paciente estable', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_medicos`
--

CREATE TABLE `horarios_medicos` (
  `id_horarios_medicos` int(11) NOT NULL,
  `dia_semana` varchar(20) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `medicos_id_medicos` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horarios_medicos`
--

INSERT INTO `horarios_medicos` (`id_horarios_medicos`, `dia_semana`, `hora_inicio`, `hora_fin`, `medicos_id_medicos`, `estado`) VALUES
(1, 'Lunes', '08:00:00', '12:00:00', 1, 1),
(2, 'Miércoles', '14:00:00', '18:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_medicamentos` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `laboratorio` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id_medicamentos`, `nombre`, `laboratorio`, `stock`, `precio`, `fecha_vencimiento`, `estado`) VALUES
(1, 'Aspirina', 'Bayer', 100, 5000, '2027-01-01', 1),
(2, 'Paracetamol', 'MK', 200, 3000, '2026-12-01', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_medicos` int(11) NOT NULL,
  `usuarios_id_usuarios` int(11) NOT NULL,
  `especialidad` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_medicos`, `usuarios_id_usuarios`, `especialidad`, `estado`) VALUES
(1, 1, 'Cardiología', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones_enviadas`
--

CREATE TABLE `notificaciones_enviadas` (
  `id_notificaciones_enviadas` int(11) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_envio` datetime NOT NULL,
  `pacientes_id_pacientes` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificaciones_enviadas`
--

INSERT INTO `notificaciones_enviadas` (`id_notificaciones_enviadas`, `mensaje`, `fecha_envio`, `pacientes_id_pacientes`, `estado`) VALUES
(1, 'Recuerde su cita mañana a las 9:00 AM', '2026-02-23 16:36:20', 1, 1),
(2, 'Su examen está disponible', '2026-02-23 16:36:20', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id_pacientes` int(11) NOT NULL,
  `documento` varchar(45) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `genero` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `eps` varchar(45) NOT NULL,
  `tipo_ingreso` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_pacientes`, `documento`, `nombre`, `genero`, `telefono`, `email`, `eps`, `tipo_ingreso`, `estado`) VALUES
(1, '1001', 'Juan Pérez', 'Masculino', '3001111111', 'juan@email.com', 'Sura', 'Urgencia', 1),
(2, '1002', 'María Gómez', 'Femenino', '3002222222', 'maria@email.com', 'Sanitas', 'Consulta', 1),
(3, '1003', 'Carlos López', 'Masculino', '3003333333', 'carlos@email.com', 'Nueva EPS', 'Control', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `rol` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `nombre`, `documento`, `telefono`, `contraseña`, `rol`, `estado`) VALUES
(1, 'Dr. Andrés Torres', '2001', '3101111111', '123456', 'MEDICO', 1),
(2, 'Laura Admin', '2002', '3102222222', '123456', 'ADMIN', 1),
(3, 'Pedro Farmacia', '2003', '3103333333', '123456', 'FARMACIA', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_citas`),
  ADD KEY `medicos_id_medicos` (`medicos_id_medicos`),
  ADD KEY `pacientes_id_pacientes` (`pacientes_id_pacientes`),
  ADD KEY `creado_por` (`creado_por`);

--
-- Indices de la tabla `detalle_formulas`
--
ALTER TABLE `detalle_formulas`
  ADD PRIMARY KEY (`id_detalle_formulas`),
  ADD KEY `formula_medicas_id_formula_medicas` (`formula_medicas_id_formula_medicas`),
  ADD KEY `medicamentos_id_medicamentos` (`medicamentos_id_medicamentos`);

--
-- Indices de la tabla `entrega_medicamentos`
--
ALTER TABLE `entrega_medicamentos`
  ADD PRIMARY KEY (`id_entrega_medicamentos`),
  ADD KEY `detalle_formulas_id_detalle_formulas` (`detalle_formulas_id_detalle_formulas`),
  ADD KEY `usuarios_id_usuarios` (`usuarios_id_usuarios`);

--
-- Indices de la tabla `examenes_medicos`
--
ALTER TABLE `examenes_medicos`
  ADD PRIMARY KEY (`id_examenes_medicos`),
  ADD KEY `historias_clinicas_id_historias_clinicas` (`historias_clinicas_id_historias_clinicas`);

--
-- Indices de la tabla `facturacion_citas`
--
ALTER TABLE `facturacion_citas`
  ADD PRIMARY KEY (`id_facturacion_citas`),
  ADD KEY `citas_id_citas` (`citas_id_citas`);

--
-- Indices de la tabla `formula_medicas`
--
ALTER TABLE `formula_medicas`
  ADD PRIMARY KEY (`id_formula_medicas`),
  ADD KEY `historias_clinicas_id_historias_clinicas` (`historias_clinicas_id_historias_clinicas`);

--
-- Indices de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD PRIMARY KEY (`id_historias_clinicas`),
  ADD KEY `citas_id_citas` (`citas_id_citas`);

--
-- Indices de la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  ADD PRIMARY KEY (`id_horarios_medicos`),
  ADD KEY `medicos_id_medicos` (`medicos_id_medicos`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id_medicamentos`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id_medicos`),
  ADD KEY `usuarios_id_usuarios` (`usuarios_id_usuarios`);

--
-- Indices de la tabla `notificaciones_enviadas`
--
ALTER TABLE `notificaciones_enviadas`
  ADD PRIMARY KEY (`id_notificaciones_enviadas`),
  ADD KEY `pacientes_id_pacientes` (`pacientes_id_pacientes`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_pacientes`),
  ADD UNIQUE KEY `documento` (`documento`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD UNIQUE KEY `documento` (`documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_citas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_formulas`
--
ALTER TABLE `detalle_formulas`
  MODIFY `id_detalle_formulas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `entrega_medicamentos`
--
ALTER TABLE `entrega_medicamentos`
  MODIFY `id_entrega_medicamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `examenes_medicos`
--
ALTER TABLE `examenes_medicos`
  MODIFY `id_examenes_medicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `facturacion_citas`
--
ALTER TABLE `facturacion_citas`
  MODIFY `id_facturacion_citas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `formula_medicas`
--
ALTER TABLE `formula_medicas`
  MODIFY `id_formula_medicas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  MODIFY `id_historias_clinicas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  MODIFY `id_horarios_medicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id_medicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `notificaciones_enviadas`
--
ALTER TABLE `notificaciones_enviadas`
  MODIFY `id_notificaciones_enviadas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_pacientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `citas_ibfk_1` FOREIGN KEY (`medicos_id_medicos`) REFERENCES `medicos` (`id_medicos`),
  ADD CONSTRAINT `citas_ibfk_2` FOREIGN KEY (`pacientes_id_pacientes`) REFERENCES `pacientes` (`id_pacientes`),
  ADD CONSTRAINT `citas_ibfk_3` FOREIGN KEY (`creado_por`) REFERENCES `usuarios` (`id_usuarios`);

--
-- Filtros para la tabla `detalle_formulas`
--
ALTER TABLE `detalle_formulas`
  ADD CONSTRAINT `detalle_formulas_ibfk_1` FOREIGN KEY (`formula_medicas_id_formula_medicas`) REFERENCES `formula_medicas` (`id_formula_medicas`),
  ADD CONSTRAINT `detalle_formulas_ibfk_2` FOREIGN KEY (`medicamentos_id_medicamentos`) REFERENCES `medicamentos` (`id_medicamentos`);

--
-- Filtros para la tabla `entrega_medicamentos`
--
ALTER TABLE `entrega_medicamentos`
  ADD CONSTRAINT `entrega_medicamentos_ibfk_1` FOREIGN KEY (`detalle_formulas_id_detalle_formulas`) REFERENCES `detalle_formulas` (`id_detalle_formulas`),
  ADD CONSTRAINT `entrega_medicamentos_ibfk_2` FOREIGN KEY (`usuarios_id_usuarios`) REFERENCES `usuarios` (`id_usuarios`);

--
-- Filtros para la tabla `examenes_medicos`
--
ALTER TABLE `examenes_medicos`
  ADD CONSTRAINT `examenes_medicos_ibfk_1` FOREIGN KEY (`historias_clinicas_id_historias_clinicas`) REFERENCES `historias_clinicas` (`id_historias_clinicas`);

--
-- Filtros para la tabla `facturacion_citas`
--
ALTER TABLE `facturacion_citas`
  ADD CONSTRAINT `facturacion_citas_ibfk_1` FOREIGN KEY (`citas_id_citas`) REFERENCES `citas` (`id_citas`);

--
-- Filtros para la tabla `formula_medicas`
--
ALTER TABLE `formula_medicas`
  ADD CONSTRAINT `formula_medicas_ibfk_1` FOREIGN KEY (`historias_clinicas_id_historias_clinicas`) REFERENCES `historias_clinicas` (`id_historias_clinicas`);

--
-- Filtros para la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD CONSTRAINT `historias_clinicas_ibfk_1` FOREIGN KEY (`citas_id_citas`) REFERENCES `citas` (`id_citas`);

--
-- Filtros para la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  ADD CONSTRAINT `horarios_medicos_ibfk_1` FOREIGN KEY (`medicos_id_medicos`) REFERENCES `medicos` (`id_medicos`);

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`usuarios_id_usuarios`) REFERENCES `usuarios` (`id_usuarios`);

--
-- Filtros para la tabla `notificaciones_enviadas`
--
ALTER TABLE `notificaciones_enviadas`
  ADD CONSTRAINT `notificaciones_enviadas_ibfk_1` FOREIGN KEY (`pacientes_id_pacientes`) REFERENCES `pacientes` (`id_pacientes`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
