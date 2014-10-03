-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: countries
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `nationality`
--

DROP TABLE IF EXISTS `nationality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nationality` (
  `name` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nationality`
--

LOCK TABLES `nationality` WRITE;
/*!40000 ALTER TABLE `nationality` DISABLE KEYS */;
INSERT INTO `nationality` VALUES ('Afghan'),('Albanian'),('Algerian'),('American'),('Andorran'),('Angolan'),('Antiguans'),('Argentinean'),('Armenian'),('Australian'),('Austrian'),('Azerbaijani'),('Bahamian'),('Bahraini'),('Bangladeshi'),('Barbadian'),('Barbudans'),('Batswana'),('Belarusian'),('Belgian'),('Belizean'),('Beninese'),('Bhutanese'),('Bolivian'),('Bosnian'),('Brazilian'),('British'),('Bruneian'),('Bulgarian'),('Burkinabe'),('Burmese'),('Burundian'),('Cambodian'),('Cameroonian'),('Canadian'),('Cape Verdean'),('Central African'),('Chadian'),('Chilean'),('Chinese'),('Colombian'),('Comoran'),('Congolese'),('Costa Rican'),('Croatian'),('Cuban'),('Cypriot'),('Czech'),('Danish'),('Djibouti'),('Dominican'),('Dutch'),('East Timorese'),('Ecuadorean'),('Egyptian'),('Emirian'),('Equatorial Guinean'),('Eritrean'),('Estonian'),('Ethiopian'),('Fijian'),('Filipino'),('Finnish'),('French'),('Gabonese'),('Gambian'),('Georgian'),('German'),('Ghanaian'),('Greek'),('Grenadian'),('Guatemalan'),('Guinea-Bissauan'),('Guinean'),('Guyanese'),('Haitian'),('Herzegovinian'),('Honduran'),('Hungarian'),('I-Kiribati'),('Icelander'),('Indian'),('Indonesian'),('Iranian'),('Iraqi'),('Irish'),('Israeli'),('Italian'),('Ivorian'),('Jamaican'),('Japanese'),('Jordanian'),('Kazakhstani'),('Kenyan'),('Kittian and Nevisian'),('Kuwaiti'),('Kyrgyz'),('Laotian'),('Latvian'),('Lebanese'),('Liberian'),('Libyan'),('Liechtensteiner'),('Lithuanian'),('Luxembourger'),('Macedonian'),('Malagasy'),('Malawian'),('Malaysian'),('Maldivan'),('Malian'),('Maltese'),('Marshallese'),('Mauritanian'),('Mauritian'),('Mexican'),('Micronesian'),('Moldovan'),('Monacan'),('Mongolian'),('Moroccan'),('Mosotho'),('Motswana'),('Mozambican'),('Namibian'),('Nauruan'),('Nepalese'),('New Zealander'),('Nicaraguan'),('Nigerian'),('Nigerien'),('North Korean'),('Northern Irish'),('Norwegian'),('Omani'),('Pakistani'),('Palauan'),('Panamanian'),('Papua New Guinean'),('Paraguayan'),('Peruvian'),('Polish'),('Portuguese'),('Qatari'),('Romanian'),('Russian'),('Rwandan'),('Saint Lucian'),('Salvadoran'),('Samoan'),('San Marinese'),('Sao Tomean'),('Saudi'),('Scottish'),('Senegalese'),('Serbian'),('Seychellois'),('Sierra Leonean'),('Singaporean'),('Slovakian'),('Slovenian'),('Solomon Islander'),('Somali'),('South African'),('South Korean'),('Spanish'),('Sri Lankan'),('Sudanese'),('Surinamer'),('Swazi'),('Swedish'),('Swiss'),('Syrian'),('Taiwanese'),('Tajik'),('Tanzanian'),('Thai'),('Togolese'),('Tongan'),('Trinidadian or Tobagonian'),('Tunisian'),('Turkish'),('Tuvaluan'),('Ugandan'),('Ukrainian'),('Uruguayan'),('Uzbekistani'),('Venezuelan'),('Vietnamese'),('Welsh'),('Yemenite'),('Zambian'),('Zimbabwean');
/*!40000 ALTER TABLE `nationality` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-03 19:50:59
