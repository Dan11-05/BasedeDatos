-- --------------------------------------------------------
-- Host:                         187.188.213.206
-- Versión del servidor:         10.6.16-MariaDB-0ubuntu0.22.04.1 - Ubuntu 22.04
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para cicebv
CREATE DATABASE IF NOT EXISTS `cicebv` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `cicebv`;

-- Volcando estructura para tabla cicebv.accion
CREATE TABLE IF NOT EXISTS `accion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folio` varchar(50) DEFAULT NULL,
  `folder` varchar(50) DEFAULT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `ubicacion_creacion` varchar(50) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `localidad` varchar(50) NOT NULL,
  `contenido` text DEFAULT NULL,
  `planteamiento_problema` text DEFAULT NULL,
  `particularidades_lugar` text DEFAULT NULL,
  `metodologia` text DEFAULT NULL,
  `estrategia_intervencion` text DEFAULT NULL,
  `consideraciones_finales` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folio` (`folio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.accion: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.accion_persona
CREATE TABLE IF NOT EXISTS `accion_persona` (
  `id_accion` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  PRIMARY KEY (`id_accion`,`id_persona`),
  KEY `fk_accion_persona_persona1_idx` (`id_persona`),
  KEY `id_accion` (`id_accion`),
  CONSTRAINT `accion_persona_ibfk_1` FOREIGN KEY (`id_accion`) REFERENCES `accion` (`id`),
  CONSTRAINT `fk_accion_persona_persona1` FOREIGN KEY (`id_persona`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.accion_persona: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.anexos
CREATE TABLE IF NOT EXISTS `anexos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `imagen` blob DEFAULT NULL,
  `etiquetas` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.anexos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.archivo
CREATE TABLE IF NOT EXISTS `archivo` (
  `id` int(11) NOT NULL,
  `id_hallazgo` int(11) NOT NULL,
  `ruta_archivo` varchar(255) NOT NULL,
  `descripcion_archivo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_hallazgo` (`id_hallazgo`),
  CONSTRAINT `archivo_ibfk_1` FOREIGN KEY (`id_hallazgo`) REFERENCES `hallazgo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.archivo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.area
CREATE TABLE IF NOT EXISTS `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombrearea` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.area: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.autoridad
CREATE TABLE IF NOT EXISTS `autoridad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `representante` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.autoridad: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.bitacoras
CREATE TABLE IF NOT EXISTS `bitacoras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_busqueda` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `contenido` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_busqueda` (`id_busqueda`),
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_busqueda`) REFERENCES `busquedas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.bitacoras: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.bitacora_imagen
CREATE TABLE IF NOT EXISTS `bitacora_imagen` (
  `bitacora_id` int(11) NOT NULL,
  `imagen_id` bigint(20) NOT NULL,
  PRIMARY KEY (`bitacora_id`,`imagen_id`),
  KEY `fk_bitacora_imagen_imagens1_idx` (`imagen_id`),
  CONSTRAINT `fk_bitacora_imagen_bitacoras1` FOREIGN KEY (`bitacora_id`) REFERENCES `bitacoras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bitacora_imagen_imagens1` FOREIGN KEY (`imagen_id`) REFERENCES `imagens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.bitacora_imagen: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.bitacora_particularidad
CREATE TABLE IF NOT EXISTS `bitacora_particularidad` (
  `bitacora_id` int(11) NOT NULL,
  `particularidad_id` bigint(20) NOT NULL,
  PRIMARY KEY (`bitacora_id`,`particularidad_id`),
  KEY `fk_bitacora_particularidad_particularidads1_idx` (`particularidad_id`),
  CONSTRAINT `fk_bitacora_particularidad_bitacoras1` FOREIGN KEY (`bitacora_id`) REFERENCES `bitacoras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bitacora_particularidad_particularidads1` FOREIGN KEY (`particularidad_id`) REFERENCES `particularidads` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.bitacora_particularidad: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.bitacora_plan
CREATE TABLE IF NOT EXISTS `bitacora_plan` (
  `bitacora_id` int(11) NOT NULL,
  `plan_id` bigint(20) NOT NULL,
  PRIMARY KEY (`bitacora_id`,`plan_id`),
  KEY `fk_bitacora_plan_plans1_idx` (`plan_id`),
  CONSTRAINT `fk_bitacora_plan_bitacoras1` FOREIGN KEY (`bitacora_id`) REFERENCES `bitacoras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_bitacora_plan_plans1` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.bitacora_plan: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.blog
CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `fichadebusqueda_id` int(11) NOT NULL,
  `fecha` varchar(45) DEFAULT NULL,
  `hora` varchar(45) DEFAULT NULL,
  `texto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`usuario_id`,`fichadebusqueda_id`) USING BTREE,
  KEY `fk_blog_fichadebusqueda2_idx` (`fichadebusqueda_id`) USING BTREE,
  KEY `fk_blog_usuario1_idx` (`usuario_id`) USING BTREE,
  CONSTRAINT `fk_blog_fichadebusqueda2` FOREIGN KEY (`fichadebusqueda_id`) REFERENCES `fichadebusqueda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_blog_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.blog: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.boletinbusqueda
CREATE TABLE IF NOT EXISTS `boletinbusqueda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idnofolio` int(11) DEFAULT NULL,
  `idpersona` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idnofolio` (`idnofolio`),
  KEY `idpersona` (`idpersona`),
  CONSTRAINT `FK_boletinbusqueda_nofolio` FOREIGN KEY (`idnofolio`) REFERENCES `nofolio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_boletinbusqueda_personas` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.boletinbusqueda: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.busquedas
CREATE TABLE IF NOT EXISTS `busquedas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_accion` int(11) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT current_timestamp(),
  `ubicacion_creacion` varchar(50) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `fecha_inicial` date DEFAULT NULL,
  `fecha_final` date DEFAULT NULL,
  `extension_metros` float DEFAULT NULL,
  `coordenada_X` varchar(50) DEFAULT NULL,
  `coordenada_Y` varchar(50) DEFAULT NULL,
  `fase_id` bigint(20) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`,`fase_id`,`categoria_id`),
  KEY `id_accion` (`id_accion`),
  KEY `fk_busquedas_fases1_idx` (`fase_id`),
  KEY `fk_busquedas_categorias_busqueda1_idx` (`categoria_id`),
  CONSTRAINT `busqueda_ibfk_1` FOREIGN KEY (`id_accion`) REFERENCES `accion` (`id`),
  CONSTRAINT `fk_busquedas_categorias_busqueda1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias_busqueda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_busquedas_fases1` FOREIGN KEY (`fase_id`) REFERENCES `fases` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.busquedas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.busqueda_autoridad
CREATE TABLE IF NOT EXISTS `busqueda_autoridad` (
  `id_busqueda` int(11) NOT NULL,
  `id_autoridad` int(11) NOT NULL,
  PRIMARY KEY (`id_busqueda`,`id_autoridad`),
  KEY `id_autoridad` (`id_autoridad`),
  CONSTRAINT `busqueda_autoridad_ibfk_1` FOREIGN KEY (`id_busqueda`) REFERENCES `busquedas` (`id`),
  CONSTRAINT `busqueda_autoridad_ibfk_2` FOREIGN KEY (`id_autoridad`) REFERENCES `autoridad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.busqueda_autoridad: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.busqueda_celula
CREATE TABLE IF NOT EXISTS `busqueda_celula` (
  `id_busqueda` int(11) NOT NULL,
  `id_celula` int(11) NOT NULL,
  PRIMARY KEY (`id_busqueda`,`id_celula`),
  KEY `fk_busqueda_celula_celula1_idx` (`id_celula`),
  CONSTRAINT `busqueda_celula_ibfk_1` FOREIGN KEY (`id_busqueda`) REFERENCES `busquedas` (`id`),
  CONSTRAINT `fk_busqueda_celula_celula1` FOREIGN KEY (`id_celula`) REFERENCES `celula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.busqueda_celula: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.busqueda_colectivo
CREATE TABLE IF NOT EXISTS `busqueda_colectivo` (
  `id_busqueda` int(11) NOT NULL,
  `id_colectivo` int(11) NOT NULL,
  PRIMARY KEY (`id_busqueda`,`id_colectivo`),
  KEY `id_colectivo` (`id_colectivo`),
  CONSTRAINT `busqueda_colectivo_ibfk_1` FOREIGN KEY (`id_busqueda`) REFERENCES `busquedas` (`id`),
  CONSTRAINT `busqueda_colectivo_ibfk_2` FOREIGN KEY (`id_colectivo`) REFERENCES `colectivo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.busqueda_colectivo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.busqueda_grupo
CREATE TABLE IF NOT EXISTS `busqueda_grupo` (
  `busqueda_id` int(11) NOT NULL,
  `grupo_id` bigint(20) NOT NULL,
  PRIMARY KEY (`busqueda_id`,`grupo_id`),
  KEY `fk_busqueda_grupo_grupos1_idx` (`grupo_id`),
  CONSTRAINT `fk_busqueda_grupo_busquedas1` FOREIGN KEY (`busqueda_id`) REFERENCES `busquedas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_busqueda_grupo_grupos1` FOREIGN KEY (`grupo_id`) REFERENCES `grupos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.busqueda_grupo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.busqueda_imagen
CREATE TABLE IF NOT EXISTS `busqueda_imagen` (
  `busqueda_id` int(11) NOT NULL,
  `imagen_id` bigint(20) NOT NULL,
  PRIMARY KEY (`busqueda_id`,`imagen_id`),
  KEY `fk_busqueda_imagen_imagens1_idx` (`imagen_id`),
  CONSTRAINT `fk_busqueda_imagen_busquedas1` FOREIGN KEY (`busqueda_id`) REFERENCES `busquedas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_busqueda_imagen_imagens1` FOREIGN KEY (`imagen_id`) REFERENCES `imagens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.busqueda_imagen: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.busqueda_persona
CREATE TABLE IF NOT EXISTS `busqueda_persona` (
  `busqueda_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`busqueda_id`,`persona_id`),
  KEY `fk_busqueda_persona_personas1_idx` (`persona_id`),
  CONSTRAINT `fk_busqueda_persona_busquedas1` FOREIGN KEY (`busqueda_id`) REFERENCES `busquedas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_busqueda_persona_personas1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.busqueda_persona: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.caracteristicasfisicas
CREATE TABLE IF NOT EXISTS `caracteristicasfisicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.caracteristicasfisicas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.catalogodeobjetos
CREATE TABLE IF NOT EXISTS `catalogodeobjetos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objeto` varchar(45) DEFAULT NULL,
  `idtipodeobjeto` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_catalogodeobjetos_tipodeobjeto1_idx` (`idtipodeobjeto`) USING BTREE,
  CONSTRAINT `fk_catalogodeobjetos_tipodeobjeto1` FOREIGN KEY (`idtipodeobjeto`) REFERENCES `tipodeobjeto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.catalogodeobjetos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_indicio` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_indicio` (`id_indicio`),
  CONSTRAINT `categoria_ibfk_1` FOREIGN KEY (`id_indicio`) REFERENCES `indicio` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.categorias: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.categorias_busqueda
CREATE TABLE IF NOT EXISTS `categorias_busqueda` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.categorias_busqueda: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.celula
CREATE TABLE IF NOT EXISTS `celula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `representante` varchar(45) DEFAULT NULL,
  `idempleado` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_celula_empleado1_idx` (`idempleado`) USING BTREE,
  CONSTRAINT `fk_celula_empleado1` FOREIGN KEY (`idempleado`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.celula: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.codigo_postal
CREATE TABLE IF NOT EXISTS `codigo_postal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` int(11) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.codigo_postal: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.colectivo
CREATE TABLE IF NOT EXISTS `colectivo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `representante` varchar(100) NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.colectivo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.colectivo_integrantes
CREATE TABLE IF NOT EXISTS `colectivo_integrantes` (
  `id` int(11) NOT NULL,
  `razon` varchar(45) DEFAULT NULL,
  `colectivo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`colectivo_id`) USING BTREE,
  KEY `fk_colectivo_integrantes_colectivo1_idx` (`colectivo_id`),
  CONSTRAINT `fk_colectivo_integrantes_colectivo1` FOREIGN KEY (`colectivo_id`) REFERENCES `colectivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='		\\n';

-- Volcando datos para la tabla cicebv.colectivo_integrantes: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.colonia
CREATE TABLE IF NOT EXISTS `colonia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.colonia: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.colonia_cp
CREATE TABLE IF NOT EXISTS `colonia_cp` (
  `colonia_id` int(11) NOT NULL,
  `codigopostal_id` int(11) NOT NULL,
  PRIMARY KEY (`colonia_id`,`codigopostal_id`) USING BTREE,
  KEY `fk_colonia_has_codigo_postal_colonia1_idx` (`colonia_id`),
  KEY `fk_colonia_has_codigo_postal_codigo_postal1_idx` (`codigopostal_id`) USING BTREE,
  CONSTRAINT `fk_colonia_has_codigo_postal_codigo_postal1` FOREIGN KEY (`codigopostal_id`) REFERENCES `codigo_postal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_colonia_has_codigo_postal_colonia1` FOREIGN KEY (`colonia_id`) REFERENCES `colonia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.colonia_cp: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.constaciahechos
CREATE TABLE IF NOT EXISTS `constaciahechos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.constaciahechos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.coordenadas
CREATE TABLE IF NOT EXISTS `coordenadas` (
  `id` int(11) NOT NULL,
  `extension` float DEFAULT NULL,
  `coordenadas_x` varchar(45) DEFAULT NULL,
  `coordenadas_y` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.coordenadas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.departamento: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.departamento_area
CREATE TABLE IF NOT EXISTS `departamento_area` (
  `iddepartamento` int(11) NOT NULL,
  `idarea` int(11) NOT NULL,
  PRIMARY KEY (`iddepartamento`,`idarea`) USING BTREE,
  KEY `fk_Departamento_has_area_area1_idx` (`idarea`) USING BTREE,
  KEY `fk_Departamento_has_area_Departamento1_idx` (`iddepartamento`) USING BTREE,
  CONSTRAINT `fk_Departamento_has_area_Departamento1` FOREIGN KEY (`iddepartamento`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Departamento_has_area_area1` FOREIGN KEY (`idarea`) REFERENCES `area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.departamento_area: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.desaparicionforzada
CREATE TABLE IF NOT EXISTS `desaparicionforzada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.desaparicionforzada: ~7 rows (aproximadamente)
INSERT INTO `desaparicionforzada` (`id`, `nombre`, `prioridad`) VALUES
	(1, 'Gendarmería Nacional', NULL),
	(2, 'Ejército Mexicano', NULL),
	(3, 'Marina Armada de México', NULL),
	(4, 'Policía Naval', NULL),
	(5, 'Policía Militar', NULL),
	(6, 'Policía Federal/Guardia Nacional', NULL),
	(7, 'Policía Ministerial PGR/FGR', NULL);

-- Volcando estructura para tabla cicebv.desaparicionparticulares
CREATE TABLE IF NOT EXISTS `desaparicionparticulares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.desaparicionparticulares: ~7 rows (aproximadamente)
INSERT INTO `desaparicionparticulares` (`id`, `nombre`, `prioridad`) VALUES
	(8, 'Una amistad', NULL),
	(9, 'Un conocido', NULL),
	(10, 'Pareja sentimental', NULL),
	(11, 'Un familiar', NULL),
	(12, 'Uno o varios integrantes de la delincuencia organizada', NULL),
	(13, 'Desconocido', NULL),
	(14, 'Otros', NULL);

-- Volcando estructura para tabla cicebv.discapacidad
CREATE TABLE IF NOT EXISTS `discapacidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombretipo` varchar(45) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.discapacidad: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.domicilio
CREATE TABLE IF NOT EXISTS `domicilio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calle` varchar(45) DEFAULT NULL,
  `numeroex` varchar(45) DEFAULT NULL,
  `numeroin` varchar(45) DEFAULT NULL,
  `referencia` mediumtext DEFAULT NULL,
  `tramocarretera` varchar(45) DEFAULT NULL,
  `entrecalle1` varchar(45) DEFAULT NULL,
  `entrecalle2` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.domicilio: ~5 rows (aproximadamente)
INSERT INTO `domicilio` (`id`, `calle`, `numeroex`, `numeroin`, `referencia`, `tramocarretera`, `entrecalle1`, `entrecalle2`) VALUES
	(7, 'Calle 123', '123', '456', 'Referencia 123', 'Tramo 123', 'Calle A', 'Calle B'),
	(8, 'Calle 123', '123', '456', 'Referencia 123', 'Tramo 123', 'Calle A', 'Calle B'),
	(9, 'Calle 123', '123', '456', 'Referencia 123', 'Tramo 123', 'Calle A', 'Calle B'),
	(10, 'Calle 456', '789', NULL, NULL, NULL, NULL, NULL),
	(11, 'Calle ABC', '123', NULL, 'Referencia DEF', NULL, NULL, NULL);

-- Volcando estructura para tabla cicebv.empleado
CREATE TABLE IF NOT EXISTS `empleado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidopaterno` varchar(45) DEFAULT NULL,
  `apellidomaterno` varchar(45) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`id`,`idusuario`) USING BTREE,
  KEY `fk_empleado_usuario1_idx` (`idusuario`) USING BTREE,
  CONSTRAINT `fk_empleado_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.empleado: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.escolaridad
CREATE TABLE IF NOT EXISTS `escolaridad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` varchar(50) NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.escolaridad: ~10 rows (aproximadamente)
INSERT INTO `escolaridad` (`id`, `nivel`, `prioridad`) VALUES
	(6, 'Sin escolaridad', NULL),
	(7, 'Preescolar', NULL),
	(8, 'Primaria', NULL),
	(9, 'Secundaria', NULL),
	(10, 'Bachillerato', NULL),
	(11, 'Técnico', NULL),
	(12, 'Profesional técnico', NULL),
	(13, 'Licenciatura', NULL),
	(14, 'Maestría', NULL),
	(15, 'Doctorado', NULL);

-- Volcando estructura para tabla cicebv.estadisticas
CREATE TABLE IF NOT EXISTS `estadisticas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contbusquedasconindicio` int(11) DEFAULT NULL,
  `contbusquedassinindicio` int(11) DEFAULT NULL,
  `numindicio` int(11) DEFAULT NULL,
  `diasempleados` int(11) DEFAULT NULL,
  `contBusquedasgeneralizadas` int(11) DEFAULT NULL,
  `contBusquedaIndivi` int(11) DEFAULT NULL,
  `barrancas` int(11) DEFAULT NULL,
  `caverna` int(11) DEFAULT NULL,
  `cuerposagua` int(11) DEFAULT NULL,
  `fosa` int(11) DEFAULT NULL,
  `pozooducto` int(11) DEFAULT NULL,
  `superficie` int(11) DEFAULT NULL,
  `busquedamasculino` int(11) DEFAULT NULL,
  `busquedafemenino` int(11) DEFAULT NULL,
  `busquedasintendencia` int(11) DEFAULT NULL,
  `acciondebusquedacebv` int(11) DEFAULT NULL,
  `acompañaminetoFGE` int(11) DEFAULT NULL,
  `acompañamientoFGR` int(11) DEFAULT NULL,
  `acompañamientoCNB` int(11) DEFAULT NULL,
  `acompañamientoCLB` int(11) DEFAULT NULL,
  `colectivo` int(11) DEFAULT NULL,
  `familiaresvictima` int(11) DEFAULT NULL,
  `mecanismoestatal` int(11) DEFAULT NULL,
  `sinacompañamiento` int(11) DEFAULT NULL,
  `acompañamientoBrigadanacional` int(11) DEFAULT NULL,
  `busquedasaasistioCNB` int(11) DEFAULT NULL,
  `busquedaasistioFiscalia` int(11) DEFAULT NULL,
  `accionbusqueda` int(11) DEFAULT NULL,
  `accionbusquedadocumentacion` int(11) DEFAULT NULL,
  `documentacionproceso` int(11) DEFAULT NULL,
  `camarapozo` int(11) DEFAULT NULL,
  `droneacuatico` int(11) DEFAULT NULL,
  `dronegpr` int(11) DEFAULT NULL,
  `dronelidar` int(11) DEFAULT NULL,
  `dronefotografia` int(11) DEFAULT NULL,
  `faro` int(11) DEFAULT NULL,
  `georradar` int(11) DEFAULT NULL,
  `equipovertical` int(11) DEFAULT NULL,
  `resistivimetro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.estadisticas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.estados
CREATE TABLE IF NOT EXISTS `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `codigo` varchar(45) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.estados: ~32 rows (aproximadamente)
INSERT INTO `estados` (`id`, `nombre`, `codigo`, `prioridad`) VALUES
	(1, 'Aguascalientes', NULL, NULL),
	(2, 'Baja California', NULL, NULL),
	(3, 'Baja California Sur', NULL, NULL),
	(4, 'Campeche', NULL, NULL),
	(5, 'Chiapas', NULL, NULL),
	(6, 'Chihuahua', NULL, NULL),
	(7, 'Coahuila', NULL, NULL),
	(8, 'Colima', NULL, NULL),
	(9, 'Distrito Federal', NULL, NULL),
	(10, 'Durango', NULL, NULL),
	(11, 'Guanajuato', NULL, NULL),
	(12, 'Guerrero', NULL, NULL),
	(13, 'Hidalgo', NULL, NULL),
	(14, 'Jalisco', NULL, NULL),
	(15, 'México', NULL, NULL),
	(16, 'Michoacán', NULL, NULL),
	(17, 'Morelos', NULL, NULL),
	(18, 'Nayarit', NULL, NULL),
	(19, 'Nuevo León', NULL, NULL),
	(20, 'Oaxaca', NULL, NULL),
	(21, 'Puebla', NULL, NULL),
	(22, 'Querétaro', NULL, NULL),
	(23, 'Quintana Roo', NULL, NULL),
	(24, 'San Luis Potosí', NULL, NULL),
	(25, 'Sinaloa', NULL, NULL),
	(26, 'Sonora', NULL, NULL),
	(27, 'Tabasco', NULL, NULL),
	(28, 'Tamaulipas', NULL, NULL),
	(29, 'Tlaxcala', NULL, NULL),
	(30, 'Veracruz Ignacio de la llave', NULL, NULL),
	(31, 'Yucatán', NULL, NULL),
	(32, 'Zacatecas', NULL, NULL);

-- Volcando estructura para tabla cicebv.estados_pais
CREATE TABLE IF NOT EXISTS `estados_pais` (
  `estados_id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  PRIMARY KEY (`estados_id`,`pais_id`),
  KEY `fk_estados_has_pais_pais1_idx` (`pais_id`),
  KEY `fk_estados_has_pais_estados1_idx` (`estados_id`),
  CONSTRAINT `fk_estados_has_pais_estados1` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estados_has_pais_pais1` FOREIGN KEY (`pais_id`) REFERENCES `pais` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.estados_pais: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.estado_civil
CREATE TABLE IF NOT EXISTS `estado_civil` (
  `id` int(11) NOT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.estado_civil: ~9 rows (aproximadamente)
INSERT INTO `estado_civil` (`id`, `estado`, `prioridad`) VALUES
	(1, 'Casada', NULL),
	(2, 'Casado', NULL),
	(3, 'Concubinato', NULL),
	(4, 'No Especifica', NULL),
	(5, 'Pendiente', NULL),
	(6, 'Soltera', NULL),
	(7, 'Soltero', NULL),
	(8, 'Union Libre', NULL),
	(9, 'Viuda', NULL);

-- Volcando estructura para tabla cicebv.expediente
CREATE TABLE IF NOT EXISTS `expediente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valorexpediente` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.expediente: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.expediente_boletin
CREATE TABLE IF NOT EXISTS `expediente_boletin` (
  `idexpediente` int(11) NOT NULL,
  `idboletinbusqueda` int(11) NOT NULL,
  `idstatus` int(11) NOT NULL,
  `idconstaciahechos` int(11) NOT NULL,
  `idnofolio` int(11) NOT NULL,
  `idfichadebusqueda` int(11) NOT NULL,
  PRIMARY KEY (`idexpediente`,`idboletinbusqueda`,`idstatus`,`idconstaciahechos`,`idnofolio`,`idfichadebusqueda`) USING BTREE,
  KEY `fk_expediente_has_boletinbusqueda_expediente1_idx` (`idexpediente`) USING BTREE,
  KEY `fk_expediente_has_boletinbusqueda_boletinbusqueda1_idx` (`idboletinbusqueda`) USING BTREE,
  KEY `fk_expediente_has_boletinbusqueda_status1_idx` (`idstatus`) USING BTREE,
  KEY `fk_expediente_has_boletinbusqueda_constaciahechos1_idx` (`idconstaciahechos`) USING BTREE,
  KEY `fk_expediente_has_boletinbusqueda_nofolio1_idx` (`idnofolio`) USING BTREE,
  KEY `fk_expediente_has_boletinbusqueda_fichadebusqueda1_idx` (`idfichadebusqueda`) USING BTREE,
  CONSTRAINT `FK_expediente_boletin_boletinbusqueda` FOREIGN KEY (`idboletinbusqueda`) REFERENCES `boletinbusqueda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_expediente_boletin_constaciahechos` FOREIGN KEY (`idconstaciahechos`) REFERENCES `constaciahechos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_expediente_boletin_expediente` FOREIGN KEY (`idexpediente`) REFERENCES `expediente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_expediente_boletin_fichadebusqueda` FOREIGN KEY (`idfichadebusqueda`) REFERENCES `fichadebusqueda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_expediente_boletin_nofolio` FOREIGN KEY (`idnofolio`) REFERENCES `nofolio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_expediente_boletin_status` FOREIGN KEY (`idstatus`) REFERENCES `status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.expediente_boletin: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.fases
CREATE TABLE IF NOT EXISTS `fases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.fases: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.fenomenocadaverico
CREATE TABLE IF NOT EXISTS `fenomenocadaverico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.fenomenocadaverico: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.fichadebusqueda
CREATE TABLE IF NOT EXISTS `fichadebusqueda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  `fecha_generacion` date DEFAULT NULL,
  `fecha_desaparicion` date DEFAULT NULL,
  `fecha_percato` date DEFAULT NULL,
  `idcelula` int(11) NOT NULL,
  `idtipodereporte` int(11) NOT NULL,
  `usuarioid` int(11) NOT NULL,
  `reportanteid` int(11) NOT NULL,
  `multiple` tinyint(4) DEFAULT NULL,
  `statusfichaid` int(11) NOT NULL,
  `iddesaparicionforzada` int(11) DEFAULT NULL,
  `vehiculo` varchar(45) DEFAULT NULL,
  `tipovehiculo` int(11) DEFAULT NULL,
  `iddesaparicionparticular` int(11) DEFAULT NULL,
  `idmetodocaptura` int(11) DEFAULT NULL,
  `numimpresiones` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_ficha_desaparicionforzada_idx` (`iddesaparicionforzada`),
  KEY `fk_ficha_desaparicion_particular_idx` (`iddesaparicionparticular`),
  KEY `fk_ficha_tipo_vehiculo_idx` (`tipovehiculo`),
  KEY `fk_ficha_metodocaptura_idx` (`idmetodocaptura`),
  KEY `fk_fichadebusqueda_celula1_idx` (`idcelula`) USING BTREE,
  KEY `fk_fichadebusqueda_Tipodereporte1_idx` (`idtipodereporte`) USING BTREE,
  KEY `fk_fichadebusqueda_usuario1_idx` (`usuarioid`) USING BTREE,
  KEY `fk_fichadebusqueda_reportante1_idx` (`reportanteid`) USING BTREE,
  KEY `fk_fichadebusqueda_status_ficha1_idx` (`statusfichaid`) USING BTREE,
  CONSTRAINT `fk_ficha_desaparicion_particular` FOREIGN KEY (`iddesaparicionparticular`) REFERENCES `desaparicionparticulares` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ficha_desaparicionforzada` FOREIGN KEY (`iddesaparicionforzada`) REFERENCES `desaparicionforzada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ficha_metodocaptura` FOREIGN KEY (`idmetodocaptura`) REFERENCES `metodocaptura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ficha_tipo_vehiculo` FOREIGN KEY (`tipovehiculo`) REFERENCES `tipovehiculo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fichadebusqueda_Tipodereporte1` FOREIGN KEY (`idtipodereporte`) REFERENCES `tipodereporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fichadebusqueda_celula1` FOREIGN KEY (`idcelula`) REFERENCES `celula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fichadebusqueda_reportante1` FOREIGN KEY (`reportanteid`) REFERENCES `reportante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fichadebusqueda_status_ficha1` FOREIGN KEY (`statusfichaid`) REFERENCES `status_ficha` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fichadebusqueda_usuario1` FOREIGN KEY (`usuarioid`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.fichadebusqueda: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.funcions
CREATE TABLE IF NOT EXISTS `funcions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.funcions: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.f_Preliminar_In
CREATE TABLE IF NOT EXISTS `f_Preliminar_In` (
  `id` varchar(50) NOT NULL,
  `idpersona` int(11) DEFAULT NULL,
  `carpeta` varchar(50) DEFAULT NULL,
  `fecha_comisin` date DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `lugar_busqueda` varchar(45) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `idcoordenadas` int(11) NOT NULL,
  `idanexos` int(11) NOT NULL,
  `idautoridad` int(11) NOT NULL,
  `idcelula` int(11) NOT NULL,
  `idcolectivo` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_persona_idx` (`idpersona`) USING BTREE,
  KEY `fk_F_Preliminar_In_coordenadas1_idx` (`idcoordenadas`) USING BTREE,
  KEY `fk_F_Preliminar_In_anexos1_idx` (`idanexos`) USING BTREE,
  KEY `fk_F_Preliminar_In_autoridad1_idx` (`idautoridad`) USING BTREE,
  KEY `fk_F_Preliminar_In_celula1_idx` (`idcelula`) USING BTREE,
  KEY `fk_F_Preliminar_In_colectivo1_idx` (`idcolectivo`) USING BTREE,
  CONSTRAINT `FK_f_Preliminar_In_anexos` FOREIGN KEY (`idanexos`) REFERENCES `anexos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_f_Preliminar_In_autoridad` FOREIGN KEY (`idautoridad`) REFERENCES `autoridad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_f_Preliminar_In_celula` FOREIGN KEY (`idcelula`) REFERENCES `celula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_f_Preliminar_In_colectivo` FOREIGN KEY (`idcolectivo`) REFERENCES `colectivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_f_Preliminar_In_coordenadas` FOREIGN KEY (`idcoordenadas`) REFERENCES `coordenadas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_f_Preliminar_In_personas` FOREIGN KEY (`idpersona`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.f_Preliminar_In: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.generalidades
CREATE TABLE IF NOT EXISTS `generalidades` (
  `id` int(11) NOT NULL,
  `vegetacion` text DEFAULT NULL,
  `fauna` text DEFAULT NULL,
  `clima` text DEFAULT NULL,
  `tipo_suelo` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.generalidades: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.genero
CREATE TABLE IF NOT EXISTS `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.genero: ~5 rows (aproximadamente)
INSERT INTO `genero` (`id`, `valor`) VALUES
	(1, 'Masculino'),
	(2, 'Femenino'),
	(3, 'No binario'),
	(4, 'Intersexual'),
	(5, NULL);

-- Volcando estructura para tabla cicebv.grupos
CREATE TABLE IF NOT EXISTS `grupos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `representante` varchar(45) DEFAULT NULL,
  `idfuncion` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`idfuncion`) USING BTREE,
  KEY `fk_grupos_funcions1_idx` (`idfuncion`) USING BTREE,
  CONSTRAINT `fk_grupos_funcions1` FOREIGN KEY (`idfuncion`) REFERENCES `funcions` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.grupos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.hallazgo
CREATE TABLE IF NOT EXISTS `hallazgo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idbusqueda` int(11) NOT NULL,
  `idindicio` int(11) NOT NULL,
  `idcategoria` int(11) NOT NULL,
  `idobjeto` int(11) NOT NULL,
  `contenido` text NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_busqueda` (`idbusqueda`) USING BTREE,
  KEY `id_indicio` (`idindicio`) USING BTREE,
  KEY `id_categoria` (`idcategoria`) USING BTREE,
  KEY `id_objeto` (`idobjeto`) USING BTREE,
  CONSTRAINT `hallazgo_ibfk_1` FOREIGN KEY (`idbusqueda`) REFERENCES `busquedas` (`id`),
  CONSTRAINT `hallazgo_ibfk_2` FOREIGN KEY (`idindicio`) REFERENCES `indicio` (`id`),
  CONSTRAINT `hallazgo_ibfk_3` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`),
  CONSTRAINT `hallazgo_ibfk_4` FOREIGN KEY (`idobjeto`) REFERENCES `objeto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.hallazgo: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.identificacionoficial
CREATE TABLE IF NOT EXISTS `identificacionoficial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(45) NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.identificacionoficial: ~2 rows (aproximadamente)
INSERT INTO `identificacionoficial` (`id`, `identificacion`, `prioridad`) VALUES
	(1, 'INE', 3),
	(2, 'Pasaporte', 2);

-- Volcando estructura para tabla cicebv.imagens
CREATE TABLE IF NOT EXISTS `imagens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `coordenadas` point DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.imagens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.imagen_metodologia
CREATE TABLE IF NOT EXISTS `imagen_metodologia` (
  `imagen_id` bigint(20) NOT NULL,
  `metodologia_id` bigint(20) NOT NULL,
  PRIMARY KEY (`imagen_id`,`metodologia_id`),
  KEY `fk_imagen_metodologia_metodologias1_idx` (`metodologia_id`),
  CONSTRAINT `fk_imagen_metodologia_imagens1` FOREIGN KEY (`imagen_id`) REFERENCES `imagens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_imagen_metodologia_metodologias1` FOREIGN KEY (`metodologia_id`) REFERENCES `metodologias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.imagen_metodologia: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.imagen_particularidad
CREATE TABLE IF NOT EXISTS `imagen_particularidad` (
  `imagen_id` bigint(20) NOT NULL,
  `particularidad_id` bigint(20) NOT NULL,
  PRIMARY KEY (`imagen_id`,`particularidad_id`),
  KEY `fk_imagen_particularidad_particularidads1_idx` (`particularidad_id`),
  CONSTRAINT `fk_imagen_particularidad_imagens1` FOREIGN KEY (`imagen_id`) REFERENCES `imagens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_imagen_particularidad_particularidads1` FOREIGN KEY (`particularidad_id`) REFERENCES `particularidads` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.imagen_particularidad: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.imagen_plan
CREATE TABLE IF NOT EXISTS `imagen_plan` (
  `imagen_id` bigint(20) NOT NULL,
  `plan_id` bigint(20) NOT NULL,
  PRIMARY KEY (`imagen_id`,`plan_id`),
  KEY `fk_imagen_plan_plans1_idx` (`plan_id`),
  CONSTRAINT `fk_imagen_plan_imagens1` FOREIGN KEY (`imagen_id`) REFERENCES `imagens` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_imagen_plan_plans1` FOREIGN KEY (`plan_id`) REFERENCES `plans` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.imagen_plan: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.indicio
CREATE TABLE IF NOT EXISTS `indicio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.indicio: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.info_acc_ge
CREATE TABLE IF NOT EXISTS `info_acc_ge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicial` date DEFAULT NULL,
  `fecha_termino` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `idindicio` int(11) DEFAULT NULL,
  `idanexos` int(11) DEFAULT NULL,
  `idinfo_pre_ge` int(11) DEFAULT NULL,
  `idbitacora` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_indicio_ci` (`idindicio`) USING BTREE,
  KEY `fk_anexo_ci` (`idanexos`) USING BTREE,
  KEY `FK_info_acc_ge_info_pre_ge_ci` (`idinfo_pre_ge`) USING BTREE,
  KEY `FK_info_acc_ge_bitacoras_ci` (`idbitacora`) USING BTREE,
  CONSTRAINT `FK_info_acc_ge_bitacoras_ci` FOREIGN KEY (`idbitacora`) REFERENCES `bitacoras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_info_acc_ge_info_pre_ge_ci` FOREIGN KEY (`idinfo_pre_ge`) REFERENCES `info_pre_ge` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anexo_ci` FOREIGN KEY (`idanexos`) REFERENCES `anexos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_indicio_ci` FOREIGN KEY (`idindicio`) REFERENCES `indicio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.info_acc_ge: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.info_acc_in
CREATE TABLE IF NOT EXISTS `info_acc_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_inicial` date DEFAULT NULL,
  `fecha_termo` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `anexos` text DEFAULT NULL,
  `info_acc_incol` varchar(45) DEFAULT NULL,
  `idf_preliminar_in` varchar(50) NOT NULL,
  `idbitacora` int(11) NOT NULL,
  `idanexos` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_info_acc_in_F_Preliminar_In1_idx` (`idf_preliminar_in`) USING BTREE,
  KEY `fk_info_acc_in_bitacora1_idx` (`idbitacora`) USING BTREE,
  KEY `fk_info_acc_in_anexos1_idx` (`idanexos`) USING BTREE,
  CONSTRAINT `fk_info_acc_in_F_Preliminar_In1` FOREIGN KEY (`idf_preliminar_in`) REFERENCES `f_Preliminar_In` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_info_acc_in_anexos1` FOREIGN KEY (`idanexos`) REFERENCES `anexos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_info_acc_in_bitacora1` FOREIGN KEY (`idbitacora`) REFERENCES `bitacoras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.info_acc_in: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.info_pre_ge
CREATE TABLE IF NOT EXISTS `info_pre_ge` (
  `id` int(11) NOT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `tipo_busqueda` varchar(45) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL,
  `id_indicio` int(11) DEFAULT NULL,
  `anexos_Id` int(11) NOT NULL,
  `coordenadas_Id` int(11) NOT NULL,
  `celula_Id` int(11) NOT NULL,
  `colectivo_id` int(11) NOT NULL,
  `autoridad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_info_pre_ge_anexos1_idx` (`anexos_Id`),
  KEY `fk_info_pre_ge_coordenadas1_idx` (`coordenadas_Id`),
  KEY `fk_info_pre_ge_celula1_idx` (`celula_Id`),
  KEY `fk_info_pre_ge_colectivo1_idx` (`colectivo_id`),
  KEY `fk_info_pre_ge_autoridad1_idx` (`autoridad_id`),
  KEY `fk_municipio_idx` (`id_municipio`),
  KEY `fk_indicio_idx` (`id_indicio`),
  CONSTRAINT `fk_indicio` FOREIGN KEY (`id_indicio`) REFERENCES `indicio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_info_pre_ge_anexos1` FOREIGN KEY (`anexos_Id`) REFERENCES `anexos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_info_pre_ge_autoridad1` FOREIGN KEY (`autoridad_id`) REFERENCES `autoridad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_info_pre_ge_celula1` FOREIGN KEY (`celula_Id`) REFERENCES `celula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_info_pre_ge_colectivo1` FOREIGN KEY (`colectivo_id`) REFERENCES `colectivo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_info_pre_ge_coordenadas1` FOREIGN KEY (`coordenadas_Id`) REFERENCES `coordenadas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_municipio` FOREIGN KEY (`id_municipio`) REFERENCES `municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.info_pre_ge: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.instrumentoentrevista
CREATE TABLE IF NOT EXISTS `instrumentoentrevista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreentrevistador` int(11) DEFAULT NULL,
  `firma` varchar(45) DEFAULT NULL,
  `idprocedenciaentrevista` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_instrumentoentrevista_tipodeintrumetoentrevista1_idx` (`idprocedenciaentrevista`) USING BTREE,
  CONSTRAINT `fk_instrumentoentrevista_tipodeintrumetoentrevista1` FOREIGN KEY (`idprocedenciaentrevista`) REFERENCES `tipodeintrumetoentrevista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.instrumentoentrevista: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.ladosenas
CREATE TABLE IF NOT EXISTS `ladosenas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `registrode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.ladosenas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.lengua
CREATE TABLE IF NOT EXISTS `lengua` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(45) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.lengua: ~31 rows (aproximadamente)
INSERT INTO `lengua` (`id`, `valor`, `prioridad`) VALUES
	(1, 'Náhuatl', NULL),
	(2, 'Paipai', NULL),
	(3, 'Kiliwa', NULL),
	(4, 'Cucapa', NULL),
	(5, 'Cochimí', NULL),
	(6, 'Kumiai', NULL),
	(7, 'Seri', NULL),
	(8, 'Chontal de Oaxaca', NULL),
	(9, 'Chinanteco', NULL),
	(10, 'Chinanteco de Ojitlán', NULL),
	(11, 'Chinanteco de Usila', NULL),
	(12, 'Chinanteco de Quiotepec', NULL),
	(13, 'Chinanteco de Yolox', NULL),
	(14, 'Chinanteco de Palantla', NULL),
	(15, 'Chinanteco de Valle Nacional', NULL),
	(16, 'Chinanteco de Lalana', NULL),
	(17, 'Chinanteco de Latani', NULL),
	(18, 'Chinanteco de Petlapa', NULL),
	(19, 'Pame', NULL),
	(20, 'Chichimeca Jonaz', NULL),
	(21, 'Otomí', NULL),
	(22, 'Mazahua', NULL),
	(23, 'Matlatzinca', NULL),
	(24, 'Ocuilteco(Tlahuica)', NULL),
	(25, 'Zapoteco', NULL),
	(26, 'Zapoteco de Ixtlán', NULL),
	(27, 'Zapoteco Vijano', NULL),
	(28, 'Zapoteco del Rincon', NULL),
	(29, 'Zapoteco Vallista', NULL),
	(30, 'Zapoteco del Istmo', NULL),
	(31, 'Español', NULL);

-- Volcando estructura para tabla cicebv.lugardesaparicion
CREATE TABLE IF NOT EXISTS `lugardesaparicion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `colonia` varchar(45) DEFAULT NULL,
  `calle` varchar(45) DEFAULT NULL,
  `referencialugar` mediumtext DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `tramocarretera` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.lugardesaparicion: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.lugarnacimiento
CREATE TABLE IF NOT EXISTS `lugarnacimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localidad` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.lugarnacimiento: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.lugarorigen
CREATE TABLE IF NOT EXISTS `lugarorigen` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `localidad` varchar(45) DEFAULT NULL,
  `municipio` varchar(45) DEFAULT NULL,
  `cp` varchar(45) DEFAULT NULL,
  `estado` varchar(45) NOT NULL,
  `pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.lugarorigen: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.metodocaptura
CREATE TABLE IF NOT EXISTS `metodocaptura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `metodonom` varchar(45) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.metodocaptura: ~8 rows (aproximadamente)
INSERT INTO `metodocaptura` (`id`, `metodonom`, `prioridad`) VALUES
	(9, 'Desaparición', NULL),
	(10, 'Extorsión o engaño', NULL),
	(11, 'Privación por un particular', NULL),
	(12, 'Retén u operativo', NULL),
	(13, 'Orden de aprehensión', NULL),
	(14, 'Secuestro', NULL),
	(15, 'Sin información', NULL),
	(16, 'Otro', NULL);

-- Volcando estructura para tabla cicebv.metodologias
CREATE TABLE IF NOT EXISTS `metodologias` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `busqueda_id` int(11) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_busquedametodo_idx` (`busqueda_id`),
  CONSTRAINT `fk_busqueda_metodolog` FOREIGN KEY (`busqueda_id`) REFERENCES `busquedas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.metodologias: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla cicebv.migrations: ~0 rows (aproximadamente)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- Volcando estructura para tabla cicebv.minorias
CREATE TABLE IF NOT EXISTS `minorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreminoria` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.minorias: ~4 rows (aproximadamente)
INSERT INTO `minorias` (`id`, `nombreminoria`) VALUES
	(1, 'Pueblo Indígena'),
	(2, 'Afrodescendiente'),
	(3, 'LGBTTTI'),
	(4, 'Migrante');

-- Volcando estructura para tabla cicebv.municipios
CREATE TABLE IF NOT EXISTS `municipios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMunicipio` varchar(45) DEFAULT NULL,
  `idcedula` int(11) DEFAULT NULL,
  `idgeneralidades` int(11) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_municipio_celula1_idx` (`idcedula`) USING BTREE,
  KEY `fk_municipio_generalidades1_idx` (`idgeneralidades`) USING BTREE,
  CONSTRAINT `fk_municipio_celula1` FOREIGN KEY (`idcedula`) REFERENCES `celula` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_municipio_generalidades1` FOREIGN KEY (`idgeneralidades`) REFERENCES `generalidades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.municipios: ~56 rows (aproximadamente)
INSERT INTO `municipios` (`id`, `nombreMunicipio`, `idcedula`, `idgeneralidades`, `prioridad`) VALUES
	(1, 'Acajete', NULL, NULL, NULL),
	(2, 'Acatlán', NULL, NULL, NULL),
	(3, 'Acayucan', NULL, NULL, NULL),
	(4, 'Actopan', NULL, NULL, NULL),
	(5, 'Acula', NULL, NULL, NULL),
	(6, 'Acultzingo', NULL, NULL, NULL),
	(7, 'Camarón de Tejeda', NULL, NULL, NULL),
	(8, 'Alpatláhuac', NULL, NULL, NULL),
	(9, 'Alto Lucero de Gutiérrez Barrios', NULL, NULL, NULL),
	(10, 'Altotonga', NULL, NULL, NULL),
	(11, 'Alvarado', NULL, NULL, NULL),
	(12, 'Amatitlán', NULL, NULL, NULL),
	(13, 'Naranjos Amatlán', NULL, NULL, NULL),
	(14, 'Amatlán de los Reyes', NULL, NULL, NULL),
	(15, 'Ángel R. Cabada', NULL, NULL, NULL),
	(16, 'La Antigua', NULL, NULL, NULL),
	(17, 'Apazapan', NULL, NULL, NULL),
	(18, 'Aquila', NULL, NULL, NULL),
	(19, 'Astacinga', NULL, NULL, NULL),
	(20, 'Atlahuilco', NULL, NULL, NULL),
	(21, 'Atoyac', NULL, NULL, NULL),
	(22, 'Atzacan', NULL, NULL, NULL),
	(23, 'Atzalan', NULL, NULL, NULL),
	(24, 'Tlaltetela', NULL, NULL, NULL),
	(25, 'Ayahualulco', NULL, NULL, NULL),
	(26, 'Banderilla', NULL, NULL, NULL),
	(27, 'Benito Juárez', NULL, NULL, NULL),
	(28, 'Boca del Río', NULL, NULL, NULL),
	(29, 'Calcahualco', NULL, NULL, NULL),
	(30, 'Camerino Z. Mendoza', NULL, NULL, NULL),
	(31, 'Carrillo Puerto', NULL, NULL, NULL),
	(32, 'Catemaco', NULL, NULL, NULL),
	(33, 'Cazones de Herrera', NULL, NULL, NULL),
	(34, 'Cerro Azul', NULL, NULL, NULL),
	(35, 'Citlaltépetl', NULL, NULL, NULL),
	(36, 'Coacoatzintla', NULL, NULL, NULL),
	(37, 'Coahuitlán', NULL, NULL, NULL),
	(38, 'Coatepec', NULL, NULL, NULL),
	(39, 'Coatzacoalcos', NULL, NULL, NULL),
	(40, 'Coatzintla', NULL, NULL, NULL),
	(41, 'Coetzala', NULL, NULL, NULL),
	(42, 'Colipa', NULL, NULL, NULL),
	(43, 'Comapa', NULL, NULL, NULL),
	(44, 'Córdoba', NULL, NULL, NULL),
	(45, 'Cosamaloapan de Carpio', NULL, NULL, NULL),
	(46, 'Cosautlán de Carvajal', NULL, NULL, NULL),
	(47, 'Coscomatepec', NULL, NULL, NULL),
	(48, 'Cosoleacaque', NULL, NULL, NULL),
	(49, 'Cotaxtla', NULL, NULL, NULL),
	(50, 'Coxquihui', NULL, NULL, NULL),
	(51, 'Coyutla', NULL, NULL, NULL),
	(52, 'Cuichapa', NULL, NULL, NULL),
	(53, 'Cuitláhuac', NULL, NULL, NULL),
	(54, 'Chacaltianguis', NULL, NULL, NULL),
	(55, 'Chalma', NULL, NULL, NULL),
	(56, 'Chiconamel', NULL, NULL, NULL);

-- Volcando estructura para tabla cicebv.municipio_colonia
CREATE TABLE IF NOT EXISTS `municipio_colonia` (
  `municipio_id` int(11) NOT NULL,
  `colonia_id` int(11) NOT NULL,
  PRIMARY KEY (`municipio_id`,`colonia_id`) USING BTREE,
  KEY `fk_municipio_has_colonia_colonia1_idx` (`colonia_id`),
  KEY `fk_municipio_has_colonia_municipio1_idx` (`municipio_id`) USING BTREE,
  CONSTRAINT `fk_municipio_has_colonia_colonia1` FOREIGN KEY (`colonia_id`) REFERENCES `colonia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_municipio_has_colonia_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.municipio_colonia: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.municipio_estados
CREATE TABLE IF NOT EXISTS `municipio_estados` (
  `municipio_id` int(11) NOT NULL,
  `estados_id` int(11) NOT NULL,
  PRIMARY KEY (`municipio_id`,`estados_id`) USING BTREE,
  KEY `fk_municipio_has_estados_estados1_idx` (`estados_id`),
  KEY `fk_municipio_has_estados_municipio1_idx` (`municipio_id`) USING BTREE,
  CONSTRAINT `fk_municipio_has_estados_estados1` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_municipio_has_estados_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.municipio_estados: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.nacionalidad
CREATE TABLE IF NOT EXISTS `nacionalidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.nacionalidad: ~19 rows (aproximadamente)
INSERT INTO `nacionalidad` (`id`, `nombre`, `prioridad`) VALUES
	(21, 'Mexicana', NULL),
	(22, 'Estadounidense', NULL),
	(23, 'Canadiense', NULL),
	(24, 'Brasileña', NULL),
	(25, 'Argentina', NULL),
	(26, 'Colombiana', NULL),
	(27, 'Peruana', NULL),
	(28, 'Chilena', NULL),
	(29, 'Ecuatoriana', NULL),
	(30, 'Venezolana', NULL),
	(31, 'España', NULL),
	(32, 'Francia', NULL),
	(33, 'Italia', NULL),
	(34, 'Alemania', NULL),
	(35, 'Reino Unido', NULL),
	(36, 'China', NULL),
	(37, 'India', NULL),
	(38, 'Japón', NULL),
	(39, 'Corea del Sur', NULL);

-- Volcando estructura para tabla cicebv.nofolio
CREATE TABLE IF NOT EXISTS `nofolio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folionm` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.nofolio: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.objeto
CREATE TABLE IF NOT EXISTS `objeto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`idcategoria`) USING BTREE,
  CONSTRAINT `objeto_ibfk_1` FOREIGN KEY (`idcategoria`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.objeto: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.pais
CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `codigo` int(11) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.pais: ~17 rows (aproximadamente)
INSERT INTO `pais` (`id`, `nombre`, `codigo`, `prioridad`) VALUES
	(1, 'México', NULL, NULL),
	(2, 'Estados Unidos', NULL, NULL),
	(3, 'Canadá', NULL, NULL),
	(4, 'Brasil', NULL, NULL),
	(5, 'Argentina', NULL, NULL),
	(6, 'Colombia', NULL, NULL),
	(7, 'Perú', NULL, NULL),
	(8, 'Chile', NULL, NULL),
	(9, 'Venezuela', NULL, NULL),
	(10, 'España', NULL, NULL),
	(11, 'Francia', NULL, NULL),
	(12, 'Alemania', NULL, NULL),
	(13, 'Italia', NULL, NULL),
	(14, 'Reino Unido', NULL, NULL),
	(15, 'China', NULL, NULL),
	(16, 'India', NULL, NULL),
	(17, 'Japón', NULL, NULL);

-- Volcando estructura para tabla cicebv.particularidads
CREATE TABLE IF NOT EXISTS `particularidads` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `busqueda_id` int(11) DEFAULT NULL,
  `contenido` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `update_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_busqueda_idx` (`busqueda_id`),
  CONSTRAINT `fk_busqueda` FOREIGN KEY (`busqueda_id`) REFERENCES `busquedas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.particularidads: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla cicebv.password_reset_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.permisos
CREATE TABLE IF NOT EXISTS `permisos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.permisos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla cicebv.personal_access_tokens: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.personas
CREATE TABLE IF NOT EXISTS `personas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `primer_apellido` varchar(45) DEFAULT NULL,
  `segundo_apellido` varchar(45) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `idlugarnacimiento` int(11) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` text DEFAULT NULL,
  `companiatelefonica` text DEFAULT NULL,
  `ocupacion` varchar(45) DEFAULT NULL,
  `detalleocupacion` varchar(45) DEFAULT NULL,
  `estatusmigratorio` varchar(45) DEFAULT NULL,
  `idreligion` int(11) DEFAULT NULL,
  `curp` varchar(45) DEFAULT NULL,
  `idescolaridad` int(11) DEFAULT NULL,
  `idgenero` int(11) DEFAULT NULL,
  `idlengua` int(11) DEFAULT NULL,
  `ididentificacionoficial` int(11) DEFAULT NULL,
  `idsituacionpersona` int(11) DEFAULT NULL,
  `idsexo` int(11) DEFAULT NULL,
  `idnacionalidad` int(11) DEFAULT NULL,
  `iddomicilio` int(11) DEFAULT NULL,
  `idlugarorigen` int(11) DEFAULT NULL,
  `idlugardesaparicion` int(11) DEFAULT NULL,
  `especificaciones_tatuajes` varchar(45) DEFAULT NULL,
  `idestadocivil` int(11) DEFAULT NULL,
  `convivencia_personas` varchar(45) DEFAULT NULL,
  `ultimapareja` varchar(45) DEFAULT NULL,
  `hijoas` varchar(45) DEFAULT NULL,
  `integrantefamiliar_cercano` varchar(45) DEFAULT NULL,
  `violenciadentrofamilia` varchar(45) DEFAULT NULL,
  `iddiscapacidad` int(11) DEFAULT NULL,
  `idminorias` int(11) DEFAULT NULL,
  `idsenas` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_personas_minorias_idx` (`idminorias`),
  KEY `fk_persona_genero1_idx` (`idgenero`) USING BTREE,
  KEY `fk_persona_lengua1_idx` (`idlengua`) USING BTREE,
  KEY `fk_persona_identificacionoficial1_idx` (`ididentificacionoficial`) USING BTREE,
  KEY `fk_persona_Situacion_persona1_idx` (`idsituacionpersona`) USING BTREE,
  KEY `fk_persona_sexo1_idx` (`idsexo`) USING BTREE,
  KEY `fk_persona_nacionalidad1_idx` (`idnacionalidad`) USING BTREE,
  KEY `fk_persona_escolaridad1_idx` (`idescolaridad`) USING BTREE,
  KEY `fk_persona_religion1_idx` (`idreligion`) USING BTREE,
  KEY `fk_persona_domicilio1_idx` (`iddomicilio`) USING BTREE,
  KEY `fk_persona_lugarorigen1_idx` (`idlugarorigen`) USING BTREE,
  KEY `fk_persona_lugardesaparicion1_idx` (`idlugardesaparicion`) USING BTREE,
  KEY `fk_personas_discapacidad1_idx` (`iddiscapacidad`) USING BTREE,
  KEY `fk_personas_Estado_civil1_idx` (`idestadocivil`) USING BTREE,
  KEY `idlugarnacimiento` (`idlugarnacimiento`),
  KEY `idsenas` (`idsenas`),
  CONSTRAINT `FK_personas_discapacidad` FOREIGN KEY (`iddiscapacidad`) REFERENCES `discapacidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_domicilio` FOREIGN KEY (`iddomicilio`) REFERENCES `domicilio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_escolaridad` FOREIGN KEY (`idescolaridad`) REFERENCES `escolaridad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_estado_civil` FOREIGN KEY (`idestadocivil`) REFERENCES `estado_civil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_genero` FOREIGN KEY (`idgenero`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_identificacionoficial` FOREIGN KEY (`ididentificacionoficial`) REFERENCES `identificacionoficial` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_lengua` FOREIGN KEY (`idlengua`) REFERENCES `lengua` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_lugardesaparicion` FOREIGN KEY (`idlugardesaparicion`) REFERENCES `lugardesaparicion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_lugarnacimiento` FOREIGN KEY (`idlugarnacimiento`) REFERENCES `lugarnacimiento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_lugarorigen` FOREIGN KEY (`idlugarorigen`) REFERENCES `lugarorigen` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_minorias` FOREIGN KEY (`idminorias`) REFERENCES `minorias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_nacionalidad` FOREIGN KEY (`idnacionalidad`) REFERENCES `nacionalidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_religion` FOREIGN KEY (`idreligion`) REFERENCES `religion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_senasparticulares` FOREIGN KEY (`idsenas`) REFERENCES `senasparticulares` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_sexo` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_personas_situacion_persona` FOREIGN KEY (`idsituacionpersona`) REFERENCES `situacion_persona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.personas: ~13 rows (aproximadamente)
INSERT INTO `personas` (`id`, `nombre`, `primer_apellido`, `segundo_apellido`, `fechanacimiento`, `edad`, `idlugarnacimiento`, `direccion`, `telefono`, `companiatelefonica`, `ocupacion`, `detalleocupacion`, `estatusmigratorio`, `idreligion`, `curp`, `idescolaridad`, `idgenero`, `idlengua`, `ididentificacionoficial`, `idsituacionpersona`, `idsexo`, `idnacionalidad`, `iddomicilio`, `idlugarorigen`, `idlugardesaparicion`, `especificaciones_tatuajes`, `idestadocivil`, `convivencia_personas`, `ultimapareja`, `hijoas`, `integrantefamiliar_cercano`, `violenciadentrofamilia`, `iddiscapacidad`, `idminorias`, `idsenas`) VALUES
	(123, 'Brian', 'Hernandez', 'Vazquez', '2000-05-26', 24, NULL, 'Abasolo', '2261254897', 'TELCEL', 'Estudiante', 'Se encuentra en noveno semestre ', 'Vigente', 31, 'JHDJDDDVVFJFD240', 13, 1, 31, NULL, NULL, 1, 21, 9, NULL, NULL, 'lunar en la cara ', 2, 'Esposa e hija', 'Sonia Mendez Valdez', 'si', 'esposa', 'no', NULL, 2, NULL),
	(124, 'Daniel', 'Perez', 'Perez', '2002-03-18', 21, NULL, 'Abasolo', '2283164879', NULL, 'Estudiante', NULL, 'Vigente', NULL, 'hgyr567843wrswra2', NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(125, 'Mariam', 'Perez', 'Perez', '2000-05-26', 24, NULL, 'Abasolo', '2283164879', NULL, 'Estudiante', NULL, 'Vigente', NULL, 'hgyr567843wrswra2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(126, 'Karina', 'Zolano', NULL, NULL, NULL, NULL, 'Abasolo', '21613824', NULL, 'Estudiante', 'Tecnologico de xalapa', NULL, NULL, 'JHDJDDDVVFJFRT40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(127, NULL, NULL, NULL, '2024-01-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(128, 'Enrique', 'Perez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(129, 'Karina', 'Zolano', NULL, '2000-05-26', NULL, NULL, 'Abasolo', '21613824', NULL, 'Estudiante', NULL, 'Vigente', NULL, 'JHDJDDDVVFJFRT40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(130, 'Luis', 'Zolano', NULL, '2000-05-26', NULL, NULL, 'Abasolo', '21613824', NULL, 'Estudiante', NULL, 'Vigente', NULL, 'JHDJDDDVVFJFRT40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(132, 'jorge', 'Zolano', NULL, '2000-05-26', NULL, NULL, 'Abasolo', '21613824', NULL, 'Estudiante', NULL, 'Vigente', NULL, 'JHDJDDDVVFJFRT40', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(133, 'Raul', 'Montez', NULL, '2000-05-26', NULL, NULL, 'Praderas', '21613824', NULL, 'Estudiante', NULL, 'Vigente', NULL, 'JHDJDDDVVFJFD240', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(138, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(139, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Volcando estructura para tabla cicebv.persona_fichadeb
CREATE TABLE IF NOT EXISTS `persona_fichadeb` (
  `persona_id` int(11) NOT NULL,
  `fichadebusqueda_id` int(11) NOT NULL,
  PRIMARY KEY (`persona_id`,`fichadebusqueda_id`) USING BTREE,
  KEY `fk_persona_has_fichadebusqueda_fichadebusqueda1_idx` (`fichadebusqueda_id`) USING BTREE,
  KEY `fk_persona_has_fichadebusqueda_persona1_idx` (`persona_id`) USING BTREE,
  CONSTRAINT `fk_persona_has_fichadebusqueda_fichadebusqueda1` FOREIGN KEY (`fichadebusqueda_id`) REFERENCES `fichadebusqueda` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_has_fichadebusqueda_persona1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.persona_fichadeb: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.persona_valcaracteristicas
CREATE TABLE IF NOT EXISTS `persona_valcaracteristicas` (
  `persona_id` int(11) NOT NULL,
  `valor_caracteristicasfisicas_id` int(11) NOT NULL,
  PRIMARY KEY (`persona_id`,`valor_caracteristicasfisicas_id`) USING BTREE,
  KEY `fk_persona_has_valor_caracteristicasfisicas_valor_caracteri_idx` (`valor_caracteristicasfisicas_id`) USING BTREE,
  KEY `fk_persona_has_valor_caracteristicasfisicas_persona1_idx` (`persona_id`) USING BTREE,
  CONSTRAINT `fk_persona_has_valor_caracteristicasfisicas_persona1` FOREIGN KEY (`persona_id`) REFERENCES `personas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_persona_has_valor_caracteristicasfisicas_valor_caracterist1` FOREIGN KEY (`valor_caracteristicasfisicas_id`) REFERENCES `valor_caracteristicasfisicas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.persona_valcaracteristicas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.plans
CREATE TABLE IF NOT EXISTS `plans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `busqueda_id` int(11) DEFAULT NULL,
  `contenido` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_busquedas_idx` (`busqueda_id`),
  CONSTRAINT `fk_busquedas` FOREIGN KEY (`busqueda_id`) REFERENCES `busquedas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.plans: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.puesto
CREATE TABLE IF NOT EXISTS `puesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombrepuesto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.puesto: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.puesto_departamento
CREATE TABLE IF NOT EXISTS `puesto_departamento` (
  `idpuesto` int(11) NOT NULL,
  `iddepartamento` int(11) NOT NULL,
  PRIMARY KEY (`idpuesto`,`iddepartamento`) USING BTREE,
  KEY `fk_puesto_has_Departamento_Departamento1_idx` (`iddepartamento`) USING BTREE,
  KEY `idpuesto` (`idpuesto`),
  CONSTRAINT `FK_puesto_departamento_puesto` FOREIGN KEY (`idpuesto`) REFERENCES `puesto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_puesto_has_Departamento_Departamento1` FOREIGN KEY (`iddepartamento`) REFERENCES `departamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.puesto_departamento: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.puesto_permisos
CREATE TABLE IF NOT EXISTS `puesto_permisos` (
  `idpuesto` int(11) NOT NULL,
  `idpermisos` int(11) NOT NULL,
  PRIMARY KEY (`idpuesto`,`idpermisos`) USING BTREE,
  KEY `fk_puesto_has_permisos_permisos1_idx` (`idpermisos`) USING BTREE,
  KEY `idpuesto` (`idpuesto`),
  CONSTRAINT `FK_puesto_has_permisos_puesto` FOREIGN KEY (`idpuesto`) REFERENCES `puesto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_puesto_has_permisos_permisos1` FOREIGN KEY (`idpermisos`) REFERENCES `permisos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.puesto_permisos: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.regionsenas
CREATE TABLE IF NOT EXISTS `regionsenas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `registrode` varchar(45) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.regionsenas: ~34 rows (aproximadamente)
INSERT INTO `regionsenas` (`id`, `nombre`, `registrode`, `prioridad`) VALUES
	(1, 'NO ESPECIFICA', 'CEBV', NULL),
	(2, 'BORDE INTERNO DEL PIE', 'CNB', NULL),
	(3, 'BORDE EXTERNO DEL PIE', 'CNB', NULL),
	(4, 'CARA DORSAL DE LA MANO', 'CNB', NULL),
	(5, 'CARA INTERNA DEL MUSLO', 'CNB', NULL),
	(6, 'CARA PLANTAR O PLANTA DEL PIE', 'CNB', NULL),
	(7, 'CARA POSTERIOR DE LA MUÑECA', 'CNB', NULL),
	(8, 'CARA POSTERIOR DE LA PIERNA', 'CNB', NULL),
	(9, 'CARA PORTERIOR DE PIERNA', 'CNB', NULL),
	(10, 'CARA PORTERIOR DEL ANTEBRAZO', 'CNB', NULL),
	(11, 'CARA PORTERIOR DEL BRAZO', 'CNB', NULL),
	(12, 'CARA PORTERIOR DEL CODO', 'CNB', NULL),
	(13, 'CARA PORSTERIOR DEL MUSLO', 'CNB', NULL),
	(14, 'DEDOS DE LA MANO', 'CNB', NULL),
	(15, 'HUECO POPLITEO', 'CNB', NULL),
	(16, 'OLECRANO', 'CNB', NULL),
	(17, 'PARES POSTERIOR DE LA AXILA', 'CNB', NULL),
	(18, 'PROMINENTE', 'CNB', NULL),
	(19, 'REGION DEL TRAPECIO', 'CNB', NULL),
	(20, 'REGION ESCAPULAR', 'CNB', NULL),
	(21, 'REGION CLUTEA', 'CNB', NULL),
	(22, 'REGION INFRAESCAPULAR', 'CNB', NULL),
	(23, 'REGION INTERESCAPULAR', 'CNB', NULL),
	(24, 'REGION LUMBAR', 'CNB', NULL),
	(25, 'REGION LUMBAR EXTERNA FLANCO', 'CNB', NULL),
	(26, 'REGION MASTOIDEA', 'CNB', NULL),
	(27, 'REGION OCCIPITAL', 'CNB', NULL),
	(28, 'REGION POSTERIOR DEL CUELLO', 'CNB', NULL),
	(29, 'REGION SACRA', 'CNB', NULL),
	(30, 'REGION SUPRAESCAPULAR', 'CNB', NULL),
	(31, 'REGION TROCANTEREANA', 'CNB', NULL),
	(32, 'TALON', 'CNB', NULL),
	(33, 'TENDON DE AQUILES', 'CNB', NULL),
	(34, 'CARA ANTERIOR DE LA PIERNA', 'CNB', NULL);

-- Volcando estructura para tabla cicebv.religion
CREATE TABLE IF NOT EXISTS `religion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.religion: ~19 rows (aproximadamente)
INSERT INTO `religion` (`id`, `nombre`, `prioridad`) VALUES
	(22, 'Católicos', NULL),
	(23, 'Católicos ortodoxos', NULL),
	(24, 'Anabautista/Menonita', NULL),
	(25, 'Anglicano/Episcopal', NULL),
	(26, 'Bautista', NULL),
	(27, 'Luterana', NULL),
	(28, 'Metodista', NULL),
	(29, 'Testigos de Jehová', NULL),
	(30, 'Cristianos', NULL),
	(31, 'Evangélicos', NULL),
	(32, 'Pentecostales', NULL),
	(33, 'Protestantes', NULL),
	(34, 'Judaísmo', NULL),
	(35, 'Islamismo', NULL),
	(36, 'Budismo', NULL),
	(37, 'Hinduismo', NULL),
	(38, 'Otras de origen oriental', NULL),
	(39, 'New Age y Escuelas esotéricas', NULL),
	(40, 'Raíces étnicas', NULL);

-- Volcando estructura para tabla cicebv.reportante
CREATE TABLE IF NOT EXISTS `reportante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correoelectronico` varchar(45) NOT NULL,
  `idinstrumentoentrevista` int(11) DEFAULT NULL,
  `fechanacimiento` date DEFAULT NULL,
  `curp` int(11) NOT NULL,
  `iddocumentoooficial` int(11) DEFAULT NULL,
  `idestadocivil` int(11) DEFAULT NULL,
  `idreligion` int(11) DEFAULT NULL,
  `idlengua` int(11) DEFAULT NULL,
  `idescolaridad` int(11) DEFAULT NULL,
  `ocupacion` varchar(45) DEFAULT NULL,
  `iddomicilio` int(11) DEFAULT NULL,
  `numerodependientes` int(11) DEFAULT NULL,
  `relacionpersona` varchar(45) DEFAULT NULL,
  `perteneceminoria` varchar(45) DEFAULT NULL,
  `pertenececolectivo` varchar(45) DEFAULT NULL,
  `realizobusqueda` varchar(45) DEFAULT NULL,
  `contactadoextorsion` varchar(45) DEFAULT NULL,
  `idtipodereporte` int(11) DEFAULT NULL,
  `idnacionalidad` int(11) NOT NULL,
  `idsexo` int(11) NOT NULL,
  `idgenero` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_reportante_instrumentoentrevista1_idx` (`idinstrumentoentrevista`) USING BTREE,
  KEY `fk_reportante_lengua1_idx` (`idlengua`) USING BTREE,
  KEY `fk_reportante_escolaridad1_idx` (`idescolaridad`) USING BTREE,
  KEY `fk_reportante_nacionalidad1_idx` (`idnacionalidad`) USING BTREE,
  KEY `fk_reportante_sexo1_idx` (`idsexo`) USING BTREE,
  KEY `fk_reportante_identificacionoficial1_idx` (`iddocumentoooficial`) USING BTREE,
  KEY `fk_reportante_religion1_idx` (`idreligion`) USING BTREE,
  KEY `fk_reportante_genero1_idx` (`idgenero`) USING BTREE,
  KEY `fk_reportante_domicilio1_idx` (`iddomicilio`) USING BTREE,
  KEY `fk_reportante_tipodereporte1_idx` (`idtipodereporte`) USING BTREE,
  KEY `fk_estado_civil_idx` (`idestadocivil`) USING BTREE,
  CONSTRAINT `fk_estado_civil` FOREIGN KEY (`idestadocivil`) REFERENCES `estado_civil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reportante_domicilio1` FOREIGN KEY (`iddomicilio`) REFERENCES `domicilio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reportante_escolaridad1` FOREIGN KEY (`idescolaridad`) REFERENCES `escolaridad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reportante_genero1` FOREIGN KEY (`idgenero`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reportante_identificacionoficial1` FOREIGN KEY (`iddocumentoooficial`) REFERENCES `identificacionoficial` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reportante_instrumentoentrevista1` FOREIGN KEY (`idinstrumentoentrevista`) REFERENCES `instrumentoentrevista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reportante_lengua1` FOREIGN KEY (`idlengua`) REFERENCES `lengua` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reportante_nacionalidad1` FOREIGN KEY (`idnacionalidad`) REFERENCES `nacionalidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reportante_religion1` FOREIGN KEY (`idreligion`) REFERENCES `religion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reportante_sexo1` FOREIGN KEY (`idsexo`) REFERENCES `sexo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reportante_tipodereporte1` FOREIGN KEY (`idtipodereporte`) REFERENCES `tipodereporte` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.reportante: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.reportante_telefono
CREATE TABLE IF NOT EXISTS `reportante_telefono` (
  `reportante_id` int(11) NOT NULL,
  `telefono_id` int(11) NOT NULL,
  PRIMARY KEY (`reportante_id`,`telefono_id`) USING BTREE,
  KEY `fk_reportante_has_Telefono_Telefono1_idx` (`telefono_id`) USING BTREE,
  KEY `fk_reportante_has_Telefono_reportante1_idx` (`reportante_id`) USING BTREE,
  CONSTRAINT `fk_reportante_has_Telefono_Telefono1` FOREIGN KEY (`telefono_id`) REFERENCES `telefono` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reportante_has_Telefono_reportante1` FOREIGN KEY (`reportante_id`) REFERENCES `reportante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.reportante_telefono: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.resto
CREATE TABLE IF NOT EXISTS `resto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.resto: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.senasparticulares
CREATE TABLE IF NOT EXISTS `senasparticulares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `foto` blob DEFAULT NULL,
  `idregion` int(11) DEFAULT NULL,
  `idlado` int(11) DEFAULT NULL,
  `idvista` int(11) DEFAULT NULL,
  `idtipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idregion` (`idregion`),
  KEY `idlado` (`idlado`),
  KEY `idvista` (`idvista`),
  KEY `idtipo` (`idtipo`),
  CONSTRAINT `FK_senasparticulares_ladosenas` FOREIGN KEY (`idlado`) REFERENCES `ladosenas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_senasparticulares_regionsenas` FOREIGN KEY (`idregion`) REFERENCES `regionsenas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_senasparticulares_tiposenas` FOREIGN KEY (`idtipo`) REFERENCES `tiposenas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_senasparticulares_vistasenas` FOREIGN KEY (`idvista`) REFERENCES `vistasenas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.senasparticulares: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.sexo
CREATE TABLE IF NOT EXISTS `sexo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.sexo: ~6 rows (aproximadamente)
INSERT INTO `sexo` (`id`, `nombre`) VALUES
	(1, 'Hombre'),
	(2, 'Mujer'),
	(3, 'Baja'),
	(4, 'No especifica'),
	(5, 'Otro'),
	(6, 'Pendiente');

-- Volcando estructura para tabla cicebv.situacion_persona
CREATE TABLE IF NOT EXISTS `situacion_persona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.situacion_persona: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.status
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.status: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.status_ficha
CREATE TABLE IF NOT EXISTS `status_ficha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.status_ficha: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.telefono
CREATE TABLE IF NOT EXISTS `telefono` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lada` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.telefono: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.tipodeintrumetoentrevista
CREATE TABLE IF NOT EXISTS `tipodeintrumetoentrevista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipodeintrumeto` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.tipodeintrumetoentrevista: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.tipodeobjeto
CREATE TABLE IF NOT EXISTS `tipodeobjeto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.tipodeobjeto: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.tipodeposito
CREATE TABLE IF NOT EXISTS `tipodeposito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombredeposito` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.tipodeposito: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.tipodereporte
CREATE TABLE IF NOT EXISTS `tipodereporte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.tipodereporte: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.tiporesto
CREATE TABLE IF NOT EXISTS `tiporesto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.tiporesto: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.tiporesto_resto
CREATE TABLE IF NOT EXISTS `tiporesto_resto` (
  `idresto` int(11) NOT NULL,
  `idtiporesto` int(11) NOT NULL,
  PRIMARY KEY (`idtiporesto`,`idresto`) USING BTREE,
  KEY `fk_Tiporesto_has_Resto_Resto1_idx` (`idresto`) USING BTREE,
  KEY `fk_Tiporesto_has_Resto_Tiporesto1_idx` (`idtiporesto`) USING BTREE,
  CONSTRAINT `fk_Tiporesto_has_Resto_Resto1` FOREIGN KEY (`idresto`) REFERENCES `resto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tiporesto_has_Resto_Tiporesto1` FOREIGN KEY (`idtiporesto`) REFERENCES `tiporesto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.tiporesto_resto: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.tiposenas
CREATE TABLE IF NOT EXISTS `tiposenas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `registrode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.tiposenas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.tipovehiculo
CREATE TABLE IF NOT EXISTS `tipovehiculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombretipo` varchar(45) DEFAULT NULL,
  `prioridad` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.tipovehiculo: ~6 rows (aproximadamente)
INSERT INTO `tipovehiculo` (`id`, `nombretipo`, `prioridad`) VALUES
	(1, 'Propio', NULL),
	(2, 'Laboral', NULL),
	(3, 'Oficial', NULL),
	(4, 'Patrulla', NULL),
	(5, 'Vehículo militar', NULL);

-- Volcando estructura para tabla cicebv.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla cicebv.users: ~1 rows (aproximadamente)
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(3, 'jon', 'adm7658@gmail.com', NULL, '$2y$12$5OyZFsvjJga78rii4xywjuwjZnDgZAFVE15UDsthfd1TVqABdMfFa', NULL, '2024-01-31 19:06:43', '2024-01-31 19:06:43');

-- Volcando estructura para tabla cicebv.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.usuario: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.usuario_has_puesto
CREATE TABLE IF NOT EXISTS `usuario_has_puesto` (
  `idusuario` int(11) NOT NULL,
  `idpuesto` int(11) NOT NULL,
  PRIMARY KEY (`idusuario`,`idpuesto`) USING BTREE,
  KEY `fk_usuario_has_puesto_usuario1_idx` (`idusuario`) USING BTREE,
  KEY `idpuesto` (`idpuesto`),
  CONSTRAINT `FK_usuario_has_puesto_puesto` FOREIGN KEY (`idpuesto`) REFERENCES `puesto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_has_puesto_usuario1` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.usuario_has_puesto: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.valor_caracteristicasfisicas
CREATE TABLE IF NOT EXISTS `valor_caracteristicasfisicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcaracteristica` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `valorminimo` varchar(45) DEFAULT NULL,
  `valormaximo` varchar(45) DEFAULT NULL,
  `obligatorio` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_valor_caracteristicasfisicas_caracteristica11_idx` (`idcaracteristica`) USING BTREE,
  CONSTRAINT `fk_valor_caracteristicasfisicas_caracteristica11` FOREIGN KEY (`idcaracteristica`) REFERENCES `caracteristicasfisicas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.valor_caracteristicasfisicas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.vistasenas
CREATE TABLE IF NOT EXISTS `vistasenas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(50) DEFAULT NULL,
  `registrode` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.vistasenas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla cicebv.zonas
CREATE TABLE IF NOT EXISTS `zonas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `abreviacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla cicebv.zonas: ~2 rows (aproximadamente)
INSERT INTO `zonas` (`id`, `nombre`, `abreviacion`) VALUES
	(1, 'Zona Norte', 'ZN'),
	(2, 'Zona Centro', 'ZC'),
	(3, 'Zona Sur', 'ZS');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
