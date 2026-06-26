-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/06/2026 às 16:34
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_escola`
--
CREATE DATABASE IF NOT EXISTS `bd_escola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bd_escola`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

DROP TABLE IF EXISTS `alunos`;
CREATE TABLE `alunos` (
  `id_alunos` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `data_nascimento` date DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `telefone` char(14) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos_responsaveis`
--

DROP TABLE IF EXISTS `alunos_responsaveis`;
CREATE TABLE `alunos_responsaveis` (
  `id_alunos` int(11) NOT NULL,
  `id_responsaveis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacoes`
--

DROP TABLE IF EXISTS `avaliacoes`;
CREATE TABLE `avaliacoes` (
  `id_avaliacoes` int(11) NOT NULL,
  `descricao` varchar(120) DEFAULT NULL,
  `data_avaliacao` date DEFAULT NULL,
  `valor` decimal(5,2) DEFAULT NULL,
  `id_disciplinas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `boletins`
--

DROP TABLE IF EXISTS `boletins`;
CREATE TABLE `boletins` (
  `id_boletins` int(11) NOT NULL,
  `id_matriculas` int(11) DEFAULT NULL,
  `notas` decimal(5,2) DEFAULT NULL,
  `media_final` decimal(5,2) DEFAULT NULL,
  `situacao_final` varchar(120) DEFAULT NULL,
  `frequencia` decimal(5,2) DEFAULT NULL,
  `id_avaliacoes` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `coordenadores`
--

DROP TABLE IF EXISTS `coordenadores`;
CREATE TABLE `coordenadores` (
  `id_coordenadores` int(11) NOT NULL,
  `nome` varchar(120) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `telefone` char(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `coordenadores`
--

INSERT INTO `coordenadores` (`id_coordenadores`, `nome`, `cpf`, `email`, `telefone`) VALUES
(1, 'Carlos Henrique', '11111111111', 'carlos@escola.com', '11999990001'),
(2, 'Fernanda Lima', '22222222222', 'fernanda@escola.com', '11999990002'),
(3, 'Ricardo Souza', '33333333333', 'ricardo@escola.com', '11999990003'),
(4, 'Juliana Martins', '44444444444', 'juliana@escola.com', '11999990004'),
(5, 'Eduardo Alves', '55555555555', 'eduardo@escola.com', '11999990005');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `id_cursos` int(11) NOT NULL,
  `nome` varchar(120) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `duracao` int(11) DEFAULT NULL,
  `descricao` varchar(120) DEFAULT NULL,
  `id_coordenadores` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`id_cursos`, `nome`, `carga_horaria`, `duracao`, `descricao`, `id_coordenadores`) VALUES
(1, 'Desenvolvimento de Sistemas', 1200, 18, 'Curso técnico em Desenvolvimento de Sistemas', 1),
(2, 'Redes de Computadores', 1200, 18, 'Curso técnico em Redes de Computadores', 2),
(3, 'Informática para Internet', 1200, 18, 'Curso técnico em Informática para Internet', 3),
(4, 'Banco de Dados', 1200, 18, 'Curso técnico em Banco de Dados', 4),
(5, 'Segurança da Informação', 1200, 18, 'Curso técnico em Segurança da Informação', 5);

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplinas`
--

DROP TABLE IF EXISTS `disciplinas`;
CREATE TABLE `disciplinas` (
  `id_disciplinas` int(11) NOT NULL,
  `nome` varchar(120) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `id_cursos` int(11) DEFAULT NULL,
  `id_professores` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco`
--

DROP TABLE IF EXISTS `endereco`;
CREATE TABLE `endereco` (
  `id_endereco` int(11) NOT NULL,
  `id_alunos` int(11) DEFAULT NULL,
  `rua` varchar(150) DEFAULT NULL,
  `bairro` varchar(150) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
CREATE TABLE `matriculas` (
  `id_matriculas` int(11) NOT NULL,
  `data_matricula` date DEFAULT NULL,
  `situacao` varchar(120) DEFAULT NULL,
  `id_aluno` int(11) DEFAULT NULL,
  `id_turma` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores`
--

DROP TABLE IF EXISTS `professores`;
CREATE TABLE `professores` (
  `id_professores` int(11) NOT NULL,
  `nome` varchar(120) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `formacao` varchar(120) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `telefone` char(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `professores`
--

INSERT INTO `professores` (`id_professores`, `nome`, `cpf`, `formacao`, `email`, `telefone`) VALUES
(1, 'Ana Paula', '10000000001', 'Ciência da Computação', 'ana@escola.com', '11988880001'),
(2, 'Bruno Silva', '10000000002', 'Sistemas de Informação', 'bruno@escola.com', '11988880002'),
(3, 'Camila Rocha', '10000000003', 'Engenharia da Computação', 'camila@escola.com', '11988880003'),
(4, 'Daniel Costa', '10000000004', 'Matemática', 'daniel@escola.com', '11988880004'),
(5, 'Elaine Souza', '10000000005', 'Redes de Computadores', 'elaine@escola.com', '11988880005'),
(6, 'Felipe Lima', '10000000006', 'Banco de Dados', 'felipe@escola.com', '11988880006'),
(7, 'Gabriela Alves', '10000000007', 'Análise de Sistemas', 'gabriela@escola.com', '11988880007'),
(8, 'Henrique Melo', '10000000008', 'Engenharia de Software', 'henrique@escola.com', '11988880008'),
(9, 'Isabela Martins', '10000000009', 'Computação', 'isabela@escola.com', '11988880009'),
(10, 'João Pedro', '10000000010', 'Programação', 'joao@escola.com', '11988880010'),
(11, 'Karen Dias', '10000000011', 'Segurança da Informação', 'karen@escola.com', '11988880011'),
(12, 'Leonardo Freitas', '10000000012', 'Banco de Dados', 'leonardo@escola.com', '11988880012'),
(13, 'Mariana Oliveira', '10000000013', 'Computação', 'mariana@escola.com', '11988880013'),
(14, 'Nicolas Ribeiro', '10000000014', 'Engenharia de Software', 'nicolas@escola.com', '11988880014'),
(15, 'Otávio Santos', '10000000015', 'Sistemas de Informação', 'otavio@escola.com', '11988880015'),
(16, 'Patrícia Gomes', '10000000016', 'Análise de Sistemas', 'patricia@escola.com', '11988880016'),
(17, 'Rafael Barbosa', '10000000017', 'Ciência da Computação', 'rafael@escola.com', '11988880017'),
(18, 'Simone Castro', '10000000018', 'Banco de Dados', 'simone@escola.com', '11988880018'),
(19, 'Thiago Fernandes', '10000000019', 'Redes de Computadores', 'thiago@escola.com', '11988880019'),
(20, 'Vanessa Moraes', '10000000020', 'Engenharia da Computação', 'vanessa@escola.com', '11988880020');

-- --------------------------------------------------------

--
-- Estrutura para tabela `responsaveis`
--

DROP TABLE IF EXISTS `responsaveis`;
CREATE TABLE `responsaveis` (
  `id_responsaveis` int(11) NOT NULL,
  `nome` varchar(120) DEFAULT NULL,
  `cpf` char(11) DEFAULT NULL,
  `telefone` char(14) DEFAULT NULL,
  `parentesco` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

DROP TABLE IF EXISTS `turmas`;
CREATE TABLE `turmas` (
  `id_turmas` int(11) NOT NULL,
  `ano_letivo` year(4) DEFAULT NULL,
  `curso` varchar(120) DEFAULT NULL,
  `turnos` varchar(120) DEFAULT NULL,
  `salas` varchar(120) DEFAULT NULL,
  `id_curso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id_alunos`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `alunos_responsaveis`
--
ALTER TABLE `alunos_responsaveis`
  ADD PRIMARY KEY (`id_alunos`,`id_responsaveis`),
  ADD KEY `id_responsaveis` (`id_responsaveis`);

--
-- Índices de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD PRIMARY KEY (`id_avaliacoes`),
  ADD KEY `id_disciplinas` (`id_disciplinas`);

--
-- Índices de tabela `boletins`
--
ALTER TABLE `boletins`
  ADD PRIMARY KEY (`id_boletins`),
  ADD KEY `id_matriculas` (`id_matriculas`),
  ADD KEY `id_avaliacoes` (`id_avaliacoes`);

--
-- Índices de tabela `coordenadores`
--
ALTER TABLE `coordenadores`
  ADD PRIMARY KEY (`id_coordenadores`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id_cursos`),
  ADD KEY `id_coordenadores` (`id_coordenadores`);

--
-- Índices de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id_disciplinas`),
  ADD KEY `id_cursos` (`id_cursos`),
  ADD KEY `id_professores` (`id_professores`);

--
-- Índices de tabela `endereco`
--
ALTER TABLE `endereco`
  ADD PRIMARY KEY (`id_endereco`),
  ADD KEY `id_alunos` (`id_alunos`);

--
-- Índices de tabela `matriculas`
--
ALTER TABLE `matriculas`
  ADD PRIMARY KEY (`id_matriculas`),
  ADD KEY `id_aluno` (`id_aluno`),
  ADD KEY `id_turma` (`id_turma`);

--
-- Índices de tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`id_professores`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `responsaveis`
--
ALTER TABLE `responsaveis`
  ADD PRIMARY KEY (`id_responsaveis`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id_turmas`),
  ADD KEY `id_curso` (`id_curso`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id_alunos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacoes`
--
ALTER TABLE `avaliacoes`
  MODIFY `id_avaliacoes` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `boletins`
--
ALTER TABLE `boletins`
  MODIFY `id_boletins` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `coordenadores`
--
ALTER TABLE `coordenadores`
  MODIFY `id_coordenadores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id_cursos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id_disciplinas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `endereco`
--
ALTER TABLE `endereco`
  MODIFY `id_endereco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `matriculas`
--
ALTER TABLE `matriculas`
  MODIFY `id_matriculas` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `id_professores` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `responsaveis`
--
ALTER TABLE `responsaveis`
  MODIFY `id_responsaveis` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id_turmas` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alunos_responsaveis`
--
ALTER TABLE `alunos_responsaveis`
  ADD CONSTRAINT `alunos_responsaveis_ibfk_1` FOREIGN KEY (`id_alunos`) REFERENCES `alunos` (`id_alunos`),
  ADD CONSTRAINT `alunos_responsaveis_ibfk_2` FOREIGN KEY (`id_responsaveis`) REFERENCES `responsaveis` (`id_responsaveis`);

--
-- Restrições para tabelas `avaliacoes`
--
ALTER TABLE `avaliacoes`
  ADD CONSTRAINT `avaliacoes_ibfk_1` FOREIGN KEY (`id_disciplinas`) REFERENCES `disciplinas` (`id_disciplinas`);

--
-- Restrições para tabelas `boletins`
--
ALTER TABLE `boletins`
  ADD CONSTRAINT `boletins_ibfk_1` FOREIGN KEY (`id_matriculas`) REFERENCES `matriculas` (`id_matriculas`),
  ADD CONSTRAINT `boletins_ibfk_2` FOREIGN KEY (`id_avaliacoes`) REFERENCES `avaliacoes` (`id_avaliacoes`);

--
-- Restrições para tabelas `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `cursos_ibfk_1` FOREIGN KEY (`id_coordenadores`) REFERENCES `coordenadores` (`id_coordenadores`);

--
-- Restrições para tabelas `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD CONSTRAINT `disciplinas_ibfk_1` FOREIGN KEY (`id_cursos`) REFERENCES `cursos` (`id_cursos`),
  ADD CONSTRAINT `disciplinas_ibfk_2` FOREIGN KEY (`id_professores`) REFERENCES `professores` (`id_professores`);

--
-- Restrições para tabelas `endereco`
--
ALTER TABLE `endereco`
  ADD CONSTRAINT `endereco_ibfk_1` FOREIGN KEY (`id_alunos`) REFERENCES `alunos` (`id_alunos`);

--
-- Restrições para tabelas `matriculas`
--
ALTER TABLE `matriculas`
  ADD CONSTRAINT `matriculas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_alunos`),
  ADD CONSTRAINT `matriculas_ibfk_2` FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turmas`);

--
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_cursos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
