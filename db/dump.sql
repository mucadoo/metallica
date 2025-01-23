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

LOCK TABLES `artigo` WRITE;
/*!40000 ALTER TABLE `artigo` DISABLE KEYS */;
INSERT INTO `artigo`
VALUES (1, 'Metallica concert has fans on stage, sound failures and interruptions', 'img_post.jpg', 1, '2015-11-06 17:42:21'),
       (2, 'Kirk Hammet lost cell phone with 250 ideas', 'hammet1.jpg', 1, '2015-11-06 17:42:21'),
       (3, 'Hammett: New material is a bit more progressive than Lords of Summer', 'hammet.jpg', 1, '2015-11-06 17:50:20'),
       (4, 'Stone Sour releases cover of "Creeping Death" by Metallica', 'stonesour.jpg', 1, '2015-11-06 17:57:25');
/*!40000 ALTER TABLE `artigo` ENABLE KEYS */;
UNLOCK TABLES;

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
VALUES (12, 'so you are the big shot?', 2, 1, '2015-11-06 17:43:14'),
       (16, 'my good', 1, 1, '2015-11-06 17:43:14'),
       (17, 'kid', 1, 1, '2015-11-06 17:43:14'),
       (18, 'you cowards', 1, 2, '2015-11-06 17:43:14'),
       (19, 'haha I am John dammit', 1, 3, '2015-11-06 17:43:14'),
       (20, 'I am  testingkid', 1, 5, '2015-11-06 17:43:14');
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
       (3, 'Common');
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
        'Responsible for closing the second night of Rock in Rio 2015, Metallica faced troubles this Saturday (19) on the Palco Mundo stage. After a blackout affecting the sound of all the band members'' instruments, they had to leave the stage and interrupt the show for about five minutes during the performance of "Ride the Lightning"',
        1),
       (2, 2,
        'After the first of three failures, the group continued the show, but after a solo by guitarist Kirk Hammet, the Rock in Rio 2015 heard its first boos, many of them directed at Roberto Medina, the festival''s creator.',
        1),
       (3, 3,
        'Once the problem was resolved, vocalist and guitarist James Hetfield returned with the classic "The Unforgiven," which made the audience forget the moments of tension. On stage, Metallica was professional. They didn''t complain or comment about what happened, one of the biggest sound system failures in the event''s history. According to a statement from the Rock in Rio press office, the interruption was due to a "disconnection of the sound output line between the band''s console and the festival''s console".',
        1),
       (4, 4,
        'Despite the problem, Metallica delivered its traditional retrospective show, featuring songs from all their albums—and a 45-minute delay, repeating the delay by Queen last Saturday.',
        1),
       (5, 5,
        'This is the band''s third consecutive performance at the Brazilian edition of Rock in Rio. Similar setlists. Energy from the audience, the same. If Metallica always seems to give the same performance in the country, it''s impossible to say the strategy doesn''t work.',
        1),
       (6, 6,
        'The difference this time was the closer contact with the audience. From the stage, dozens of invited fans closely followed the group, in an improvised reenactment of their old "snake pit"—a space used on the "Metallica" tour (1991), also known as the "Black Album".',
        1),
       (7, 7,
        'The performance of "One" from the album "...and Justice for All" (1988) was the first highlight of the show, recorded by a school of cell phones amidst the scenic smoke. Modern times. Even without the classic "Creeping Death" on the setlist, 1980s fans had little to complain about with the trio "Master of Puppets," "Fade to Black," and "Seek & Destroy"',
        1),
       (8, 8,
        'The show also featured the return of "Whiskey in the Jar" to the repertoire, dedicated to Cliff Burton, the band''s former bassist who died in 1986—this traditional Irish song was played for the first time in Brazil last year on the "Metallica By Request" tour.',
        1),
       (9, 9,
        'At the end, fireworks during "Enter Sandman," sung in unison, and the promise that cheered those tired of Metallica''s sameness: the next visit to Brazil will be with a new studio album. Now, it''s vacation time for the band, which left Rio de Janeiro to be the home of their last show of the year.',
        1),
       (10, 1,
        'Kirk Hammett, Metallica''s guitarist, revealed this Tuesday (21) that he lost his cell phone six months ago with 250 riffs for the next album. The information comes from the "NME" magazine website.',
        2),
       (11, 2,
        '"I lost my iPhone with 250 musical ideas. I was devastated. I hadn''t backed it up. When it happened, I was upset for two or three days... I''m still looking for it," he said in an interview with the Jasta Show podcast. Hammett also said he only remembers eight of the 250 guitar riffs, reminding his colleagues: "All you musicians out there who use your phone, make sure you back it up, right?"',
        2),
       (12, 3,
        'The band is working on the successor album to "Death Magnetic" from 2008. According to the guitarist, 25% of the album is ready. "The material coming in is super-riffy, super heavy... I would say it''s very similar to ''Death Magnetic,'' but different in some parts. James [Hetfield, vocalist] is doing a lot of really interesting melodies, a series of vocal layers."',
        2),
       (13, 4,
        'Metallica will perform on September 19 at Rock in Rio 2015 on the Palco Mundo stage, where Slipknot, Faith no More, Queens of the Stone Age, and other rock groups will also perform.',
        2),
       (14, 5,
        'With their confirmed presence at this year''s Rock in Rio, Metallica will participate for the third consecutive time in the festival. Before, the group was in Rio de Janeiro in 2011 and 2013. In their last visit to Brazil, in March 2014, the band performed in São Paulo with a setlist chosen by the fans themselves through a vote.',
        2),
       (15, 1,
        'Metallica guitarist Kirk Hammett said the material the band has written for the next album "is a bit more progressive" than the song "Lords of Summer," which was played for the first time more than a year ago at the first show of the South American tour.',
        3),
       (16, 2,
        'During an appearance yesterday (April 14) on SiriusXM''s Liquid Metal, Hammett spoke about the progress of the writing sessions for the successor album to "Death Magnetic" from 2008: "I would say some of the things [we wrote] are similar to ''Lords of Summer.'' ''Lords of Summer'' is very accessible because I think it has one of the most accessible-sounding riffs and there''s a really cool melody. Much of the rest of the material is a bit more progressive—kind of along the lines of what ''Death Magnetic'' ended up being."',
        3),
       (17, 3,
        'He continued: "I would say there are some very catchy things coming, and I''m very excited about the direction things are sounding. If I could compare it to something, maybe it''s somewhat similar to the approach we took on ''...And Justice For All,'' but it doesn''t sound like ''...And Justice For All''—it doesn''t have that sound that ''...And Justice For All'' had, which I thought was very unique at the time."',
        3),
       (18, 4,
        'Hammett added: "I hear a lot of metal bands today, and there are bands that really like that sound from ''...And Justice For All'' and seek it out. And it''s cool, man. I mean, they''re doing better than we did because you can hear the bass."',
        3),
       (19, 5,
        'Kirk also talked about how he finds inspiration and motivation to record a new Metallica album nowadays. He said: "It''s what I always do. I always go back to the things that influenced me when I was younger and started out because those things are still inspiring. And then I look around and see what''s going on currently, and how bands sound currently because I''m always curious."',
        3),
       (20, 6,
        'And he continued: "What I do is more about seeing what''s going on and I like to see how our sound fits into what''s going on. It''s really just a day-to-day thing. I turn on the radio and start listening to the stations. And if I hear a music snippet that I think is particularly interesting, then I''ll listen to it and maybe I''ll listen and pick something up and think, ''Wow! That''s a really good melody. Maybe I should apply that to this part of a solo.'' And it can be any kind of music—it can be rock, it can be heavy metal, reggae... Anything. And I''ll use that maybe as a starting point to create something different."',
        3),
       (21, 1,
        'The band Stone Sour made available their cover of "Creeping Death," a song by Metallica originally released on the Ride The Lightning album, from 1984.',
        4),
       (22, 2,
        'The song is part of an EP by the group that will also feature covers of Alice In Chains, Judas Priest, KISS, and Black Sabbath.',
        4),
       (23, 3,
        'Corey Taylor, vocalist for Slipknot and Stone Sour, said these covers have always been something the group wanted to do since the beginning of their career in 1992, even with the change of members.',
        4),
       (24, 4,
        'You can listen to the version of "Creeping Death" below. The EP will be officially released on April 18, Record Store Day, on vinyl.',
        4),
       (25, 5,
        '<iframe width="620" height="349" src="https://www.youtube.com/embed/3HFaUoulmx4?feature=oembed" frameborder="0" allowfullscreen=""></iframe>',
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
       (5, 'test', 'Test', 'test', 'teste@bol.com', 3, '2015-11-06 17:44:32');
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
