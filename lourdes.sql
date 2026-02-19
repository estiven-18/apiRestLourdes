-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2026 a las 02:14:44
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
-- Base de datos: `lourdes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campañas`
--

CREATE TABLE `campañas` (
  `id_campañas` int(11) NOT NULL,
  `titulo` varchar(45) NOT NULL,
  `mensaje` text NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `tipo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `campañas`
--

INSERT INTO `campañas` (`id_campañas`, `titulo`, `mensaje`, `fecha_inicio`, `fecha_fin`, `tipo`) VALUES
(1, 'Campaña Vacunacion', 'Vacuna contra influenza disponible', '2026-03-01', '2026-03-30', 'Promocion');

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
  `observaciones` text NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `medicos_id_medicos` int(11) NOT NULL,
  `pacientes_id_pacientes` int(11) NOT NULL,
  `creado_por` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `citas`
--

INSERT INTO `citas` (`id_citas`, `fecha_cita`, `hora_inicio`, `hora_fin`, `motivo`, `observaciones`, `fecha_creacion`, `medicos_id_medicos`, `pacientes_id_pacientes`, `creado_por`) VALUES
(1, '2026-02-20', '09:00:00', '09:30:00', 'Dolor de cabeza', 'Migraña frecuente', '2026-02-18 19:10:53', 1, 1, 4),
(2, '2026-02-21', '10:00:00', '10:30:00', 'Control pediatrico', 'Revision general', '2026-02-18 19:10:53', 2, 3, 4),
(3, '2026-02-22', '11:00:00', '11:30:00', 'Dolor pecho', 'Posible arritmia', '2026-02-18 19:10:53', 1, 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_formulas`
--

CREATE TABLE `detalle_formulas` (
  `id_detalle_formulas` int(11) NOT NULL,
  `dosis` varchar(100) NOT NULL,
  `frecuencia` varchar(100) NOT NULL,
  `duracion` varchar(100) NOT NULL,
  `instrucciones` text NOT NULL,
  `formula_medicas_id_formula_medicas` int(11) NOT NULL,
  `medicamentos_id_medicamentos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `detalle_formulas`
--

INSERT INTO `detalle_formulas` (`id_detalle_formulas`, `dosis`, `frecuencia`, `duracion`, `instrucciones`, `formula_medicas_id_formula_medicas`, `medicamentos_id_medicamentos`) VALUES
(1, '500mg', 'Cada 8 horas', '5 dias', 'No consumir en ayunas', 1, 1),
(2, '400mg', 'Cada 8 horas', '3 dias', 'Tomar con agua', 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entrega_medicamentos`
--

CREATE TABLE `entrega_medicamentos` (
  `id_entrega_medicamentos` int(11) NOT NULL,
  `cantidad_entregada` int(11) NOT NULL,
  `fecha_entrega` datetime NOT NULL,
  `detalle_formulas_id_detalle_formulas` int(11) NOT NULL,
  `usuarios_id_usuarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `entrega_medicamentos`
--

INSERT INTO `entrega_medicamentos` (`id_entrega_medicamentos`, `cantidad_entregada`, `fecha_entrega`, `detalle_formulas_id_detalle_formulas`, `usuarios_id_usuarios`) VALUES
(1, 10, '2026-02-18 19:10:53', 1, 5),
(2, 6, '2026-02-18 19:10:53', 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examenes_medicos`
--

CREATE TABLE `examenes_medicos` (
  `id_examenes_medicos` int(11) NOT NULL,
  `tipo_examen` varchar(100) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_solicitud` date NOT NULL,
  `historias_clinicas_id_historias_clinicas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion_citas`
--

CREATE TABLE `facturacion_citas` (
  `id_facturacion_citas` int(11) NOT NULL,
  `valor_consulta` int(11) NOT NULL,
  `fecha_pago` date NOT NULL,
  `citas_id_citas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `facturacion_citas`
--

INSERT INTO `facturacion_citas` (`id_facturacion_citas`, `valor_consulta`, `fecha_pago`, `citas_id_citas`) VALUES
(1, 50000, '2026-02-20', 1),
(2, 45000, '2026-02-21', 2),
(3, 60000, '2026-02-22', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formula_medicas`
--

CREATE TABLE `formula_medicas` (
  `id_formula_medicas` int(11) NOT NULL,
  `fecha_emision` datetime NOT NULL,
  `observaciones` text NOT NULL,
  `historias_clinicas_id_historias_clinicas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `formula_medicas`
--

INSERT INTO `formula_medicas` (`id_formula_medicas`, `fecha_emision`, `observaciones`, `historias_clinicas_id_historias_clinicas`) VALUES
(1, '2026-02-18 19:10:53', 'Tomar despues de comida', 1),
(2, '2026-02-18 19:10:53', 'Tomar cada 8 horas', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historias_clinicas`
--

CREATE TABLE `historias_clinicas` (
  `id_historias_clinicas` int(11) NOT NULL,
  `fecha_atencion` date NOT NULL,
  `sintomas` text NOT NULL,
  `observaciones` text NOT NULL,
  `citas_id_citas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `historias_clinicas`
--

INSERT INTO `historias_clinicas` (`id_historias_clinicas`, `fecha_atencion`, `sintomas`, `observaciones`, `citas_id_citas`) VALUES
(1, '2026-02-20', 'Dolor intenso en la frente', 'Se ordenan examenes', 1),
(2, '2026-02-21', 'Paciente estable', 'Sin novedades', 2),
(3, '2026-02-22', 'Dolor toracico', 'Se recomienda ECG', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios_medicos`
--

CREATE TABLE `horarios_medicos` (
  `id_horarios_medicos` int(11) NOT NULL,
  `dia_semana` varchar(45) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `medicos_id_medicos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `horarios_medicos`
--

INSERT INTO `horarios_medicos` (`id_horarios_medicos`, `dia_semana`, `hora_inicio`, `hora_fin`, `medicos_id_medicos`) VALUES
(1, 'Lunes', '08:00:00', '12:00:00', 1),
(2, 'Miercoles', '14:00:00', '18:00:00', 1),
(3, 'Martes', '09:00:00', '13:00:00', 2);

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
  `fecha_vencimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id_medicamentos`, `nombre`, `laboratorio`, `stock`, `precio`, `fecha_vencimiento`) VALUES
(1, 'Acetaminofen 500mg', 'Genfar', 100, 1500, '2027-01-01'),
(2, 'Ibuprofeno 400mg', 'MK', 80, 2000, '2027-06-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id_medicos` int(11) NOT NULL,
  `usuarios_id_usuarios` int(11) NOT NULL,
  `especialidad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id_medicos`, `usuarios_id_usuarios`, `especialidad`) VALUES
(1, 3, ''),
(2, 3, ''),
(3, 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificaciones_enviadas`
--

CREATE TABLE `notificaciones_enviadas` (
  `id_notificaciones_enviadas` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `fecha_envio` date NOT NULL,
  `motivo` text NOT NULL,
  `campañas_id_campañas` int(11) NOT NULL,
  `pacientes_id_pacientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `notificaciones_enviadas`
--

INSERT INTO `notificaciones_enviadas` (`id_notificaciones_enviadas`, `tipo`, `fecha_envio`, `motivo`, `campañas_id_campañas`, `pacientes_id_pacientes`) VALUES
(1, 'Email', '2026-03-01', 'Invitacion campaña', 1, 1),
(2, 'SMS', '2026-03-01', 'Invitacion campaña', 1, 2);

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
  `tipo_ingreso` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id_pacientes`, `documento`, `nombre`, `genero`, `telefono`, `email`, `eps`, `tipo_ingreso`) VALUES
(1, '1001234567', 'María González López', 'Femenino', '555-5678', 'maria.lopez@example.com', 'Sanitas', 'EPS'),
(2, '1009876543', 'Pedro Gomez', 'Masculino', '3028881122', 'pedro@gmail.com', 'Coomeva', 'EPS'),
(3, '1005557777', 'Camila Torres', 'Femenino', '3034442211', 'camila@gmail.com', 'Sanitas', 'Particular'),
(6, '10012345678', 'María González', 'Femenino', '555-1234', 'maria@example.com', 'Sura', 'Consulta externa');

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
  `rol` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `nombre`, `documento`, `telefono`, `contraseña`, `rol`) VALUES
(2, 'Dr. Juan Perez', '2', '3002223344', '123456', 'medico'),
(3, 'Dra. Ana Lopez', '3', '3002223355', '123456', 'medico'),
(4, 'Maria Recepcion', '4', '3003334455', '123456', 'recepcionista'),
(5, 'Carlos Farmacia', '5', '3004445566', '123456', 'farmacia'),
(7, 'Juan Pérez', '6', '555-1234', '123456', 'admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `campañas`
--
ALTER TABLE `campañas`
  ADD PRIMARY KEY (`id_campañas`);

--
-- Indices de la tabla `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id_citas`),
  ADD KEY `fk_citas_medicos1_idx` (`medicos_id_medicos`),
  ADD KEY `fk_citas_pacientes1_idx` (`pacientes_id_pacientes`),
  ADD KEY `fk_citas_usuarios1_idx` (`creado_por`);

--
-- Indices de la tabla `detalle_formulas`
--
ALTER TABLE `detalle_formulas`
  ADD PRIMARY KEY (`id_detalle_formulas`),
  ADD KEY `fk_detalle_formulas_formula_medicas1_idx` (`formula_medicas_id_formula_medicas`),
  ADD KEY `fk_detalle_formulas_medicamentos1_idx` (`medicamentos_id_medicamentos`);

--
-- Indices de la tabla `entrega_medicamentos`
--
ALTER TABLE `entrega_medicamentos`
  ADD PRIMARY KEY (`id_entrega_medicamentos`),
  ADD KEY `fk_entrega_medicamentos_detalle_formulas1_idx` (`detalle_formulas_id_detalle_formulas`),
  ADD KEY `fk_entrega_medicamentos_usuarios1_idx` (`usuarios_id_usuarios`);

--
-- Indices de la tabla `examenes_medicos`
--
ALTER TABLE `examenes_medicos`
  ADD PRIMARY KEY (`id_examenes_medicos`),
  ADD KEY `fk_examenes_medicos_historias_clinicas1_idx` (`historias_clinicas_id_historias_clinicas`);

--
-- Indices de la tabla `facturacion_citas`
--
ALTER TABLE `facturacion_citas`
  ADD PRIMARY KEY (`id_facturacion_citas`),
  ADD KEY `fk_facturacion_citas_citas1_idx` (`citas_id_citas`);

--
-- Indices de la tabla `formula_medicas`
--
ALTER TABLE `formula_medicas`
  ADD PRIMARY KEY (`id_formula_medicas`),
  ADD KEY `fk_formula_medicas_historias_clinicas1_idx` (`historias_clinicas_id_historias_clinicas`);

--
-- Indices de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD PRIMARY KEY (`id_historias_clinicas`),
  ADD KEY `fk_historias_clinicas_citas1_idx` (`citas_id_citas`);

--
-- Indices de la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  ADD PRIMARY KEY (`id_horarios_medicos`),
  ADD KEY `fk_horarios_medicos_medicos1_idx` (`medicos_id_medicos`);

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
  ADD KEY `fk_medicos_usuarios_idx` (`usuarios_id_usuarios`);

--
-- Indices de la tabla `notificaciones_enviadas`
--
ALTER TABLE `notificaciones_enviadas`
  ADD PRIMARY KEY (`id_notificaciones_enviadas`),
  ADD KEY `fk_notificaciones_enviadas_campañas1_idx` (`campañas_id_campañas`),
  ADD KEY `fk_notificaciones_enviadas_pacientes1_idx` (`pacientes_id_pacientes`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_pacientes`),
  ADD UNIQUE KEY `documento_UNIQUE` (`documento`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`),
  ADD UNIQUE KEY `documento_UNIQUE` (`documento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `campañas`
--
ALTER TABLE `campañas`
  MODIFY `id_campañas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `citas`
--
ALTER TABLE `citas`
  MODIFY `id_citas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `detalle_formulas`
--
ALTER TABLE `detalle_formulas`
  MODIFY `id_detalle_formulas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `entrega_medicamentos`
--
ALTER TABLE `entrega_medicamentos`
  MODIFY `id_entrega_medicamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `examenes_medicos`
--
ALTER TABLE `examenes_medicos`
  MODIFY `id_examenes_medicos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `facturacion_citas`
--
ALTER TABLE `facturacion_citas`
  MODIFY `id_facturacion_citas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `formula_medicas`
--
ALTER TABLE `formula_medicas`
  MODIFY `id_formula_medicas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  MODIFY `id_historias_clinicas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  MODIFY `id_horarios_medicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id_medicos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `notificaciones_enviadas`
--
ALTER TABLE `notificaciones_enviadas`
  MODIFY `id_notificaciones_enviadas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_pacientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `fk_citas_medicos1` FOREIGN KEY (`medicos_id_medicos`) REFERENCES `medicos` (`id_medicos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_citas_pacientes1` FOREIGN KEY (`pacientes_id_pacientes`) REFERENCES `pacientes` (`id_pacientes`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_citas_usuarios1` FOREIGN KEY (`creado_por`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_formulas`
--
ALTER TABLE `detalle_formulas`
  ADD CONSTRAINT `fk_detalle_formulas_formula_medicas1` FOREIGN KEY (`formula_medicas_id_formula_medicas`) REFERENCES `formula_medicas` (`id_formula_medicas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detalle_formulas_medicamentos1` FOREIGN KEY (`medicamentos_id_medicamentos`) REFERENCES `medicamentos` (`id_medicamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `entrega_medicamentos`
--
ALTER TABLE `entrega_medicamentos`
  ADD CONSTRAINT `fk_entrega_medicamentos_detalle_formulas1` FOREIGN KEY (`detalle_formulas_id_detalle_formulas`) REFERENCES `detalle_formulas` (`id_detalle_formulas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_entrega_medicamentos_usuarios1` FOREIGN KEY (`usuarios_id_usuarios`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `examenes_medicos`
--
ALTER TABLE `examenes_medicos`
  ADD CONSTRAINT `fk_examenes_medicos_historias_clinicas1` FOREIGN KEY (`historias_clinicas_id_historias_clinicas`) REFERENCES `historias_clinicas` (`id_historias_clinicas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `facturacion_citas`
--
ALTER TABLE `facturacion_citas`
  ADD CONSTRAINT `fk_facturacion_citas_citas1` FOREIGN KEY (`citas_id_citas`) REFERENCES `citas` (`id_citas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `formula_medicas`
--
ALTER TABLE `formula_medicas`
  ADD CONSTRAINT `fk_formula_medicas_historias_clinicas1` FOREIGN KEY (`historias_clinicas_id_historias_clinicas`) REFERENCES `historias_clinicas` (`id_historias_clinicas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `historias_clinicas`
--
ALTER TABLE `historias_clinicas`
  ADD CONSTRAINT `fk_historias_clinicas_citas1` FOREIGN KEY (`citas_id_citas`) REFERENCES `citas` (`id_citas`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `horarios_medicos`
--
ALTER TABLE `horarios_medicos`
  ADD CONSTRAINT `fk_horarios_medicos_medicos1` FOREIGN KEY (`medicos_id_medicos`) REFERENCES `medicos` (`id_medicos`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `fk_medicos_usuarios` FOREIGN KEY (`usuarios_id_usuarios`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `notificaciones_enviadas`
--
ALTER TABLE `notificaciones_enviadas`
  ADD CONSTRAINT `fk_notificaciones_enviadas_campañas1` FOREIGN KEY (`campañas_id_campañas`) REFERENCES `campañas` (`id_campañas`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_notificaciones_enviadas_pacientes1` FOREIGN KEY (`pacientes_id_pacientes`) REFERENCES `pacientes` (`id_pacientes`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
