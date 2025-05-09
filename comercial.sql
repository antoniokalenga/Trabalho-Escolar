-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 09-Maio-2025 às 10:34
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
-- Banco de dados: `comercial`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comclien`
--
-- Criação: 09-Maio-2025 às 08:30
-- Última actualização: 09-Maio-2025 às 07:18
--

CREATE TABLE `comclien` (
  `n_numeclien` int(11) NOT NULL,
  `c_codiclien` varchar(10) DEFAULT NULL,
  `c_nomeclien` varchar(100) DEFAULT NULL,
  `c_razaclien` varchar(100) DEFAULT NULL,
  `d_dataclien` date DEFAULT NULL,
  `c_cnpjclien` varchar(20) DEFAULT NULL,
  `c_foneclien` varchar(20) DEFAULT NULL,
  `c_cidaclien` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `comclien`:
--

--
-- Extraindo dados da tabela `comclien`
--

INSERT INTO `comclien` (`n_numeclien`, `c_codiclien`, `c_nomeclien`, `c_razaclien`, `d_dataclien`, `c_cnpjclien`, `c_foneclien`, `c_cidaclien`) VALUES
(1, 'A0001', 'AANDRESS', ' António André', '2012-01-01', '555/010101', '(+244)933-777-333', NULL),
(3, 'A0003', 'BEATRIZ', ' Luisa Beatriz', '2022-05-11', '777/010101', '(+244)931-755-311', NULL),
(4, 'A0004', 'NUNES', ' Karl Nunes', '2015-10-05', '888/010101', '(+244)930-744-300', NULL),
(5, 'A0005', 'GRAÇA', ' Vera Graça', '2017-07-07', '999/010101', '(+244)929-666-111', NULL),
(6, 'A0006', 'SEIS', ' Osvaldo Seis', '2018-09-01', '121/010101', '(+244)928-777-222', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comforne`
--
-- Criação: 08-Maio-2025 às 21:47
-- Última actualização: 09-Maio-2025 às 07:29
--

CREATE TABLE `comforne` (
  `n_numeforne` int(11) NOT NULL,
  `c_codiforne` varchar(10) DEFAULT NULL,
  `c_nomeforne` varchar(100) DEFAULT NULL,
  `c_razaforne` varchar(100) DEFAULT NULL,
  `c_foneforne` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `comforne`:
--

--
-- Extraindo dados da tabela `comforne`
--

INSERT INTO `comforne` (`n_numeforne`, `c_codiforne`, `c_nomeforne`, `c_razaforne`, `c_foneforne`) VALUES
(1, 'F0001', 'LARRUSSO', 'Osvaldo Larusso', '(244) 911-000-111'),
(2, 'F0002', 'BET', 'Premier Bet', '(244) 901-010-101'),
(3, 'F0003', 'Francis', 'Teor del France', '(244) 910-100-001'),
(4, 'F0004', 'Grass', 'Flor Grass', '(244) 902-110-001');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comivenda`
--
-- Criação: 09-Maio-2025 às 07:14
--

CREATE TABLE `comivenda` (
  `n_numeivenda` int(11) NOT NULL,
  `n_numevenda` int(11) NOT NULL,
  `n_numeprodu` int(11) NOT NULL,
  `n_valoivenda` float(10,2) DEFAULT NULL,
  `n_qtdeivenda` int(11) DEFAULT NULL,
  `n_descivenda` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `comivenda`:
--   `n_numeprodu`
--       `comprodu` -> `n_numeprodu`
--   `n_numevenda`
--       `comvenda` -> `n_numevenda`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comprodu`
--
-- Criação: 09-Maio-2025 às 07:40
-- Última actualização: 09-Maio-2025 às 07:58
--

CREATE TABLE `comprodu` (
  `n_numeprodu` int(11) NOT NULL,
  `c_codiprodu` varchar(20) DEFAULT NULL,
  `c_descprodu` varchar(100) DEFAULT NULL,
  `n_valoprodu` float(10,2) DEFAULT NULL,
  `c_situprodu` varchar(1) DEFAULT NULL,
  `n_numeforne` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `comprodu`:
--   `n_numeforne`
--       `comforne` -> `n_numeforne`
--

--
-- Extraindo dados da tabela `comprodu`
--

INSERT INTO `comprodu` (`n_numeprodu`, `c_codiprodu`, `c_descprodu`, `n_valoprodu`, `c_situprodu`, `n_numeforne`) VALUES
(1, 'P01', 'Arroz de 25kg', 25000.19, 'V', 1),
(2, 'P02', 'Feijão de 25kg', 27000.19, 'B', 2),
(3, 'P03', 'Massa Alimentar de 25kg', 25000.19, 'C', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comvenda`
--
-- Criação: 09-Maio-2025 às 08:21
-- Última actualização: 09-Maio-2025 às 08:21
--

CREATE TABLE `comvenda` (
  `n_numevenda` int(11) NOT NULL,
  `c_codivenda` varchar(10) DEFAULT NULL,
  `n_numeclien` int(11) NOT NULL,
  `n_numeforne` int(11) NOT NULL,
  `n_numevende` int(11) NOT NULL,
  `n_valovenda` float(10,2) DEFAULT NULL,
  `n_descvenda` float(10,2) DEFAULT NULL,
  `n_totavenda` float(10,2) DEFAULT NULL,
  `d_datavenda` date DEFAULT NULL,
  `n_vcomvenda` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `comvenda`:
--   `n_numeclien`
--       `comclien` -> `n_numeclien`
--   `n_numeforne`
--       `comforne` -> `n_numeforne`
--   `n_numevende`
--       `comvende` -> `n_numevende`
--   `n_numeclien`
--       `comclien` -> `n_numeclien`
--

--
-- Extraindo dados da tabela `comvenda`
--

INSERT INTO `comvenda` (`n_numevenda`, `c_codivenda`, `n_numeclien`, `n_numeforne`, `n_numevende`, `n_valovenda`, `n_descvenda`, `n_totavenda`, `d_datavenda`, `n_vcomvenda`) VALUES
(4, 'VEN 01', 4, 1, 1, 255000.09, 1.00, 500000.00, '2015-01-12', NULL),
(5, 'VEN 02', 5, 2, 2, 200000.09, 2.00, 1000000.00, '2017-02-22', NULL),
(6, 'VEN 03', 6, 3, 3, 155000.09, 3.00, 2000000.00, '2018-03-02', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comvende`
--
-- Criação: 08-Maio-2025 às 22:12
-- Última actualização: 09-Maio-2025 às 07:36
--

CREATE TABLE `comvende` (
  `n_numevende` int(11) NOT NULL,
  `c_codivende` varchar(10) DEFAULT NULL,
  `c_nomevende` varchar(100) DEFAULT NULL,
  `c_razavende` varchar(100) DEFAULT NULL,
  `c_fonevende` varchar(20) DEFAULT NULL,
  `n_porcvende` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- RELACIONAMENTOS PARA TABELAS `comvende`:
--

--
-- Extraindo dados da tabela `comvende`
--

INSERT INTO `comvende` (`n_numevende`, `c_codivende`, `c_nomevende`, `c_razavende`, `c_fonevende`, `n_porcvende`) VALUES
(1, 'V001', 'Stars', 'Ester Stars', '(244)928-188-818', 25.15),
(2, 'V002', 'Bers', 'Luisa Bers', '(244)928-888-181', 20.75),
(3, 'V003', 'Ders', 'Vera Ders', '(244)928-181-111', 23.05);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `comclien`
--
ALTER TABLE `comclien`
  ADD PRIMARY KEY (`n_numeclien`),
  ADD KEY `idx_comclien_3` (`c_razaclien`),
  ADD KEY `idx_comclien_4` (`c_codiclien`);

--
-- Índices para tabela `comforne`
--
ALTER TABLE `comforne`
  ADD PRIMARY KEY (`n_numeforne`);

--
-- Índices para tabela `comivenda`
--
ALTER TABLE `comivenda`
  ADD PRIMARY KEY (`n_numeivenda`),
  ADD KEY `fk_comivenda_comprodu` (`n_numeprodu`),
  ADD KEY `fk_comivenda_comvenda` (`n_numevenda`);

--
-- Índices para tabela `comprodu`
--
ALTER TABLE `comprodu`
  ADD PRIMARY KEY (`n_numeprodu`),
  ADD KEY `fk_forne_produ` (`n_numeforne`);

--
-- Índices para tabela `comvenda`
--
ALTER TABLE `comvenda`
  ADD PRIMARY KEY (`n_numevenda`),
  ADD KEY `fk_comprodu_comforne` (`n_numeforne`),
  ADD KEY `fk_comprodu_comvende` (`n_numevende`),
  ADD KEY `fk_clien_compra` (`n_numeclien`);

--
-- Índices para tabela `comvende`
--
ALTER TABLE `comvende`
  ADD PRIMARY KEY (`n_numevende`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `comclien`
--
ALTER TABLE `comclien`
  MODIFY `n_numeclien` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `comforne`
--
ALTER TABLE `comforne`
  MODIFY `n_numeforne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `comivenda`
--
ALTER TABLE `comivenda`
  MODIFY `n_numeivenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `comprodu`
--
ALTER TABLE `comprodu`
  MODIFY `n_numeprodu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `comvenda`
--
ALTER TABLE `comvenda`
  MODIFY `n_numevenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `comvende`
--
ALTER TABLE `comvende`
  MODIFY `n_numevende` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `comivenda`
--
ALTER TABLE `comivenda`
  ADD CONSTRAINT `fk_comivenda_comprodu` FOREIGN KEY (`n_numeprodu`) REFERENCES `comprodu` (`n_numeprodu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comivenda_comvenda` FOREIGN KEY (`n_numevenda`) REFERENCES `comvenda` (`n_numevenda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `comprodu`
--
ALTER TABLE `comprodu`
  ADD CONSTRAINT `fk_forne_produ` FOREIGN KEY (`n_numeforne`) REFERENCES `comforne` (`n_numeforne`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `comvenda`
--
ALTER TABLE `comvenda`
  ADD CONSTRAINT `fk_clien_compra` FOREIGN KEY (`n_numeclien`) REFERENCES `comclien` (`n_numeclien`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comprodu_comforne` FOREIGN KEY (`n_numeforne`) REFERENCES `comforne` (`n_numeforne`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comprodu_comvende` FOREIGN KEY (`n_numevende`) REFERENCES `comvende` (`n_numevende`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comvenda_comclien` FOREIGN KEY (`n_numeclien`) REFERENCES `comclien` (`n_numeclien`) ON DELETE NO ACTION ON UPDATE NO ACTION;


--
-- Metadata
--
USE `phpmyadmin`;

--
-- Metadata para tabela comclien
--

--
-- Metadata para tabela comforne
--

--
-- Metadata para tabela comivenda
--

--
-- Metadata para tabela comprodu
--

--
-- Metadata para tabela comvenda
--

--
-- Metadata para tabela comvende
--

--
-- Metadata para o banco de dados comercial
--
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
