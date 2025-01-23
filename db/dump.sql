CREATE DATABASE  IF NOT EXISTS `metallica` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `metallica`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: metallica
-- ------------------------------------------------------
-- Server version	5.6.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artigo`
--

DROP TABLE IF EXISTS `artigo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artigo`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT,
    `nome`       varchar(200)       DEFAULT NULL,
    `imagem`     varchar(45)        DEFAULT NULL,
    `usuario_id` int(11) NOT NULL,
    `data`       timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`, `usuario_id`),
    KEY          `fk_artigo_usuario1_idx` (`usuario_id`),
    CONSTRAINT `fk_artigo_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artigo`
--

LOCK
TABLES `artigo` WRITE;
/*!40000 ALTER TABLE `artigo` DISABLE KEYS */;
INSERT INTO `artigo`
VALUES (1, 'Show do Metallica tem fãs no palco, falhas no som e interrupção', 'img_post.jpg', 1, '2015-11-06 17:42:21'),
       (2, 'Kirk Hammet perdeu celular com 250 ideias', 'hammet1.jpg', 1, '2015-11-06 17:42:21'),
       (3, 'Hammett: Material novo é um pouco mais progressivo que Lords of Summer', 'hammet.jpg', 1,
        '2015-11-06 17:50:20'),
       (4, 'Stone Sour lança cover de \"Creeping Death\", do Metallica', 'stonesour.jpg', 1, '2015-11-06 17:57:25');
/*!40000 ALTER TABLE `artigo` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentario`
(
    `id`         int(11) NOT NULL AUTO_INCREMENT,
    `texto`      text,
    `artigo_id`  int(11) NOT NULL,
    `usuario_id` int(11) NOT NULL,
    `data`       timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`, `artigo_id`, `usuario_id`),
    KEY          `fk_comentario_artigo1_idx` (`artigo_id`),
    KEY          `fk_comentario_usuario1_idx` (`usuario_id`),
    CONSTRAINT `fk_comentario_artigo1` FOREIGN KEY (`artigo_id`) REFERENCES `artigo` (`id`) ON UPDATE NO ACTION,
    CONSTRAINT `fk_comentario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK
TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario`
VALUES (12, 'então você é o bichão?', 2, 1, '2015-11-06 17:43:14'),
       (16, 'my good', 1, 1, '2015-11-06 17:43:14'),
       (17, 'moleque', 1, 1, '2015-11-06 17:43:14'),
       (18, 'seus borra', 1, 2, '2015-11-06 17:43:14'),
       (19, 'haha sou joao krl', 1, 3, '2015-11-06 17:43:14'),
       (20, 'estou testando moleque', 1, 5, '2015-11-06 17:43:14');
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK
TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER dateComentario BEFORE INSERT ON comentario FOR EACH ROW
  SET NEW.data = IFNULL(NEW.data, current_timestamp()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nivel`
(
    `id`   int(11) NOT NULL AUTO_INCREMENT,
    `desc` varchar(45) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK
TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel`
VALUES (1, 'Super Admin'),
       (2, 'Admin'),
       (3, 'Comum');
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `paragrafo`
--

DROP TABLE IF EXISTS `paragrafo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paragrafo`
(
    `id`        int(11) NOT NULL AUTO_INCREMENT,
    `nr`        int(11) DEFAULT NULL,
    `texto`     text,
    `artigo_id` int(11) NOT NULL,
    PRIMARY KEY (`id`, `artigo_id`),
    KEY         `fk_paragrafo_artigo_idx` (`artigo_id`),
    CONSTRAINT `fk_paragrafo_artigo` FOREIGN KEY (`artigo_id`) REFERENCES `artigo` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paragrafo`
--

LOCK
TABLES `paragrafo` WRITE;
/*!40000 ALTER TABLE `paragrafo` DISABLE KEYS */;
INSERT INTO `paragrafo`
VALUES (1, 1,
        'Encarregado de encerrar a segunda noite do Rock in Rio 2015, o Metallica passou por apuros neste sábado (19) no Palco Mundo. Após um apagão no som dos instrumentos de todos os integrantes, a banda teve de sair do palco e interromper o show por cerca de cinco minutos, durante a execução de \"Ride the Lightning\"',
        1),
       (2, 2,
        'Após a primeira de três falhas, o grupo chegou a continuar o show, mas, após um solo do guitarrista Kirk Hammet, não teve jeito: o Rock in Rio 2015 ouviu suas primeiras vaias, várias delas endereçadas a Roberto Medina, criador do festival.',
        1),
       (3, 3,
        'Resolvido o problema, o vocalista e guitarrista James Hetfield voltou com a clássica \"The Unforgiven\", que fez o público esquecer os momentos de tensão. No palco, o Metallica foi profissional. Não reclamou nem comentou sobre o ocorrido, uma das maiores falhas do sistema de som na história do evento. Segundo nota divulgada pela assessoria do Rock in Rio, a parada ocorreu pela \"desconexão da linha de saída de som entre a mesa da banda e a do festival\".',
        1),
       (4, 4,
        'Alheios ao problema, o Metallica entregou seu tradicional show retrospectivo, com faixas de todos os álbuns da carreira --e atraso de 45 minutos, repetindo a demora do Queen no último sábado.',
        1),
       (5, 5,
        'O show é o terceiro consecutivo da banda na edição brasileira do Rock in Rio. Roteiros parecidos. Energia vinda da plateia, idem. Se o Metallica parece fazer sempre a mesma apresentação no país, é impossível dizer que a estratégia não funciona.',
        1),
       (6, 6,
        'O diferencial da vez foi o contato mais próximo com o público. De cima do palco, dezenas de fãs convidados acompanharam de perto o grupo, numa releitura improvisada de seu antigo \"snake pit\" --espaço utilizado na turnê do álbum \"Metallica\" (1991), conhecido também como \"Black Album\".',
        1),
       (7, 7,
        'A execução de \"One\", do álbum \"…and Justice for All\" (1988), foi o primeiro ápice do show, registrada por um cardume de telefones celulares em meio a fumaça cênica. Tempos modernos. Mesmo sem a clássica \"Creeping Death\" no setlist, os fãs da década de 1980 não tiveram muito do que reclamar com a trinca \"Master of Puppets\", \"Fade to Black\" e \"Seek & Destroy\"',
        1),
       (8, 8,
        'O show teve ainda a volta de \"Whiskey in the Jar\" ao repertório, dedicada Cliff Burton, antigo baixista da banda que morreu em 1986 --a música, que é uma canção tradicional irlandesa, foi tocada pela primeira vez no Brasil no ano passado, na turnê \"Metallica By Request\".',
        1),
       (9, 9,
        'Ao fim, fogos de artifício em \"Enter Sandman\", cantada em uníssono, e a promessa que alentou quem já se cansou da mesmice do Metallica: a próxima vinda ao Brasil será com um novo disco de estúdio. Agora, hora de férias para a banda, que deixou para o Rio de Janeiro ser a casa do último show do grupo neste ano.',
        1),
       (10, 1,
        'Kirk Hammett, guitarrista do Metallica, revelou nesta terça-feira (21) que perdeu seu telefone celular há seis meses com 250 riffs para o próximo disco. As informações são do site da revista \"NME\".',
        2),
       (11, 2,
        '\"Eu perdi meu iPhone com 250 ideias musicais. Fiquei arrasado. Eu não tinha feito backup. Quando aconteceu, eu fiquei chateado por dois ou três dias... Ainda estou procurando por ele\", disse, em entrevista ao Jasta Show podcast. Hammett também disse que só consegue se lembrar de oito dos 250 riffs de guitarra, lembrando seus colegas: \"Todos vocês músicos por aí que usam o telefone, verifiquem se fizeram o backup, certo?\".',
        2),
       (12, 3,
        'A banda está trabalhando no álbum sucessor de \"Death Magnetic\", de 2008. Segundo o guitarrista, 25% do disco está pronto. \"O material que está chegando é super-riffy, super pesado... Eu diria que é muito semelhante ao \'Death Magnetic\', mas diferente em algumas partes. James [Hetfield, vocalista] está fazendo um monte de melodias realmente muito interessantes, uma série de camadas vocais.\"',
        2),
       (13, 4,
        'O Metallica se apresenta dia 19 de setembro no Rock in Rio 2015, no Palco Mundo, por onde também vão passar Slipknot, Faith no More, Queens of the Stone Age e outros grupos de rock.',
        2),
       (14, 5,
        'Com a presença garantida no Rock in Rio deste ano, o Metallica irá participar pela terceira vez seguida do festival. Antes, o grupo esteve no Rio de Janeiro em 2011 e 2013. Em sua última passagem pelo Brasil, em março de 2014, a banda fez um show em São Paulo com o setlist escolhido pelos próprios fãs por meio de votação.',
        2),
       (15, 1,
        'O guitarrista do Metallica, Kirk Hammett, falou que o material que a banda tem escrito para o próximo álbum \"é um pouco mais progressivo\" que a música \"Lords of Summer\", que foi tocada pela primeira vez mais de um ano atrás no primeiro show da turnê sul americana.',
        3),
       (16, 2,
        'Durante uma aparição ontem (14 de Abril) no Liquid Metal da SiriusXM, Hammett falou sobre o progresso das sessões de composição do sucessor do disco \"Death Magnetic\", de 2008: \"Eu diria que algumas das coisas [que escrevemos] é similar a \'Lords of Summer\'. \'Lords of Summer\' é bem acessível, pois eu acho que é um dos riffs com som mais acessível e há um melodia bem legal. Muito do restante do material é um pouco mais progressivo - meio que nas linhas do que o \'Death Magnetic\' acabou sendo.\"',
        3),
       (17, 3,
        'Ele continuou: \"Eu diria que há algumas coisas bem cativantes vindo, e eu estou bem animado da direção que as coisas estão soando. Se eu pudesse comparar com alguma coisa, talvez fosse remotamente parecido com o approach que tivemos no \'...And Justice For All\', mas ele não soa como o \'...And Justice For All\' - ele não tem aquele som que o \'...And Justice For All\' tinha, o que eu achei que foi bem único na época.\"',
        3),
       (18, 4,
        'Hammett acrescentou: \"Eu ouço muitas bandas de metal hoje, e há bandas que realmente gostam daquele som do \'...And Justice For All\' e buscam isso. E legal, cara. Digo, eles estão fazendo melhor do que fizemos, pois você pode ouvir o baixo.\"',
        3),
       (19, 5,
        'Kirk também falou sobre como ele encontra inspiração e motivação para gravar um disco novo do Metallica atualmente. Ele disse: \"É o que sempre faço. Eu sempre volto para as coisas que me influenciaram quando era mais novo e comecei a sair, pois essas coisas ainda são inspiradoras. E então eu olho em volta e vejo o que está rolando atualmente, e como as bandas estão soando atualmente, pois eu sempre estou curioso.\"',
        3),
       (20, 6,
        'E continou: \"O que eu faço é mais olhar o que está rolando e eu gosto de ver como nosso som se encaixa no que está rolando. É realmente apenas uma coisa do dia a dia. Eu ligo o rádio e começo a ouvir as estações. E se eu ouvir uma trecho de música que eu acho que é particularmente interessante, então ouvirei e talvez ouvirei e pegarei algo e pensarei, \'Uau! Essa é uma melodia bem boa. Talvez eu devesse aplicar isso a este pedaço de solo\'. E pode ser qualquer tipo de música - pode ser rock, pode ser heavy metal, reggae... Qualquer coisa. E eu usarei isso talvez como ponto inicial para criar algo diferente.\"',
        3),
       (21, 1,
        'A banda Stone Sour disponibilizou sua cover para “Creeping Death”, música do Metallica lançada originalmente no disco Ride The Lightning, de 1984.',
        4),
       (22, 2,
        'O som faz parte de um EP do grupo que ainda terá covers de Alice In Chains, Judas Priest, KISS e Black Sabbath.',
        4),
       (23, 3,
        'Corey Taylor, vocalista do Slipknot e do Stone Sour, disse que essas covers sempre foram algo que o grupo quis fazer, desde o começo da carreira em 1992, mesmo com a troca de integrantes.',
        4),
       (24, 4,
        'Você pode ouvir a versão de “Creeping Death” logo abaixo. O EP será lançado oficialmente no dia 18 de Abril, Record Store Day, em vinil.',
        4),
       (25, 5,
        '<iframe width=\"620\" height=\"349\" src=\"https://www.youtube.com/embed/3HFaUoulmx4?feature=oembed\" frameborder=\"0\" allowfullscreen=\"\"></iframe>',
        4);
/*!40000 ALTER TABLE `paragrafo` ENABLE KEYS */;
UNLOCK
TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario`
(
    `id`       int(11) NOT NULL AUTO_INCREMENT,
    `login`    varchar(45)        DEFAULT NULL,
    `nome`     varchar(45)        DEFAULT NULL,
    `senha`    varchar(45)        DEFAULT NULL,
    `email`    varchar(45)        DEFAULT NULL,
    `nivel_id` int(11) NOT NULL,
    `data`     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`, `nivel_id`),
    KEY        `fk_usuario_nivel1_idx` (`nivel_id`),
    CONSTRAINT `fk_usuario_nivel1` FOREIGN KEY (`nivel_id`) REFERENCES `nivel` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK
TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario`
VALUES (1, 'mucadoo', 'Samuel', '1234', 'samuelgiordano@live.com', 1, '2015-11-06 17:44:32'),
       (2, 'eduardo', 'Eduardo', '1234', 'eduardo@gmail.com', 1, '2015-11-06 17:44:32'),
       (3, 'joaozinho', 'João', 'joaozin', 'joao@ig.com', 3, '2015-11-06 17:44:32'),
       (4, 'mariazinha', 'Maria', 'mariazin', 'maria@ig.com', 3, '2015-11-06 17:44:32'),
       (5, 'teste', 'Teste', 'teste', 'teste@bol.com', 3, '2015-11-06 17:44:32');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK
TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-06 16:41:46
