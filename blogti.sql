-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 12, 2020 at 10:12 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogti`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `buscaNoticia`
-- (See below for the actual view)
--
CREATE TABLE `buscaNoticia` (
`tipo_post_id` int(11)
,`tipo_post` varchar(255)
,`id_post` int(11)
,`titulo` varchar(255)
,`post` longtext
,`data` datetime
,`linguagem_id` int(11)
,`resolvido` int(11)
,`linguagem` varchar(255)
,`usuario` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `BuscaPostComents`
-- (See below for the actual view)
--
CREATE TABLE `BuscaPostComents` (
`tipo_post_id` int(11)
,`tipo_post` varchar(255)
,`id_post` int(11)
,`titulo` varchar(255)
,`post` longtext
,`data` datetime
,`linguagem_id` int(11)
,`linguagem` varchar(255)
,`usuario` varchar(255)
);

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `descricao` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `descricao`) VALUES
(1, 'Notícias'),
(2, 'Perguntas'),
(3, 'Dicas');

-- --------------------------------------------------------

--
-- Table structure for table `Comentarios`
--

CREATE TABLE `Comentarios` (
  `id_comentario` int(11) NOT NULL,
  `id_post` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `mensagem` longtext CHARACTER SET utf8 NOT NULL,
  `dataHora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Comentarios`
--

INSERT INTO `Comentarios` (`id_comentario`, `id_post`, `id_usuario`, `mensagem`, `dataHora`) VALUES
(1, 1, 1, 'Comentario de exemplo alteredsdsd', '2020-11-10 15:35:54'),
(2, 3, 1, 'Sim, concordo plenamente ', '2020-11-12 15:11:17'),
(9, 4, 3, 'Olá este e apenas um teste', '2020-11-09 23:50:15'),
(10, 4, 3, 'Aqui tem um comentario', '2020-11-10 17:40:19'),
(11, 4, 3, 'Este é apenas um teste ', '2020-11-09 23:50:35'),
(12, 4, 1, 'Basta realizar uma simples pesquisa no youtube.', '2020-11-11 21:27:05'),
(13, 4, 3, 'Comentario de exemplo', '2020-11-10 15:19:21'),
(14, 1, 1, 'Teste', '2020-11-10 15:34:14'),
(15, 4, 3, 'Sera que aparece? ', '2020-11-10 17:40:27'),
(17, 4, 3, 'teste', '2020-11-11 14:35:03'),
(18, 10, 3, 'dadsad', '2020-11-11 14:40:44'),
(19, 10, 3, 'dasdasdas', '2020-11-11 14:40:49'),
(20, 6, 3, 'ssss', '2020-11-11 14:57:28'),
(22, 11, 3, 'Comentário de teste', '2020-11-11 21:20:36'),
(27, 6, 1, 'Com certeza!\r\n', '2020-11-11 21:28:57'),
(31, 13, 1, 'olá, isto é um teste', '2020-11-11 21:16:07'),
(32, 14, 1, 'Explicação top. Parabéns', '2020-11-11 21:42:06'),
(36, 15, 1, 'Olá, tente utilizar isto:\r\n<?php \r\n                   $date = $comentarios[dataHora];\r\n                    $dataHora = date(d/m/Y H:i:s, strtotime($date));\r\n?>', '2020-11-12 15:17:00'),
(41, 15, 3, 'OK deu certo', '2020-11-12 19:33:27');

-- --------------------------------------------------------

--
-- Stand-in structure for view `comentariosUsuario`
-- (See below for the actual view)
--
CREATE TABLE `comentariosUsuario` (
`nome` varchar(255)
,`id_usuario` int(11)
,`id_post` int(11)
,`id_comentario` int(11)
,`mensagem` longtext
,`dataHora` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `LinguagensProgramacao`
--

CREATE TABLE `LinguagensProgramacao` (
  `id_linguagem` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `LinguagensProgramacao`
--

INSERT INTO `LinguagensProgramacao` (`id_linguagem`, `nome`) VALUES
(1, 'PHP'),
(2, 'JAVA'),
(3, 'JAVASCRIPT'),
(4, 'C++');

-- --------------------------------------------------------

--
-- Table structure for table `Post`
--

CREATE TABLE `Post` (
  `id_post` int(11) NOT NULL,
  `tipo_post` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descricao` longtext NOT NULL,
  `linguagem_programacao` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `dataHora` datetime NOT NULL,
  `resolvido` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Post`
--

INSERT INTO `Post` (`id_post`, `tipo_post`, `titulo`, `descricao`, `linguagem_programacao`, `id_usuario`, `dataHora`, `resolvido`) VALUES
(2, 0, 'PHP é a nova linguagem padão da web', ' dsadasdsadasdas', 0, 1, '0000-00-00 00:00:00', NULL),
(3, 2, 'PHP Avança cada vez mais ', '             O PHP tem ganhado cada vez mercado, principalmente de aplicações. Oque se sabe sobre isto, é que cada vez o php tem ganhado mais e mais espaço no mercado, oque faz com que ele seja cada vez mais usado no mundo.          O PHP tem ganhado cada vez mercado, principalmente de aplicações. Oque se sabe sobre isto, é que cada vez o php tem ganhado mais e mais espaço no mercado, oque faz com que ele seja cada vez mais usado no mundo.          O PHP tem ganhado cada vez mercado, principalmente de aplicações. Oque se sabe sobre isto, é que cada vez o php tem ganhado mais e mais espaço no mercado, oque faz com que ele seja cada vez mais usado no mundo.          O PHP tem ganhado cada vez mercado, principalmente de aplicações. Oque se sabe sobre isto, é que cada vez o php tem ganhado mais e mais espaço no mercado, oque faz com que ele seja cada vez mais usado no mundo.          O PHP tem ganhado cada vez mercado, principalmente de aplicações. Oque se sabe sobre isto, é que cada vez o php tem ganhado mais e mais espaço no mercado, oque faz com que ele seja cada vez mais usado no mundo.          O PHP tem ganhado cada vez mercado, principalmente de aplicações. Oque se sabe sobre isto, é que cada vez o php tem ganhado mais e mais espaço no mercado, oque faz com que ele seja cada vez mais usado no mundo.          O PHP tem ganhado cada vez mercado, principalmente de aplicações. Oque se sabe sobre isto, é que cada vez o php tem ganhado mais e mais espaço no mercado, oque faz com que ele seja cada vez mais usado no mundo.          O PHP tem ganhado cada vez mercado, principalmente de aplicações. Oque se sabe sobre isto, é que cada vez o php tem ganhado mais e mais espaço no mercado, oque faz com que ele seja cada vez mais usado no mundo.', 1, 1, '2020-11-11 21:27:36', 1),
(4, 0, 'Como conectar ao banco de dados?', '     Olá pessoal. Como conectar minha aplicação em PHP com mysql? Muito obrigado!', 0, 1, '2020-11-11 21:39:03', 1),
(6, 3, 'Este é uma dica muito interessante - Faça backup ', '      Sempre faça backup de seus dados, porque você pode perder tudo em segundos!!\r\nEm informática, cópia de segurança (em inglês: backup) é a cópia de dados de um dispositivo de armazenamento a outro para que possam ser restaurados em caso da perda dos dados originais, o que pode envolver apagamentos acidentais ou corrupção de dados.[1][2]\r\n\r\nMeios difundidos de cópias de segurança incluem CD-ROM, DVD, disco rígido, disco rígido externo (compatíveis com USB), fitas magnéticas e a cópia de segurança externa (online). Esta transporta os dados por uma rede como a Internet para outro ambiente, geralmente para equipamentos mais sofisticados, de grande porte e alta segurança. Outra forma pouco difundida de cópia de segurança é feita via rede. Na própria rede local de computadores, o administrador ou o responsável pela cópia de segurança grava os dados em um formato de arquivo, processa e distribui as partes constituintes da cópia nos computadores da rede, de forma segura (arquivos são protegidos), criptografada (para não haver extração ou acesso aos dados na forma original) e oculta (na maioria das vezes o arquivo é ocultado).\r\n\r\nCópias de segurança são geralmente confundidas com arquivos e sistemas tolerantes a falhas. Diferem de arquivos pois enquanto arquivos são cópias primárias dos dados, cópias de segurança são cópias secundárias dos dados. Diferem de sistemas tolerantes a falhas pois cópias de segurança assumem que a falha causará a perda dos dados, enquanto sistemas tolerantes a falhas assumem que a falha não causará.\r\n\r\nAs cópias de segurança devem obedecer vários parâmetros, tais como: o tempo de execução, a periodicidade, a quantidade de exemplares das cópias armazenadas, o tempo que as cópias devem ser mantidas, a capacidade de armazenamento, o método de rotatividade entre os dispositivos, a compressão e criptografia dos dados. Assim, a velocidade de execução da cópia deve ser aumentada tanto quanto possível para que o grau de interferência desse procedimento nos serviços seja mínimo. A periodicidade deve ser analisada em função da quantidade de dados alterados na organização, no entanto se o volume de dados for elevado, as cópias devem ser diárias. Deve-se estabelecer um horário para realização da cópia, conforme a laboração da organização, devendo ser preferencialmente nocturno. Para uma fácil localização, a cópia deve ser guardada por data e categoria, em local seguro.', 1, 1, '2020-11-11 21:40:23', NULL),
(11, 1, 'PHP será substituido pelo node?', '  Node.js é uma plataforma para execução de código JavaScript no servidor que se baseia no interpretador V8 do Google Chrome.\r\n\r\nEle tem ganhado força nos últimos anos por diversos motivos, dois deles são:\r\n\r\nÉ um ponto de entrada para programadores front-end ingressarem no mercado de aplicações server side sem precisar aprender outra linguagem;\r\nTem uma arquitetura voltada para serviços leves que recebem muitas requisições concorrentes, além de permitir uma escalabilidade de projetos mais simples e barata.\r\nEste artigo mostra as principais diferenças entre programar em Node.js e PHP para ingressar com o pé direito na plataforma do ponto de vista de quem está acostumado a trabalhar com PHP.\r\n\r\nModelo de programação\r\nA forma de programar em Node.js difere bastante da forma de programar em PHP. No PHP o comum é o código ser executado sequencialmente, então quando é preciso realizar uma busca em uma fonte externa, por exemplo um banco de dados, fazemos de forma similar a seguinte:', 1, 3, '2020-11-11 21:21:15', 0),
(14, 2, 'Como integrar php com JS? ', ' O javascript não tem como atualizar o valor da variavel PHP, somente o php manipula/cria o JS. Para fazer este update, você vai precisar de um ajax, logo depois de ter alterado o valor da variável com JS...caso seja essa a questão.\r\n\r\nO PHP corre do lado do servidor para criar a página, e o JS corre do lado do cliente com a página já criada. A unica maneira deles \"falarem\" é via ajax.\r\n\r\nSe estiver utilizando um framework, como zend e etc, você geralmente utiliza um template engine para trabalhar com variáveis no HTML, podendo tambem passar estas variáveis para o JS, exemplo de uso de variaveis com o template engine RainTpl\r\n\r\n', 1, 1, '2020-11-11 21:41:47', 1),
(15, 2, 'Como converter a hora para o padão brasileiro :D', '   Olá pessoal. Realizei uma busca no banco de dados e gostaria de saber como converter a hora do formato padrão para o formato brasileiro.\r\n\r\nexe: 2020/11/11\r\nGostaria de ficar assim: 11/11/2020 \r\n\r\nMuito Obrigada!', 1, 3, '2020-11-12 19:33:10', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nivel_acesso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome`, `email`, `senha`, `nivel_acesso`) VALUES
(1, 'Daniel', 'daniel@email.com', '12345', 2),
(2, '', '', '', 1),
(3, 'Ingryd Furlaneti', 'ingryd@email.com', '1234', 1);

-- --------------------------------------------------------

--
-- Structure for view `buscaNoticia`
--
DROP TABLE IF EXISTS `buscaNoticia`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `buscaNoticia`  AS  select `p`.`tipo_post` AS `tipo_post_id`,`c`.`descricao` AS `tipo_post`,`p`.`id_post` AS `id_post`,`p`.`titulo` AS `titulo`,`p`.`descricao` AS `post`,`p`.`dataHora` AS `data`,`p`.`linguagem_programacao` AS `linguagem_id`,`p`.`resolvido` AS `resolvido`,`l`.`nome` AS `linguagem`,`u`.`nome` AS `usuario` from (((`Post` `p` join `categorias` `c` on(`p`.`tipo_post` = `c`.`id_categoria`)) join `LinguagensProgramacao` `l` on(`p`.`linguagem_programacao` = `l`.`id_linguagem`)) join `usuario` `u` on(`p`.`id_usuario` = `u`.`id_usuario`)) ;

-- --------------------------------------------------------

--
-- Structure for view `BuscaPostComents`
--
DROP TABLE IF EXISTS `BuscaPostComents`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `BuscaPostComents`  AS  select `bn`.`tipo_post_id` AS `tipo_post_id`,`bn`.`tipo_post` AS `tipo_post`,`bn`.`id_post` AS `id_post`,`bn`.`titulo` AS `titulo`,`bn`.`post` AS `post`,`bn`.`data` AS `data`,`bn`.`linguagem_id` AS `linguagem_id`,`bn`.`linguagem` AS `linguagem`,`bn`.`usuario` AS `usuario` from `buscaNoticia` `bn` where `bn`.`tipo_post_id` = 2 order by (select count(0) from `comentariosUsuario` `c` where `c`.`id_post` = `bn`.`id_post`) desc ;

-- --------------------------------------------------------

--
-- Structure for view `comentariosUsuario`
--
DROP TABLE IF EXISTS `comentariosUsuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `comentariosUsuario`  AS  select `u`.`nome` AS `nome`,`u`.`id_usuario` AS `id_usuario`,`c`.`id_post` AS `id_post`,`c`.`id_comentario` AS `id_comentario`,`c`.`mensagem` AS `mensagem`,`c`.`dataHora` AS `dataHora` from (`Comentarios` `c` join `usuario` `u` on(`c`.`id_usuario` = `u`.`id_usuario`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `Comentarios`
--
ALTER TABLE `Comentarios`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_postfk` (`id_post`),
  ADD KEY `id_usuario_fk` (`id_usuario`);

--
-- Indexes for table `LinguagensProgramacao`
--
ALTER TABLE `LinguagensProgramacao`
  ADD PRIMARY KEY (`id_linguagem`);

--
-- Indexes for table `Post`
--
ALTER TABLE `Post`
  ADD PRIMARY KEY (`id_post`),
  ADD KEY `fk_tipo_post` (`tipo_post`),
  ADD KEY `linguagem_programacao_fk` (`linguagem_programacao`) USING BTREE,
  ADD KEY `id_usuario_FK` (`id_usuario`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Comentarios`
--
ALTER TABLE `Comentarios`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `LinguagensProgramacao`
--
ALTER TABLE `LinguagensProgramacao`
  MODIFY `id_linguagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Post`
--
ALTER TABLE `Post`
  MODIFY `id_post` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Comentarios`
--
ALTER TABLE `Comentarios`
  ADD CONSTRAINT `id_usuarioFK` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Post`
--
ALTER TABLE `Post`
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
