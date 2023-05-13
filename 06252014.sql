/*
SQLyog Ultimate v10.42 
MySQL - 5.6.12-log : Database - doh
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`doh` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `doh`;

/*Table structure for table `accounts_payable` */

DROP TABLE IF EXISTS `accounts_payable`;

CREATE TABLE `accounts_payable` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `machine_id` varchar(15) DEFAULT NULL,
  `supplier_id` bigint(15) DEFAULT NULL,
  `po_id` bigint(15) DEFAULT NULL,
  `payment_id` bigint(15) DEFAULT NULL,
  `check_no` bigint(15) DEFAULT NULL,
  `bank_name` varchar(20) DEFAULT NULL,
  `amount_issued` double(10,2) DEFAULT NULL,
  `transaction_value` tinyint(2) DEFAULT NULL,
  `transaction_code` varchar(5) DEFAULT NULL,
  `encode_id` bigint(15) DEFAULT NULL,
  `update_id` bigint(15) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `accounts_payable` */

/*Table structure for table `accounts_receivable` */

DROP TABLE IF EXISTS `accounts_receivable`;

CREATE TABLE `accounts_receivable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `transaction_id` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `transaction_code` varchar(20) DEFAULT NULL,
  `payment_id` bigint(20) DEFAULT NULL,
  `checkno` varchar(20) DEFAULT NULL,
  `bankname` varchar(20) DEFAULT NULL,
  `transaction_value` tinyint(4) DEFAULT NULL,
  `inventory_value` tinyint(4) DEFAULT NULL,
  `amount_issued` bigint(20) DEFAULT NULL,
  `balance` bigint(20) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `encode_id` varchar(10) DEFAULT NULL,
  `machine_id` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `accounts_receivable` */

/*Table structure for table `admin_settings` */

DROP TABLE IF EXISTS `admin_settings`;

CREATE TABLE `admin_settings` (
  `id` bigint(13) NOT NULL AUTO_INCREMENT,
  `employee_id` tinyint(2) DEFAULT NULL,
  `inventory_add` tinyint(2) DEFAULT NULL,
  `inventory_edit` tinyint(2) DEFAULT NULL,
  `inventory_delete` tinyint(2) DEFAULT NULL,
  `inventory_print` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin_settings` */

/*Table structure for table `attributes` */

DROP TABLE IF EXISTS `attributes`;

CREATE TABLE `attributes` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `machine_id` varchar(15) DEFAULT NULL,
  `encode_id` bigint(15) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `update_id` bigint(15) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

/*Data for the table `attributes` */

insert  into `attributes`(`id`,`description`,`type`,`machine_id`,`encode_id`,`encode_date`,`update_id`,`update_date`) values (1,'Paracetamol','generic',NULL,1,'2012-05-17',0,'0000-00-00'),(5,'Aspirin','generic',NULL,1,'2012-05-17',0,'0000-00-00'),(6,'ibuprofen','generic',NULL,1,'2012-05-17',0,'0000-00-00'),(11,'Amocixilin','generic',NULL,1,'2012-05-17',0,'0000-00-00'),(12,'Antacid','generic',NULL,1,'2012-05-17',0,'0000-00-00'),(13,'Salbutamol','generic',NULL,1,'2012-05-17',0,'0000-00-00'),(14,'Benzylpenicillin','generic',NULL,1,'2012-05-17',0,'0000-00-00'),(15,'Azithromycine','generic',NULL,1,'2012-05-17',0,'0000-00-00'),(16,'Cefalexin','generic',NULL,1,'2012-05-17',0,'0000-00-00'),(17,'Ambroxol','generic',NULL,1,'2012-05-17',0,'0000-00-00'),(18,'Neozep','brand',NULL,1,'2012-05-17',0,'0000-00-00'),(19,'Bactidol','brand',NULL,1,'2012-04-19',0,'0000-00-00'),(20,'Benadril','brand',NULL,1,'2012-05-17',0,'0000-00-00'),(21,'Buscopan','brand',NULL,1,'2012-05-17',0,'0000-00-00'),(23,'Bio-Flu','brand',NULL,1,'2012-05-17',0,'0000-00-00'),(24,'Dolfenal','brand',NULL,1,'2012-05-17',0,'0000-00-00'),(25,'Claritin','brand',NULL,1,'2012-05-17',0,'0000-00-00'),(26,'Pharex','brand',NULL,1,'2012-05-17',0,'0000-00-00'),(36,'Capsule','type',NULL,1,'2012-05-17',0,'0000-00-00'),(37,'Syrup','type',NULL,1,'2012-05-17',0,'0000-00-00'),(38,'Tablet','type',NULL,1,'2012-05-17',0,'0000-00-00'),(39,'Drops','type',NULL,1,'2012-05-17',0,'0000-00-00'),(40,'Ointment','type',NULL,1,'2012-05-17',0,'0000-00-00'),(41,'Inhaler','type',NULL,1,'2012-05-17',0,'0000-00-00'),(42,'Ear Drops','type',NULL,1,'2012-05-17',0,'0000-00-00'),(43,'Eye Drops','type',NULL,1,'2012-05-17',0,'0000-00-00'),(44,'Powder','type',NULL,1,'2012-05-17',0,'0000-00-00'),(45,'Drug','category',NULL,1,'2012-05-17',0,'0000-00-00'),(46,'Refreshments','category',NULL,1,'2012-05-17',0,'0000-00-00'),(47,'Food','category',NULL,1,'2012-05-17',0,'0000-00-00'),(48,'Equipment','category',NULL,1,'2012-05-17',0,'0000-00-00'),(50,'PC','unit',NULL,1,'2012-05-17',0,'0000-00-00'),(52,'Factory Defect','status',NULL,1,'2012-05-17',0,'0000-00-00'),(53,'Good','status',NULL,1,'2012-05-17',0,'0000-00-00'),(54,'Expired','status',NULL,1,'2012-04-19',NULL,NULL),(58,'Administrator','position',NULL,1,'2012-05-17',0,'0000-00-00'),(59,'Cashier','position',NULL,1,'2012-05-17',0,'0000-00-00'),(60,'Manager','position',NULL,1,'2012-05-17',0,'0000-00-00'),(63,'Box','unit',NULL,1,'2012-04-24',NULL,NULL),(64,'Cash','payment',NULL,1,'2012-04-24',0,'0000-00-00'),(65,'Destination','fob','',1,'2012-04-24',0,'0000-00-00'),(66,'Shipping Point','fob','',1,'2012-04-24',0,'0000-00-00'),(67,'Ordered','po_status','',1,'2012-02-22',0,'0000-00-00'),(68,'Pending','po_status','',1,'2012-02-22',0,'0000-00-00'),(69,'Cancelled','po_status','',1,'2012-02-22',0,'0000-00-00'),(70,'Close','po_status','',0,'0000-00-00',0,'0000-00-00'),(71,'Issued','ds_status','',1,'2013-02-03',0,'0000-00-00'),(72,'Received','ds_status','',1,'2013-02-03',0,'0000-00-00');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `mi` varchar(2) DEFAULT NULL,
  `gender` varchar(2) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `business_name` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `fax_number` varchar(20) DEFAULT NULL,
  `address` varchar(35) DEFAULT NULL,
  `cel_number` varchar(20) DEFAULT NULL,
  `tel_number` varchar(20) DEFAULT NULL,
  `machine_id` varchar(15) DEFAULT NULL,
  `encode_id` bigint(13) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `update_id` bigint(13) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`id`,`fname`,`lname`,`mi`,`gender`,`birthdate`,`business_name`,`email`,`fax_number`,`address`,`cel_number`,`tel_number`,`machine_id`,`encode_id`,`encode_date`,`update_id`,`update_date`) values (1,'ROOO','CCcaro','E','F','1989-05-08','Software Developers','drei@gmail.com','321','Junob Dgte City','4321','1321','MATOY-PC',1,'2013-02-09',NULL,NULL),(2,'Dave','Maypa','F','M','1998-05-08','Drug Production','Manyak@yahoo.com','13123','Bacong','12213','4564','MATOY-PC',1,'2013-02-15',NULL,'0000-00-00');

/*Table structure for table `distribution_order` */

DROP TABLE IF EXISTS `distribution_order`;

CREATE TABLE `distribution_order` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `distribution_id` bigint(15) DEFAULT NULL,
  `machine_id` varchar(15) DEFAULT NULL,
  `inventory_id` bigint(15) DEFAULT NULL,
  `transaction_id` bigint(15) DEFAULT NULL,
  `status_id` bigint(15) DEFAULT NULL,
  `unit_id` bigint(15) DEFAULT NULL,
  `from_branch` bigint(15) DEFAULT NULL,
  `to_branch` bigint(15) DEFAULT NULL,
  `quantity` double(10,2) DEFAULT NULL,
  `transaction_code` bigint(15) DEFAULT NULL,
  `inventory_value` int(2) DEFAULT NULL,
  `transaction_value` int(2) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `encode_id` bigint(15) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `update_id` bigint(15) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `distribution_order` */

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fname` varchar(15) DEFAULT NULL,
  `lname` varchar(15) DEFAULT NULL,
  `mi` varchar(1) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  `position` bigint(13) DEFAULT NULL,
  `address` varchar(25) DEFAULT NULL,
  `tel_home` varchar(20) DEFAULT NULL,
  `tel_alt` varchar(20) DEFAULT NULL,
  `eadd` varchar(25) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `title` varchar(15) DEFAULT NULL,
  `work_loc` varchar(20) DEFAULT NULL,
  `work_eadd` varchar(20) DEFAULT NULL,
  `tel_work` varchar(20) DEFAULT NULL,
  `tel_workcel` varchar(20) DEFAULT NULL,
  `machine_id` varchar(15) DEFAULT NULL,
  `encode_id` bigint(10) DEFAULT NULL,
  `update_id` bigint(10) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`id`,`fname`,`lname`,`mi`,`password`,`position`,`address`,`tel_home`,`tel_alt`,`eadd`,`gender`,`birthdate`,`title`,`work_loc`,`work_eadd`,`tel_work`,`tel_workcel`,`machine_id`,`encode_id`,`update_id`,`encode_date`,`update_date`) values (1,'Sarsi','Cavales','B','admin',58,'piapi','asdfa','asdfa','asdfasd','M','1989-09-14',' ','asdas','asds','asdsa','asdsa','MATOY-PC',1,1,'2013-02-12','2013-02-12'),(2,'sa','sa','A','sa',58,'sa','','','','M','2014-06-25',NULL,'','','','','PRGMMR-PC',1,NULL,'2014-06-25',NULL);

/*Table structure for table `inventory` */

DROP TABLE IF EXISTS `inventory`;

CREATE TABLE `inventory` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `barcode` bigint(15) DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  `status` bigint(15) DEFAULT NULL,
  `category` bigint(15) DEFAULT NULL,
  `brand` bigint(15) DEFAULT NULL,
  `generic` bigint(20) DEFAULT NULL,
  `supplier` bigint(20) DEFAULT NULL,
  `cost1` double(10,2) DEFAULT NULL,
  `cost2` double(10,2) DEFAULT NULL,
  `cost3` double(10,2) DEFAULT NULL,
  `cost4` double(10,2) DEFAULT NULL,
  `cost5` double(10,2) DEFAULT NULL,
  `price1` double(10,2) DEFAULT NULL,
  `price2` double(10,2) DEFAULT NULL,
  `price3` double(10,2) DEFAULT NULL,
  `price4` double(10,2) DEFAULT NULL,
  `price5` double(10,2) DEFAULT NULL,
  `unit1` bigint(13) DEFAULT NULL,
  `unit2` bigint(13) DEFAULT NULL,
  `unit3` bigint(13) DEFAULT NULL,
  `unit4` bigint(13) DEFAULT NULL,
  `unit5` bigint(13) DEFAULT NULL,
  `discount1` float DEFAULT NULL,
  `discount2` float DEFAULT NULL,
  `discount3` float DEFAULT NULL,
  `discount4` float DEFAULT NULL,
  `discount5` float DEFAULT NULL,
  `vat1` float DEFAULT NULL,
  `vat2` float DEFAULT NULL,
  `vat3` float DEFAULT NULL,
  `vat4` float DEFAULT NULL,
  `vat5` float DEFAULT NULL,
  `checked1` tinyint(1) DEFAULT NULL,
  `checked2` tinyint(1) DEFAULT NULL,
  `checked3` tinyint(1) DEFAULT NULL,
  `checked4` tinyint(1) DEFAULT NULL,
  `checked5` tinyint(1) DEFAULT NULL,
  `with_vat` tinyint(1) DEFAULT NULL,
  `machine_id` varchar(15) DEFAULT NULL,
  `encode_id` bigint(20) DEFAULT NULL,
  `update_id` bigint(20) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `inventory` */

insert  into `inventory`(`id`,`barcode`,`description`,`type`,`status`,`category`,`brand`,`generic`,`supplier`,`cost1`,`cost2`,`cost3`,`cost4`,`cost5`,`price1`,`price2`,`price3`,`price4`,`price5`,`unit1`,`unit2`,`unit3`,`unit4`,`unit5`,`discount1`,`discount2`,`discount3`,`discount4`,`discount5`,`vat1`,`vat2`,`vat3`,`vat4`,`vat5`,`checked1`,`checked2`,`checked3`,`checked4`,`checked5`,`with_vat`,`machine_id`,`encode_id`,`update_id`,`encode_date`,`update_date`) values (11,22,'Winter Melon',36,0,45,23,1,29,5.00,0.00,8.00,0.00,0.00,8.00,0.00,10.00,0.00,0.00,0,0,0,0,0,0,0,10,0,0,0,0,0,0,0,0,0,1,0,0,0,'MATOY-PC',1,NULL,'2013-02-14',NULL),(13,5464545645,'Pytondil',39,0,46,26,1,31,25.00,0.00,0.00,0.00,10.00,25.00,0.00,0.00,0.00,26.25,50,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,'MATOY-PC',1,0,'2013-02-09','0000-00-00'),(14,11234,'Chicken',36,NULL,45,23,5,1,2.00,0.00,0.00,0.00,0.00,4.00,0.00,0.00,0.00,0.00,50,0,0,0,0,0,0,0,0,0,10,0,0,0,0,1,0,0,0,0,0,'MATOY-PC',1,NULL,'2013-02-09',NULL);

/*Table structure for table `purchase_order` */

DROP TABLE IF EXISTS `purchase_order`;

CREATE TABLE `purchase_order` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `po_id` bigint(15) DEFAULT NULL,
  `supplier_id` bigint(15) DEFAULT NULL,
  `machine_id` varchar(25) DEFAULT NULL,
  `inventory_id` bigint(15) DEFAULT NULL,
  `quantity` bigint(15) DEFAULT NULL,
  `transaction_code` bigint(15) DEFAULT NULL,
  `transaction_value` int(2) DEFAULT NULL,
  `inventory_value` int(2) DEFAULT NULL,
  `type_id` varchar(25) DEFAULT NULL,
  `cost` double(10,2) DEFAULT NULL,
  `inventory_cost` double(10,2) DEFAULT NULL,
  `po_cost` double(10,2) DEFAULT NULL,
  `unit_id` bigint(15) DEFAULT NULL,
  `discount` double(10,2) DEFAULT NULL,
  `total_discount` double(10,2) DEFAULT NULL,
  `freight_charges` double(10,2) DEFAULT NULL,
  `status_id` bigint(15) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `date_of_purchase` date DEFAULT NULL,
  `date_of_arrival` date DEFAULT NULL,
  `encode_id` bigint(15) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `update_id` bigint(15) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchase_order` */

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(30) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `title` bigint(15) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `fax_number` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `machine_id` varchar(15) DEFAULT NULL,
  `encode_id` bigint(15) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `update_id` bigint(15) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `supplier` */

insert  into `supplier`(`id`,`company_name`,`name`,`title`,`address`,`city`,`phone_number`,`fax_number`,`email`,`machine_id`,`encode_id`,`encode_date`,`update_id`,`update_date`) values (3,'Soft Developers','CaesarIII Cavs',60,'Pipai','Dumaguete','1234','','sar_c57@yahoo.com','MATOY-PC',1,'2013-02-09',NULL,NULL),(4,'Addadissssss','Rizal Martin Badon',58,'Locsin St','Dipolog City','102100','090921','guesme@ya','MATOY-PC',1,'2013-02-15',NULL,NULL);

/*Table structure for table `transaction` */

DROP TABLE IF EXISTS `transaction`;

CREATE TABLE `transaction` (
  `id` bigint(13) NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `barcode` bigint(20) DEFAULT NULL,
  `transaction_id` bigint(13) DEFAULT NULL,
  `batch_id` bigint(13) DEFAULT NULL,
  `machine_id` varchar(15) DEFAULT NULL,
  `branch_id` bigint(13) DEFAULT NULL,
  `reference_id` bigint(13) DEFAULT NULL,
  `rr_id` bigint(13) DEFAULT NULL,
  `trans_code` varchar(2) DEFAULT NULL,
  `customer_id` bigint(13) DEFAULT NULL,
  `inventory_id` bigint(13) DEFAULT NULL,
  `supplier_id` bigint(13) DEFAULT NULL,
  `status_id` bigint(13) DEFAULT NULL,
  `unit_id` bigint(10) DEFAULT NULL,
  `ar_id` bigint(10) DEFAULT NULL,
  `payment_id` bigint(10) DEFAULT NULL,
  `transaction_value` int(2) DEFAULT NULL,
  `inventory_value` int(2) DEFAULT NULL,
  `brand` bigint(15) DEFAULT NULL,
  `category` bigint(20) DEFAULT NULL,
  `generic` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `cost` float(10,2) DEFAULT NULL,
  `cost_sub_total` float(10,2) DEFAULT NULL,
  `price` float(10,2) DEFAULT NULL,
  `discount` float(10,2) DEFAULT NULL,
  `total_discount` float(10,2) DEFAULT NULL,
  `vat` float(10,2) DEFAULT NULL,
  `quantity` bigint(10) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `checked_by` varchar(25) DEFAULT NULL,
  `encode_id` bigint(5) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `update_id` bigint(5) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `transaction` */

insert  into `transaction`(`id`,`description`,`barcode`,`transaction_id`,`batch_id`,`machine_id`,`branch_id`,`reference_id`,`rr_id`,`trans_code`,`customer_id`,`inventory_id`,`supplier_id`,`status_id`,`unit_id`,`ar_id`,`payment_id`,`transaction_value`,`inventory_value`,`brand`,`category`,`generic`,`type_id`,`cost`,`cost_sub_total`,`price`,`discount`,`total_discount`,`vat`,`quantity`,`expiration_date`,`remarks`,`checked_by`,`encode_id`,`encode_date`,`update_id`,`update_date`) values (1,'Winter Melon',22,1,NULL,'PRGMMR-PC',NULL,NULL,NULL,'1',NULL,11,NULL,NULL,0,NULL,NULL,1,-1,23,36,1,1,NULL,NULL,8.00,5.00,NULL,NULL,1,NULL,NULL,NULL,1,'2014-06-18',NULL,NULL),(2,'Chicken',11234,1,NULL,'PRGMMR-PC',NULL,NULL,NULL,'1',NULL,14,NULL,NULL,50,NULL,NULL,1,-1,23,36,5,5,NULL,NULL,4.40,5.00,NULL,NULL,1,NULL,NULL,NULL,1,'2014-06-18',NULL,NULL);

/*Table structure for table `transaction_code` */

DROP TABLE IF EXISTS `transaction_code`;

CREATE TABLE `transaction_code` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `description` varchar(30) DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `transaction_value` bigint(5) DEFAULT NULL,
  `inventory_value` bigint(5) DEFAULT NULL,
  `machine_id` varchar(15) DEFAULT NULL,
  `encode_id` bigint(15) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `update_id` bigint(15) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `transaction_code` */

insert  into `transaction_code`(`id`,`description`,`code`,`transaction_value`,`inventory_value`,`machine_id`,`encode_id`,`encode_date`,`update_id`,`update_date`) values (1,'Sales','S',1,-1,NULL,NULL,'2012-04-18',NULL,NULL),(2,'Purchase','P',-1,1,NULL,NULL,'2012-04-18',NULL,NULL),(3,'Sales Return','SR',-1,1,NULL,NULL,'2012-04-19',NULL,NULL),(4,'Distribution Initial','DI',0,-1,NULL,NULL,'2012-04-20',NULL,NULL),(5,'Stock Out','SO',0,-1,NULL,0,'2012-04-20',0,'0000-00-00'),(6,'Distribution Destination','DD',0,1,'',0,'2012-04-20',0,'0000-00-00');

/*Table structure for table `warehouse` */

DROP TABLE IF EXISTS `warehouse`;

CREATE TABLE `warehouse` (
  `id` bigint(13) NOT NULL AUTO_INCREMENT,
  `description` varchar(20) DEFAULT NULL,
  `address` varchar(15) DEFAULT NULL,
  `machine_id` varchar(15) DEFAULT NULL,
  `encode_id` bigint(13) DEFAULT NULL,
  `update_id` bigint(13) DEFAULT NULL,
  `encode_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `warehouse` */

insert  into `warehouse`(`id`,`description`,`address`,`machine_id`,`encode_id`,`update_id`,`encode_date`,`update_date`) values (1,'Warehouse','bagacay',NULL,0,0,'0000-00-00','0000-00-00'),(2,'Main Branch','NOPH',NULL,0,0,'0000-00-00','0000-00-00'),(3,'Branch1','Holy Child',NULL,0,0,'0000-00-00','0000-00-00'),(4,'Branch2','Medical Center',NULL,0,0,'0000-00-00','0000-00-00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
