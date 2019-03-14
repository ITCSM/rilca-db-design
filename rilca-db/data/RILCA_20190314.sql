CREATE DATABASE  IF NOT EXISTS `rilca` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rilca`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 10.22.52.50    Database: rilca
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.12-MariaDB

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
-- Table structure for table `academic_staff`
--

DROP TABLE IF EXISTS `academic_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_staff` (
  `Ac_ID` varchar(10) NOT NULL,
  `Title` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Ac_ID`),
  CONSTRAINT `academic_staff_ibfk_1` FOREIGN KEY (`Ac_ID`) REFERENCES `staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_staff`
--

LOCK TABLES `academic_staff` WRITE;
/*!40000 ALTER TABLE `academic_staff` DISABLE KEYS */;
INSERT INTO `academic_staff` VALUES ('1','Lecturer'),('2','Professor'),('3','Professor'),('4','Assitance Prof'),('5','Lecturere'),('6','Professpor');
/*!40000 ALTER TABLE `academic_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deputy_dir`
--

DROP TABLE IF EXISTS `deputy_dir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deputy_dir` (
  `DeputyDir_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`DeputyDir_ID`),
  CONSTRAINT `deputy_dir_ibfk_1` FOREIGN KEY (`DeputyDir_ID`) REFERENCES `executive` (`Exec_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deputy_dir`
--

LOCK TABLES `deputy_dir` WRITE;
/*!40000 ALTER TABLE `deputy_dir` DISABLE KEYS */;
/*!40000 ALTER TABLE `deputy_dir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `director` (
  `Dir_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Dir_ID`),
  CONSTRAINT `director_ibfk_1` FOREIGN KEY (`Dir_ID`) REFERENCES `executive` (`Exec_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `executive`
--

DROP TABLE IF EXISTS `executive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `executive` (
  `Exec_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Exec_ID`),
  CONSTRAINT `executive_ibfk_1` FOREIGN KEY (`Exec_ID`) REFERENCES `staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `executive`
--

LOCK TABLES `executive` WRITE;
/*!40000 ALTER TABLE `executive` DISABLE KEYS */;
/*!40000 ALTER TABLE `executive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myitems`
--

DROP TABLE IF EXISTS `myitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `myitems` (
  `id` varchar(10) NOT NULL,
  `parent` varchar(10) DEFAULT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `unit_score` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myitems`
--

LOCK TABLES `myitems` WRITE;
/*!40000 ALTER TABLE `myitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `myitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_document`
--

DROP TABLE IF EXISTS `pa_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pa_document` (
  `Doc_ID` varchar(100) NOT NULL,
  `Doc_year` varchar(5) DEFAULT NULL,
  `Doc_Status` varchar(20) DEFAULT NULL,
  `DirSign_Date` date DEFAULT NULL,
  `DDirSign_Date` date DEFAULT NULL,
  `Approve_Date` date DEFAULT NULL,
  `Set_date` date DEFAULT NULL,
  `Accept_date` date DEFAULT NULL,
  `SignDir_ID` varchar(10) DEFAULT NULL,
  `SignDDir_ID` varchar(10) DEFAULT NULL,
  `PAExec_ID` varchar(10) DEFAULT NULL,
  `Acad_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Doc_ID`),
  KEY `SignDir_ID` (`SignDir_ID`),
  KEY `SignDDir_ID` (`SignDDir_ID`),
  KEY `PAExec_ID` (`PAExec_ID`),
  KEY `Acad_ID` (`Acad_ID`),
  CONSTRAINT `pa_document_ibfk_1` FOREIGN KEY (`SignDir_ID`) REFERENCES `director` (`Dir_ID`),
  CONSTRAINT `pa_document_ibfk_2` FOREIGN KEY (`SignDDir_ID`) REFERENCES `deputy_dir` (`DeputyDir_ID`),
  CONSTRAINT `pa_document_ibfk_3` FOREIGN KEY (`PAExec_ID`) REFERENCES `executive` (`Exec_ID`),
  CONSTRAINT `pa_document_ibfk_4` FOREIGN KEY (`Acad_ID`) REFERENCES `academic_staff` (`Ac_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_document`
--

LOCK TABLES `pa_document` WRITE;
/*!40000 ALTER TABLE `pa_document` DISABLE KEYS */;
INSERT INTO `pa_document` VALUES ('rilca-ecai4o3jqxvbdp6','2019','Submitted',NULL,NULL,NULL,'2019-01-15',NULL,NULL,NULL,NULL,'1'),('rilca-ecai50qjqysgc2w','2019','Submitted',NULL,NULL,NULL,'2019-01-16',NULL,NULL,NULL,NULL,'2'),('rilca-ecai5q0jqyuhzed','2019','Submitted',NULL,NULL,NULL,'2019-01-16',NULL,NULL,NULL,NULL,'2'),('rilca-ecai6brjqyxk4kt','2019','Submitted',NULL,NULL,NULL,'2019-01-16',NULL,NULL,NULL,NULL,'2'),('rilca-ecai7yfjqz4kjwl','2019','Submitted',NULL,NULL,NULL,'2019-01-16',NULL,NULL,NULL,NULL,'6'),('rilca-ecai84djqz4t09u','2019','Submitted',NULL,NULL,NULL,'2019-01-16',NULL,NULL,NULL,NULL,'4'),('rilca-ecai84djqz4tcib','2019','Submitted',NULL,NULL,NULL,'2019-01-16',NULL,NULL,NULL,NULL,'3'),('rilca-ecai84djqz4ue8z','2019','Submitted',NULL,NULL,NULL,'2019-01-16',NULL,NULL,NULL,NULL,'5'),('rilca-ecaid3ajr3aa79n','2019','Submitted',NULL,NULL,NULL,'2019-01-19',NULL,NULL,NULL,NULL,'2'),('rilca-ecaieh7jr69bs7s','2019','Submitted',NULL,NULL,NULL,'2019-01-21',NULL,NULL,NULL,NULL,'1'),('rilca-y97y65wjr7hulis','2019','Submitted',NULL,NULL,NULL,'2019-01-22',NULL,NULL,NULL,NULL,'6'),('rilca-y97y6lgjr69p82t','2019','Submitted',NULL,NULL,NULL,'2019-01-21',NULL,NULL,NULL,NULL,'6'),('rilca-y97y8ocjsv8zoy2','2019','Submitted',NULL,NULL,NULL,'2019-03-05',NULL,NULL,NULL,NULL,'4');
/*!40000 ALTER TABLE `pa_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_item`
--

DROP TABLE IF EXISTS `pa_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pa_item` (
  `Item_ID` varchar(20) NOT NULL,
  `Parent_id` varchar(20) DEFAULT NULL,
  `G_Desc_eng` varchar(300) DEFAULT NULL,
  `G_Desc_thai` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`Item_ID`),
  KEY `pa_item_ibfk_1` (`Parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_item`
--

LOCK TABLES `pa_item` WRITE;
/*!40000 ALTER TABLE `pa_item` DISABLE KEYS */;
INSERT INTO `pa_item` VALUES ('1','1','PA: Standard Section',NULL),('10','9','main author (>=50%) = 60 points',NULL),('100','99',NULL,'q ที่ปรึกษาบทความที่ได้รับการตีพิมพ์ระดับชาติ (10 คะแนน)'),('101','99',NULL,'q ที่ปรึกษาบทความได้รับการตีพิมพ์ระดับนานาชาติ (20 คะแนน)'),('102','91',NULL,'หมวดพัฒนา ข : งานพัฒนาคุณภาพนักศึกษา (คิดคะแนนเท่ากันทั้งหลักสูตร)'),('103','102',NULL,'นักศึกษาได้รับทุนการศึกษาระดับชาติ'),('104','103',NULL,'q = 5 คะแนน'),('105','102',NULL,'นักศึกษาได้รับรางวัลระดับมหาวิทยาลัย/ระดับชาติ'),('106','105',NULL,'q = ระดับมหาวิทยาลัย 5 คะแนน'),('107','105',NULL,'q = ระดับชาติ 10 คะแนน'),('108','102',NULL,'นักศึกษาตีพิมพ์บทความนอกเหนือเงื่อนไขการสำเร็จการศึกษา'),('109','108',NULL,'q = 5 คะแนน'),('11','9','co-author (<=50%) = 25 points',NULL),('110','102',NULL,'นักศึกษาเรียนจบภายในระยะเวลาที่กำหนด'),('111','110',NULL,'q = 5 คะแนน'),('112','102',NULL,'จำนวนนักศึกษาที่รับเป็นไปตามเป้าหมาย'),('113','112',NULL,'q = 10 คะแนน'),('114','91',NULL,'หมวดพัฒนา ค : งานสร้างสรรค์นวัตกรรม และสร้างผลตอบแทนตามยุทธศาสตร์เร่งด่วน(โปรดแนบรายละเอียดในงานสร้างสรรค์ที่ท่านวางแผนจะดำเนินการมาพอสังเขป)'),('115','114',NULL,'พัฒนาหลักสูตรใหม่ภายในปีที่ประเมิน'),('116','115',NULL,'q ประธาน = 15 คะแนน'),('117','115',NULL,'q เลขาฯ = 10 คะแนน'),('118','115',NULL,'q ผู้ช่วยเลขาฯ = 8 คะแนน'),('119','115',NULL,'q คณะทำงาน = 5 คะแนน;'),('12','2','(articles published last year can be submitted for evaluation)',NULL),('120','114',NULL,'พัฒนากลุ่มวิจัย/ศูนย์ใหม่ภายในปีที่ประเมิน'),('121','120',NULL,'q ประธาน = 15 คะแนน'),('122','120',NULL,'q เลขาฯ = 10 คะแนน'),('123','120',NULL,'q ผู้ช่วยเลขาฯ = 8 คะแนน'),('124','120',NULL,'q คณะทำงาน = 5 คะแนน'),('125','114',NULL,'จัดประชุมวิชาการ'),('126','125',NULL,'3.1 เสวนาระดับมหาวิทยาลัย'),('127','126',NULL,'q ประธาน = 8 คะแนน'),('128','126',NULL,'q เลขาฯ = 6 คะแนน'),('129','126',NULL,'q ผู้ช่วยเลขาฯ = 4 คะแนน'),('13','1','Academic works in accordance with 22 indicators',NULL),('130','126',NULL,'q คณะทำงาน = 2 คะแนน'),('131','125',NULL,'3.2 ประชุมวิชาการระดับชาติ'),('132','131',NULL,'ประธาน = 12 คะแนน'),('133','131',NULL,'เลขาฯ = 9 คะแนน'),('134','131',NULL,'ผู้ช่วยเลขาฯ = 6 คะแนน'),('135','131',NULL,'คณะทำงาน = 3 คะแนน'),('136','125',NULL,'3.3 ประชุมวิชาการระดับนานาชาติ'),('137','136',NULL,'q ประธาน = 20 คะแนน'),('138','136',NULL,'q เลขาฯ = 15 คะแนน'),('139','136',NULL,'q ผู้ช่วยเลขาฯ = 10 คะแนน'),('14','13','Conference contribution/ proceedings',NULL),('140','136',NULL,'q คณะทำงาน = 5 คะแนน'),('141','114',NULL,'จัดนิทรรศการวิชาการระดับมหาวิทยาลัย/ระดับชาติเพื่อสร้างชื่อเสียงแก่สถาบันฯ'),('142','141',NULL,'q ประธาน = 10 คะแนน'),('143','141',NULL,'q เลขาฯ = 7 คะแนน'),('144','141',NULL,'q ผู้ช่วยเลขาฯ = 5 คะแนน'),('145','141',NULL,'q คณะทำงาน = 2 คะแนน'),('146','114',NULL,'การสร้าง Social impact/Social engagement'),('147','146',NULL,'5.1 ระดับสถาบันฯ'),('148','147',NULL,'q ประธาน = 8 คะแนน'),('149','147',NULL,'q เลขาฯ = 6 คะแนน'),('15','14','main author (>=50%) = 18 points',NULL),('150','147',NULL,'q ผู้ช่วยเลขาฯ = 4 คะแนน'),('151','147',NULL,'q คณะทำงาน = 2 คะแนน'),('152','146',NULL,'5.2 ระดับมหาวิทยาลัย*'),('153','152',NULL,'q ประธาน = 12 คะแนน'),('154','152',NULL,'q เลขาฯ = 9 คะแนน'),('155','152',NULL,'q ผู้ช่วยเลขาฯ = 6 คะแนน'),('156','152',NULL,'q คณะทำงาน = 3 คะแนน'),('158','114',NULL,'เขียนบทความเพื่อให้ความรู้แก่สังคม'),('159','158',NULL,'q บทความละ = 5 คะแนน'),('16','14','co-author (<=50%) = 6 points',NULL),('160','114',NULL,'ได้รับเชิญออกสื่อเพื่อให้ความรู้แก่สังคม'),('161','160',NULL,'q (ถ่ายทำ) ครั้งละ = 10 คะแนน'),('162','114',NULL,'ออกสื่อ Social Media**'),('163','162',NULL,'q (ถ่ายทำเอง) ครั้งละ = 1-5 คะแนน'),('164','114',NULL,'จัดกิจกรรมสร้างรายได้ (สุทธิ) แก่สถาบันฯ'),('165','164',NULL,'q 0 – 5,000 = 10 คะแนน'),('166','164',NULL,'q 5,001 – 50,000 = 15 คะแนน'),('167','164',NULL,'q 50,001 – 100,000 = 20 คะแนน'),('168','164',NULL,'q 100,001 – 200,000 = 25 คะแนน'),('169','164',NULL,'q มากกว่า 200,000 = 30 คะแนน'),('17','13','Research report',NULL),('170','91',NULL,'หมวดพัฒนา ง : งานส่วนกลาง(โปรดแนบรายละเอียดในงานส่วนกลางที่ท่านวางแผนจะดำเนินการมาพอสังเขป โดยเฉพาะข้อ 4-6)'),('171','170',NULL,'การบริหารหลักสูตร'),('172','171',NULL,'q ประธาน = 10 คะแนน'),('173','171',NULL,'q เลขาฯ = 7 คะแนน'),('174','171',NULL,'q ผู้ช่วยเลขาฯ = 5 คะแนน'),('175','171',NULL,'q กรรมการ = 3 คะแนน'),('176','170',NULL,'การบริหารกลุ่มวิจัย/ศูนย์'),('177','176',NULL,'q ประธาน = 10 คะแนน'),('178','176',NULL,'q เลขาฯ = 7 คะแนน'),('179','176',NULL,'q ผู้ช่วยเลขาฯ = 5 คะแนน'),('18','17','main author (>=50%) = 24 points',NULL),('180','176',NULL,'q กรรมการ = 3 คะแนน'),('181','170',NULL,'บรรณาธิการ'),('182','181',NULL,'q = 10 คะแนน'),('183','170',NULL,'คณะกรรมการ/คณะทำงานชุดต่างๆ'),('184','183',NULL,'4.1 คณะกรรมการที่มีการทำงานต่อเนื่อง'),('185','184',NULL,'q ประธาน = 8 คะแนน'),('186','184',NULL,'q เลขาฯ = 6 คะแนน'),('187','184',NULL,'q ผู้ช่วยเลขาฯ = 4 คะแนน'),('188','184',NULL,'q คณะทำงาน = 2 คะแนน'),('189','183',NULL,'4.2 คณะกรรมการที่เป็นลักษณะโครงการ (ระยะสั้น)'),('19','17','co-author (<=50%) = 8 points',NULL),('190','189',NULL,'q ประธาน = 5 คะแนน'),('191','189',NULL,'q เลขาฯ = 4 คะแนน'),('192','189',NULL,'q ผู้ช่วยเลขาฯ = 3 คะแนน'),('193','189',NULL,'q คณะทำงาน = 2 คะแนน'),('194','170',NULL,'ได้รับมอบหมายให้สอน/บริการวิชาการ'),('195','194',NULL,'q รับผิดชอบรายวิชาวิชาละ = 5 คะแนน'),('196','194',NULL,'q สอนครั้งละ = 0.3 คะแนน'),('197','170',NULL,'ได้รับมอบหมายเพิ่มจากงานประจำ'),('198','197',NULL,'q = 5-15 คะแนน'),('2','1','Research/academic article published in journal',NULL),('20','13','Authored book',NULL),('21','20','main author (>=50%) = 30 points',NULL),('22','20','co-author (<=50%) = 60 points',NULL),('23','13','Chapter in book',NULL),('24','23','THAICHARS',NULL),('25','24','main author (>=50%) = 18 points',NULL),('26','24','co-author (<=50%) = 6 points',NULL),('27','23','International level',NULL),('28','27','main author (>=50%) = 36 points',NULL),('29','27','co-author (<=50%) = 15 points',NULL),('3','2','National level (Journal on TCI database)',NULL),('30','13','Editorial work',NULL),('31','30','editor = 18 points',NULL),('32','13','Collected articles by a single author',NULL),('33','32','main author = 24 points',NULL),('34','13','Collected articles by a group of scholars',NULL),('35','34','main author (>=50%) = 15 points',NULL),('36','34','co-author (<=50%) = 5 points',NULL),('37','13','Festschrift',NULL),('38','37','main author (>=50%) = 15 points',NULL),('39','37','co-author (<=50%) = 5 points',NULL),('4','3','main author (>=50%) = 30 points',NULL),('40','13','Translation with editorial work',NULL),('41','40','main author (>=50%) = 18 points',NULL),('42','40','co-author (<=50%) = 6 points',NULL),('43','13','Manual/handbook',NULL),('44','43','main author (>=50%) = 24 points',NULL),('45','43','co-author (<=50%) = 8 points',NULL),('46','13','Review article',NULL),('47','46','main author (>=50%) = 30 points',NULL),('48','46','co-author (<=50%) = 10 points',NULL),('49','13','Annotated bibliography',NULL),('5','3','co-author (<=50%) = 10 points',NULL),('50','49','main author (>=50%) = 15 points',NULL),('51','49','co-author (<=50%) = 5 points',NULL),('52','13','Review Book/article/exhibition/performance',NULL),('53','52','main author (>=50%) = 6 points',NULL),('54','52','co-author (<=50%) = 2 points',NULL),('55','13','Public lecture/inaugural lecture /memorial lecture/lecture series',NULL),('56','55','speaker/lecturer = 18 points',NULL),('57','13','Dictionary/ encyclopedia',NULL),('58','57','main author (>=50%) = 30 points',NULL),('59','57','co-author (<=50%) = 12 points',NULL),('6','2','International level (no record in international database)',NULL),('60','13','Scholarly edition',NULL),('61','60','main author (>=50%) = 24 points',NULL),('62','60','co-author (<=50%) = 8 points',NULL),('63','13','Literature',NULL),('64','63','main author (>=50%) = 30 points',NULL),('65','63','co-author (<=50%) = 10 points',NULL),('66','13','Performing arts/ music',NULL),('67','66','main author (>=50%) = 30 points',NULL),('68','66','co-author (<=50%) = 10 points',NULL),('69','13','Architecture/ design/ painting/sculpture/ graphic arts/ related fields',NULL),('7','6','main author (>=50%) = 40 points',NULL),('70','69','main author (>=50%) = 30 points',NULL),('71','69','co-author (<=50%) = 10 points',NULL),('72','13','Patent',NULL),('73','72','Patent for invention',NULL),('74','73','main author (>=50%) = 30 points',NULL),('75','73','co-author (<=50%) = 10 points',NULL),('76','72','Patent design',NULL),('77','76','main author (>=50%) = 12 points',NULL),('78','76','co-author (<=50%) = 4 points',NULL),('79','72','Software',NULL),('8','6','co-author (<=50%) = 15 points',NULL),('80','79','Creative process with pioneering ideas',NULL),('81','80','main operator (>=50%) = 30 points',NULL),('82','80','co-operator (<>>=50%) = 10 points',NULL),('83','72','Build on existing software',NULL),('84','83','main operator (>=50%) = 30 points',NULL),('85','83','co-operator (<=50%) = 15 points',NULL),('86','1','Research project',NULL),('87','86','Project investigator = 30 points',NULL),('88','86','Co-researcher = 15 points',NULL),('89','1','Lecture (please specify the course which is being an instructor or a a co-teaching (1 course) (15 points)',NULL),('9','2','International level (recorded in international database)',NULL),('90','1','Participate in requiring events of RILCA (5 points)',NULL),('91','91','PA: Development Section',NULL),('92','91',NULL,'หมวดพัฒนา ก : งานพัฒนางานวิจัยและผลงานวิชาการ'),('93','92',NULL,'ผลิตบทความวิชาการ/วิจัย'),('94','93',NULL,'บวกคะแนนที่เกินจาก 60 คะแนนในหมวดมาตรฐาน'),('95','92',NULL,'ผลิตผลงานวิชาการประเภทอื่นๆ'),('96','95',NULL,'บวกคะแนนที่เกินจาก 60 คะแนนในหมวดมาตรฐาน'),('97','92',NULL,'โครงการวิจัย'),('98','97',NULL,'บวกคะแนนที่เกินจาก 60 คะแนนในหมวดมาตรฐาน'),('99','92',NULL,'ที่ปรึกษาในการเขียนบทความวิชาการ และ R2R แก่บุคลากรสายวิชาการรุ่นใหม่ และสายสนับสนุน');
/*!40000 ALTER TABLE `pa_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pa_line`
--

DROP TABLE IF EXISTS `pa_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pa_line` (
  `PAline_Score` int(5) DEFAULT NULL,
  `PADoc_ID` varchar(100) DEFAULT NULL,
  `PAitem_ID` varchar(20) DEFAULT NULL,
  `SS_ID` varchar(10) DEFAULT NULL,
  `upsert_date` date DEFAULT NULL,
  KEY `PADoc_ID` (`PADoc_ID`),
  KEY `PAitem_ID` (`PAitem_ID`),
  KEY `SS_ID` (`SS_ID`),
  CONSTRAINT `pa_line_ibfk_1` FOREIGN KEY (`PADoc_ID`) REFERENCES `pa_document` (`Doc_ID`),
  CONSTRAINT `pa_line_ibfk_2` FOREIGN KEY (`PAitem_ID`) REFERENCES `pa_item` (`Item_ID`),
  CONSTRAINT `pa_line_ibfk_3` FOREIGN KEY (`SS_ID`) REFERENCES `supportive_staff` (`S_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pa_line`
--

LOCK TABLES `pa_line` WRITE;
/*!40000 ALTER TABLE `pa_line` DISABLE KEYS */;
INSERT INTO `pa_line` VALUES (120,'rilca-ecai4o3jqxvbdp6','153',NULL,'2019-01-15'),(24,'rilca-ecai50qjqysgc2w','33',NULL,'2019-01-16'),(15,'rilca-ecai50qjqysgc2w','35',NULL,'2019-01-16'),(5,'rilca-ecai50qjqysgc2w','36',NULL,'2019-01-16'),(15,'rilca-ecai50qjqysgc2w','50',NULL,'2019-01-16'),(5,'rilca-ecai50qjqysgc2w','51',NULL,'2019-01-16'),(10,'rilca-ecai5q0jqyuhzed','172',NULL,'2019-01-16'),(7,'rilca-ecai5q0jqyuhzed','173',NULL,'2019-01-16'),(5,'rilca-ecai5q0jqyuhzed','174',NULL,'2019-01-16'),(3,'rilca-ecai5q0jqyuhzed','175',NULL,'2019-01-16'),(8,'rilca-ecai6brjqyxk4kt','148',NULL,'2019-01-16'),(0,'rilca-ecai6brjqyxk4kt','163',NULL,'2019-01-16'),(10,'rilca-ecai6brjqyxk4kt','165',NULL,'2019-01-16'),(5,'rilca-ecai6brjqyxk4kt','174',NULL,'2019-01-16'),(3,'rilca-ecai6brjqyxk4kt','175',NULL,'2019-01-16'),(2,'rilca-ecai6brjqyxk4kt','188',NULL,'2019-01-16'),(5,'rilca-ecai6brjqyxk4kt','190',NULL,'2019-01-16'),(4,'rilca-ecai6brjqyxk4kt','191',NULL,'2019-01-16'),(15,'rilca-ecai7yfjqz4kjwl','4',NULL,'2019-01-16'),(40,'rilca-ecai7yfjqz4kjwl','7',NULL,'2019-01-16'),(100,'rilca-ecai7yfjqz4kjwl','62',NULL,'2019-01-16'),(10,'rilca-ecai7yfjqz4kjwl','68',NULL,'2019-01-16'),(30,'rilca-ecai7yfjqz4kjwl','70',NULL,'2019-01-16'),(10,'rilca-ecai7yfjqz4kjwl','82',NULL,'2019-01-16'),(15,'rilca-ecai7yfjqz4kjwl','116',NULL,'2019-01-16'),(10,'rilca-ecai7yfjqz4kjwl','117',NULL,'2019-01-16'),(15,'rilca-ecai7yfjqz4kjwl','121',NULL,'2019-01-16'),(10,'rilca-ecai7yfjqz4kjwl','122',NULL,'2019-01-16'),(20,'rilca-ecai7yfjqz4kjwl','137',NULL,'2019-01-16'),(15,'rilca-ecai7yfjqz4kjwl','138',NULL,'2019-01-16'),(10,'rilca-ecai7yfjqz4kjwl','142',NULL,'2019-01-16'),(8,'rilca-ecai7yfjqz4kjwl','148',NULL,'2019-01-16'),(12,'rilca-ecai7yfjqz4kjwl','153',NULL,'2019-01-16'),(10,'rilca-ecai7yfjqz4kjwl','177',NULL,'2019-01-16'),(8,'rilca-ecai7yfjqz4kjwl','185',NULL,'2019-01-16'),(30,'rilca-ecai84djqz4t09u','4',NULL,'2019-01-16'),(15,'rilca-ecai84djqz4t09u','8',NULL,'2019-01-16'),(6,'rilca-ecai84djqz4t09u','53',NULL,'2019-01-16'),(2,'rilca-ecai84djqz4t09u','54',NULL,'2019-01-16'),(20,'rilca-ecai84djqz4t09u','109',NULL,'2019-01-16'),(5,'rilca-ecai84djqz4t09u','111',NULL,'2019-01-16'),(8,'rilca-ecai84djqz4t09u','127',NULL,'2019-01-16'),(4,'rilca-ecai84djqz4t09u','129',NULL,'2019-01-16'),(2,'rilca-ecai84djqz4t09u','151',NULL,'2019-01-16'),(5,'rilca-ecai84djqz4t09u','159',NULL,'2019-01-16'),(10,'rilca-ecai84djqz4t09u','165',NULL,'2019-01-16'),(8,'rilca-ecai84djqz4t09u','185',NULL,'2019-01-16'),(6,'rilca-ecai84djqz4t09u','186',NULL,'2019-01-16'),(30,'rilca-ecai84djqz4tcib','4',NULL,'2019-01-16'),(60,'rilca-ecai84djqz4tcib','10',NULL,'2019-01-16'),(18,'rilca-ecai84djqz4tcib','41',NULL,'2019-01-16'),(15,'rilca-ecai84djqz4tcib','116',NULL,'2019-01-16'),(10,'rilca-ecai84djqz4tcib','142',NULL,'2019-01-16'),(8,'rilca-ecai84djqz4tcib','148',NULL,'2019-01-16'),(20,'rilca-ecai84djqz4tcib','167',NULL,'2019-01-16'),(5,'rilca-ecai84djqz4tcib','179',NULL,'2019-01-16'),(4,'rilca-ecai84djqz4tcib','187',NULL,'2019-01-16'),(5,'rilca-ecai84djqz4tcib','195',NULL,'2019-01-16'),(60,'rilca-ecaid3ajr3aa79n','4',NULL,'2019-01-19'),(10,'rilca-ecaid3ajr3aa79n','5',NULL,'2019-01-19'),(40,'rilca-ecaid3ajr3aa79n','7',NULL,'2019-01-19'),(30,'rilca-ecaieh7jr69bs7s','4',NULL,'2019-01-21'),(10,'rilca-ecaieh7jr69bs7s','5',NULL,'2019-01-21'),(30,'rilca-y97y65wjr7hulis','4',NULL,'2019-01-22'),(15,'rilca-y97y65wjr7hulis','35',NULL,'2019-01-22'),(4,'rilca-y97y65wjr7hulis','191',NULL,'2019-01-22'),(3,'rilca-y97y65wjr7hulis','192',NULL,'2019-01-22'),(30,'rilca-y97y8ocjsv8zoy2','4',NULL,'2019-03-05'),(40,'rilca-y97y8ocjsv8zoy2','7',NULL,'2019-03-05'),(60,'rilca-y97y8ocjsv8zoy2','10',NULL,'2019-03-05'),(24,'rilca-y97y8ocjsv8zoy2','44',NULL,'2019-03-05'),(30,'rilca-y97y8ocjsv8zoy2','87',NULL,'2019-03-05'),(4,'rilca-y97y8ocjsv8zoy2','129',NULL,'2019-03-05'),(10,'rilca-y97y8ocjsv8zoy2','142',NULL,'2019-03-05'),(6,'rilca-y97y8ocjsv8zoy2','149',NULL,'2019-03-05'),(20,'rilca-y97y8ocjsv8zoy2','167',NULL,'2019-03-05'),(7,'rilca-y97y8ocjsv8zoy2','178',NULL,'2019-03-05'),(6,'rilca-y97y8ocjsv8zoy2','186',NULL,'2019-03-05'),(4,'rilca-y97y8ocjsv8zoy2','191',NULL,'2019-03-05');
/*!40000 ALTER TABLE `pa_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `Fname` varchar(50) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `Staff_ID` varchar(10) NOT NULL,
  `Address` varchar(120) DEFAULT NULL,
  `Phone_no` int(6) DEFAULT NULL,
  `Date_joined` date DEFAULT NULL,
  `Program_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('Dok','Dara','1','Bangkok',1,'2019-01-11','1'),('Dy','Bora','2','Salaya',2,'2019-01-13','1'),('Hy','Bana','3','Phnom penh',3,'2019-01-16','1'),('Dok','Niday','4','Bangkok',4,'2019-01-22','1'),('Gig','dkdk','5','Salaya',6,'2019-01-16','1'),('tony','stark','6','usa',5,'2019-01-16','1'),('Kwanchit','Sasiwongsaroj','61-E0001',NULL,NULL,NULL,NULL),('Kwanchit','Sasiwongsaroj','E0001',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supportive_staff`
--

DROP TABLE IF EXISTS `supportive_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supportive_staff` (
  `S_ID` varchar(10) NOT NULL,
  `S_Title` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`S_ID`),
  CONSTRAINT `supportive_staff_ibfk_1` FOREIGN KEY (`S_ID`) REFERENCES `staff` (`Staff_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supportive_staff`
--

LOCK TABLES `supportive_staff` WRITE;
/*!40000 ALTER TABLE `supportive_staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `supportive_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_get_document`
--

DROP TABLE IF EXISTS `v_get_document`;
/*!50001 DROP VIEW IF EXISTS `v_get_document`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_get_document` AS SELECT 
 1 AS `Staff_ID`,
 1 AS `Doc_ID`,
 1 AS `Full_Name`,
 1 AS `Title`,
 1 AS `Set_date`,
 1 AS `Approve_Status`,
 1 AS `Accept_Status`,
 1 AS `Number_of_Items`,
 1 AS `Doc_year`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_top_five_staff_average_score`
--

DROP TABLE IF EXISTS `v_top_five_staff_average_score`;
/*!50001 DROP VIEW IF EXISTS `v_top_five_staff_average_score`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_top_five_staff_average_score` AS SELECT 
 1 AS `total_score`,
 1 AS `Staff_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v_get_document`
--

/*!50001 DROP VIEW IF EXISTS `v_get_document`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_get_document` AS select `staff`.`Staff_ID` AS `Staff_ID`,`pa_document`.`Doc_ID` AS `Doc_ID`,concat(`staff`.`Fname`,' ',`staff`.`Lname`) AS `Full_Name`,`academic_staff`.`Title` AS `Title`,`pa_document`.`Set_date` AS `Set_date`,case when `pa_document`.`Approve_Date` is null then 'Not yet Approve' else 'Approved' end AS `Approve_Status`,case when `pa_document`.`Accept_date` is null then 'Not Yet Accept' else 'Accepted' end AS `Accept_Status`,count(`pa_line`.`PAitem_ID`) AS `Number_of_Items`,`pa_document`.`Doc_year` AS `Doc_year` from (((`pa_document` join `staff` on(`pa_document`.`Acad_ID` = `staff`.`Staff_ID`)) join `academic_staff` on(`academic_staff`.`Ac_ID` = `staff`.`Staff_ID`)) join `pa_line` on(`pa_line`.`PADoc_ID` = `pa_document`.`Doc_ID`)) group by `staff`.`Staff_ID`,`pa_document`.`Doc_ID`,'Full_Name',`academic_staff`.`Title`,`pa_document`.`Set_date`,'Approve_Status','Accept_Status',`pa_document`.`Doc_year` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_top_five_staff_average_score`
--

/*!50001 DROP VIEW IF EXISTS `v_top_five_staff_average_score`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_top_five_staff_average_score` AS select sum(`pa_line`.`PAline_Score`) AS `total_score`,`staff`.`Staff_ID` AS `Staff_ID` from ((`pa_line` join `pa_document` on(`pa_line`.`PADoc_ID` = `pa_document`.`Doc_ID`)) join `staff` on(`staff`.`Staff_ID` = `pa_document`.`Acad_ID`)) where `pa_document`.`Doc_year` = (select `pa_document`.`Doc_year` from `pa_document` where `pa_document`.`Doc_ID` = 'rilca-ecai4o3jqxvbdp6') and `staff`.`Program_ID` = (select `staff`.`Program_ID` from (`staff` join `pa_document` on(`staff`.`Staff_ID` = `pa_document`.`Acad_ID`)) where `pa_document`.`Doc_ID` = 'rilca-ecai4o3jqxvbdp6') group by `staff`.`Staff_ID` order by sum(`pa_line`.`PAline_Score`) desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-14 18:31:30
