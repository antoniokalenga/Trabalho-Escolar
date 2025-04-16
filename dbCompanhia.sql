-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 17-Abr-2025 às 00:00
-- Versão do servidor: 10.4.28-MariaDB
-- versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbCompanhia`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbConstrutoras`
--

CREATE TABLE `tbConstrutoras` (
  `idConstrutora` int(11) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `tipo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbDependencia`
--

CREATE TABLE `tbDependencia` (
  `idDependencia` int(11) NOT NULL,
  `direcao` varchar(150) NOT NULL,
  `area_geografica` varchar(7) NOT NULL,
  `id_Provincia` int(11) NOT NULL,
  `id_Construtora` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbEmpregados`
--

CREATE TABLE `tbEmpregados` (
  `BI` varchar(13) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `especialidade` varchar(10) NOT NULL,
  `salario` decimal(7,2) NOT NULL,
  `id_Dependencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbProvincias`
--

CREATE TABLE `tbProvincias` (
  `idProvincia` int(11) NOT NULL,
  `nome` varchar(25) NOT NULL,
  `area_geografica` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `tbConstrutoras`
--
ALTER TABLE `tbConstrutoras`
  ADD PRIMARY KEY (`idConstrutora`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `tbDependencia`
--
ALTER TABLE `tbDependencia`
  ADD PRIMARY KEY (`idDependencia`),
  ADD KEY `id_Provincia` (`id_Provincia`),
  ADD KEY `id_Construtora` (`id_Construtora`);

--
-- Índices para tabela `tbEmpregados`
--
ALTER TABLE `tbEmpregados`
  ADD PRIMARY KEY (`BI`),
  ADD KEY `id_Dependencia` (`id_Dependencia`);

--
-- Índices para tabela `tbProvincias`
--
ALTER TABLE `tbProvincias`
  ADD PRIMARY KEY (`idProvincia`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbDependencia`
--
ALTER TABLE `tbDependencia`
  MODIFY `idDependencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbProvincias`
--
ALTER TABLE `tbProvincias`
  MODIFY `idProvincia` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `tbDependencia`
--
ALTER TABLE `tbDependencia`
  ADD CONSTRAINT `tbdependencia_ibfk_1` FOREIGN KEY (`id_Provincia`) REFERENCES `tbProvincias` (`idProvincia`),
  ADD CONSTRAINT `tbdependencia_ibfk_2` FOREIGN KEY (`id_Construtora`) REFERENCES `tbConstrutoras` (`idConstrutora`);

--
-- Limitadores para a tabela `tbEmpregados`
--
ALTER TABLE `tbEmpregados`
  ADD CONSTRAINT `tbempregados_ibfk_1` FOREIGN KEY (`id_Dependencia`) REFERENCES `tbDependencia` (`idDependencia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
