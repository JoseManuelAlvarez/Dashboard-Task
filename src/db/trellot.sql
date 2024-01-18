-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-01-2024 a las 16:48:58
-- Versión del servidor: 5.6.20
-- Versión de PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `trellot`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `board`
--

CREATE TABLE IF NOT EXISTS `board` (
  `idBoar` int(11) NOT NULL,
  `idUserBoar` int(11) NOT NULL,
  `titleBoar` varchar(100) NOT NULL,
  `descriptionBoar` varchar(500) NOT NULL,
  `statusBoar` int(11) NOT NULL,
  `backgroundBoar` varchar(80) NOT NULL,
  `backgroundColoBoar` varchar(30) NOT NULL,
  `createdAtBoar` date NOT NULL,
  `updatedAtBoar` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `board`
--

INSERT INTO `board` (`idBoar`, `idUserBoar`, `titleBoar`, `descriptionBoar`, `statusBoar`, `backgroundBoar`, `backgroundColoBoar`, `createdAtBoar`, `updatedAtBoar`) VALUES
(1, 1, 'Prueba', 'Esto es uno de prueba', 1, '', '', '2023-10-24', '2023-10-24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colaboradores`
--

CREATE TABLE IF NOT EXISTS `colaboradores` (
  `idCola` int(11) NOT NULL,
  `idBoarCola` int(11) NOT NULL,
  `idUserCola` int(11) NOT NULL,
  `statusCola` int(11) NOT NULL,
  `createdAtCola` date NOT NULL,
  `updatedAtCola` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE IF NOT EXISTS `color` (
`idColo` int(11) NOT NULL,
  `colorHex` varchar(15) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `color`
--

INSERT INTO `color` (`idColo`, `colorHex`) VALUES
(1, 'FF8A65'),
(2, '3b8aff'),
(3, 'FFCA28'),
(4, 'f57a00'),
(5, '59e409'),
(6, 'e40909');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `column`
--

CREATE TABLE IF NOT EXISTS `column` (
  `idColu` int(11) NOT NULL,
  `idBoarColu` int(11) NOT NULL,
  `titleColu` varchar(50) NOT NULL,
  `sortColu` int(11) NOT NULL,
  `statusColu` int(11) NOT NULL,
  `createdAtColu` date NOT NULL,
  `updatedAtColu` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `column`
--

INSERT INTO `column` (`idColu`, `idBoarColu`, `titleColu`, `sortColu`, `statusColu`, `createdAtColu`, `updatedAtColu`) VALUES
(1, 1, 'Pendientes', 1, 1, '2023-10-27', '2023-10-27'),
(2, 1, 'Desarollo', 2, 1, '2023-10-27', '2023-10-27'),
(3, 1, 'testeo', 3, 1, '2023-11-06', '2023-11-06'),
(4, 1, 'Terminado', 4, 1, '2023-11-08', '2023-11-08'),
(5, 1, 'aaaaaaa', 5, 1, '2023-11-11', '2023-11-11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detlist`
--

CREATE TABLE IF NOT EXISTS `detlist` (
  `idDLis` int(11) NOT NULL,
  `idListDLis` int(11) NOT NULL,
  `titleDLis` varchar(50) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `detlist`
--

INSERT INTO `detlist` (`idDLis`, `idListDLis`, `titleDLis`, `status`) VALUES
(1, 1, 'aaaaaaaaaaaaaaaaaa', 1),
(2, 1, 'bbbbbbbbbb', 1),
(3, 1, 'cccccccccccc', 1),
(4, 1, 'dddddddddddddddddddddddd', 0),
(5, 1, 'NUEVA', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `label`
--

CREATE TABLE IF NOT EXISTS `label` (
  `idLabe` int(11) NOT NULL,
  `titleLabe` varchar(60) NOT NULL,
  `idColoLabe` int(11) NOT NULL,
  `statusLabe` int(11) NOT NULL,
  `idBoard` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `label`
--

INSERT INTO `label` (`idLabe`, `titleLabe`, `idColoLabe`, `statusLabe`, `idBoard`) VALUES
(1, 'Sin Asignacion', 1, 1, 1),
(2, 'Pendiente', 2, 1, 1),
(3, 'Proceso', 3, 1, 1),
(4, 'Pruebas', 4, 1, 1),
(5, 'Error', 5, 1, 1),
(6, 'Terminado', 6, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `list`
--

CREATE TABLE IF NOT EXISTS `list` (
  `idList` int(11) NOT NULL,
  `idTaskList` int(11) NOT NULL,
  `titleList` varchar(60) NOT NULL,
  `porcentaje` decimal(11,2) NOT NULL,
  `completado` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `list`
--

INSERT INTO `list` (`idList`, `idTaskList`, `titleList`, `porcentaje`, `completado`) VALUES
(1, 2, 'Checklist', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programacion`
--

CREATE TABLE IF NOT EXISTS `programacion` (
  `secno` int(11) NOT NULL,
  `idUsua` int(11) NOT NULL,
  `codcuenta` int(11) NOT NULL,
  `importe` float NOT NULL,
  `fecha` date NOT NULL,
  `concepto` varchar(80) NOT NULL,
  `numPago` int(11) NOT NULL,
  `pagAct` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task`
--

CREATE TABLE IF NOT EXISTS `task` (
  `idTask` int(11) NOT NULL,
  `idColuTask` int(11) NOT NULL,
  `idBoarTask` int(11) NOT NULL,
  `titleTask` varchar(60) NOT NULL,
  `descriotionTask` varchar(120) NOT NULL,
  `idCreadorTask` int(11) NOT NULL,
  `idAsigandoTask` int(11) NOT NULL,
  `orderTask` int(11) NOT NULL,
  `createdAtTask` date NOT NULL,
  `updatedAtTask` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `task`
--

INSERT INTO `task` (`idTask`, `idColuTask`, `idBoarTask`, `titleTask`, `descriotionTask`, `idCreadorTask`, `idAsigandoTask`, `orderTask`, `createdAtTask`, `updatedAtTask`) VALUES
(1, 2, 1, 'Esta es una tarea de prueba', 'Esto es una prueba de verificacion', 1, 1, 2, '2023-10-27', '2023-10-27'),
(2, 3, 1, 'Prueba420', 'Esto es una prueba de descripcion\ncotinua programando esto \n1.-Esto es uno. \n2.-Esto es dos.\n3..prueba nueva', 1, 1, 5, '2023-10-27', '2023-10-27'),
(3, 3, 1, 'dddddddddd', ' ', 1, 1, 3, '2023-10-27', '2023-10-27'),
(4, 3, 1, 'aaaabbbb', ' ', 1, 1, 1, '2023-10-27', '2023-10-27'),
(5, 3, 1, '11111111', ' ', 1, 1, 2, '2023-10-27', '2023-10-27'),
(6, 3, 1, 'probando Uno', ' ', 1, 1, 6, '2023-10-27', '2023-10-27'),
(7, 1, 1, 'terminado', ' ', 1, 1, 1, '2023-10-27', '2023-10-27'),
(8, 5, 1, 'aaaaadasdjusdjkfsd', ' ', 1, 1, 1, '2023-10-27', '2023-10-27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `idUser` int(11) NOT NULL,
  `nameUser` varchar(60) NOT NULL,
  `emailUser` varchar(60) NOT NULL,
  `passwordUser` varchar(30) NOT NULL,
  `statusUser` int(11) NOT NULL,
  `tokenUser` varchar(45) NOT NULL,
  `createdAtUser` date NOT NULL,
  `updatedAtUser` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idUser`, `nameUser`, `emailUser`, `passwordUser`, `statusUser`, `tokenUser`, `createdAtUser`, `updatedAtUser`) VALUES
(1, 'mane', '1@1.1', '1', 1, 'sadsagfgv5a1df5g5fadsd', '2023-10-23', '2023-10-23');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `board`
--
ALTER TABLE `board`
 ADD PRIMARY KEY (`idBoar`);

--
-- Indices de la tabla `colaboradores`
--
ALTER TABLE `colaboradores`
 ADD PRIMARY KEY (`idCola`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
 ADD PRIMARY KEY (`idColo`);

--
-- Indices de la tabla `column`
--
ALTER TABLE `column`
 ADD PRIMARY KEY (`idColu`);

--
-- Indices de la tabla `detlist`
--
ALTER TABLE `detlist`
 ADD PRIMARY KEY (`idDLis`);

--
-- Indices de la tabla `label`
--
ALTER TABLE `label`
 ADD PRIMARY KEY (`idLabe`);

--
-- Indices de la tabla `list`
--
ALTER TABLE `list`
 ADD PRIMARY KEY (`idList`);

--
-- Indices de la tabla `task`
--
ALTER TABLE `task`
 ADD PRIMARY KEY (`idTask`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`nameUser`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
MODIFY `idColo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
