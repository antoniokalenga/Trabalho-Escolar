-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 17-Abr-2025 às 01:24
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
-- Banco de dados: `dbUniversidade`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `Aluno_Professor`
--

CREATE TABLE `Aluno_Professor` (
  `idEstudante` char(13) NOT NULL,
  `idProfessor` char(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbDepartamento`
--

CREATE TABLE `tbDepartamento` (
  `idDepartamento` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `especialidade` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbDisciplina`
--

CREATE TABLE `tbDisciplina` (
  `idDisciplina` int(11) NOT NULL,
  `nome` varchar(15) NOT NULL,
  `descricao` varchar(30) NOT NULL,
  `id_Departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbEstudante`
--

CREATE TABLE `tbEstudante` (
  `biEstudante` char(13) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `curso` varchar(15) NOT NULL,
  `ano` tinyint(1) NOT NULL,
  `idPadrinho` char(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbProfessores`
--

CREATE TABLE `tbProfessores` (
  `biProfessores` char(13) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `id_Departamento` int(11) NOT NULL,
  `categoria` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Aluno_Professor`
--
ALTER TABLE `Aluno_Professor`
  ADD PRIMARY KEY (`idEstudante`,`idProfessor`),
  ADD KEY `idProfessor` (`idProfessor`);

--
-- Índices para tabela `tbDepartamento`
--
ALTER TABLE `tbDepartamento`
  ADD PRIMARY KEY (`idDepartamento`);

--
-- Índices para tabela `tbDisciplina`
--
ALTER TABLE `tbDisciplina`
  ADD PRIMARY KEY (`idDisciplina`),
  ADD KEY `id_Departamento` (`id_Departamento`);

--
-- Índices para tabela `tbEstudante`
--
ALTER TABLE `tbEstudante`
  ADD PRIMARY KEY (`biEstudante`),
  ADD KEY `idPadrinho` (`idPadrinho`);

--
-- Índices para tabela `tbProfessores`
--
ALTER TABLE `tbProfessores`
  ADD PRIMARY KEY (`biProfessores`),
  ADD KEY `id_Departamento` (`id_Departamento`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbDepartamento`
--
ALTER TABLE `tbDepartamento`
  MODIFY `idDepartamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbDisciplina`
--
ALTER TABLE `tbDisciplina`
  MODIFY `idDisciplina` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `Aluno_Professor`
--
ALTER TABLE `Aluno_Professor`
  ADD CONSTRAINT `aluno_professor_ibfk_1` FOREIGN KEY (`idEstudante`) REFERENCES `tbEstudante` (`biEstudante`),
  ADD CONSTRAINT `aluno_professor_ibfk_2` FOREIGN KEY (`idProfessor`) REFERENCES `tbProfessores` (`biProfessores`);

--
-- Limitadores para a tabela `tbDisciplina`
--
ALTER TABLE `tbDisciplina`
  ADD CONSTRAINT `tbdisciplina_ibfk_1` FOREIGN KEY (`id_Departamento`) REFERENCES `tbDepartamento` (`idDepartamento`);

--
-- Limitadores para a tabela `tbEstudante`
--
ALTER TABLE `tbEstudante`
  ADD CONSTRAINT `tbestudante_ibfk_1` FOREIGN KEY (`idPadrinho`) REFERENCES `tbEstudante` (`biEstudante`);

--
-- Limitadores para a tabela `tbProfessores`
--
ALTER TABLE `tbProfessores`
  ADD CONSTRAINT `tbprofessores_ibfk_1` FOREIGN KEY (`id_Departamento`) REFERENCES `tbDepartamento` (`idDepartamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
