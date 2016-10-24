/*
SQLyog Trial v8.71 
MySQL - 5.5.48 : Database - gameshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`gameshop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `gameshop`;

/*Table structure for table `accessories` */

DROP TABLE IF EXISTS `accessories`;

CREATE TABLE `accessories` (
  `item_id` int(11) NOT NULL,
  `manufacturer` varchar(20) NOT NULL,
  `warranty` decimal(10,0) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `accessories_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `accessories` */

insert  into `accessories`(`item_id`,`manufacturer`,`warranty`) values (11,'JBL','1'),(12,'Samsung','2'),(13,'Energizer','1');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `item_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  KEY `item_id` (`item_id`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `games` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `category` */

insert  into `category`(`item_id`,`category`) values (1,'Action'),(2,'Arcade'),(3,'Shooter'),(4,'Action'),(4,'Arcade'),(5,'Action'),(6,'Sports'),(7,'Sports'),(8,'Shooter'),(9,'Puzzle'),(9,'Action'),(10,'Racing');

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `customer` */

insert  into `customer`(`customer_id`,`name`,`phone`) values (1,'bharani','4049338413'),(2,'srinivas','2672749511'),(3,'charan','4019128413'),(4,'John','2019338445'),(5,'Joseph','8129338413'),(6,'Mike','5059333412'),(7,'Larry','9792742482'),(8,'philips','5238423648'),(9,'Alice','6533747391'),(10,'sameera','2348984348');

/*Table structure for table `customer_address` */

DROP TABLE IF EXISTS `customer_address`;

CREATE TABLE `customer_address` (
  `customer_id` int(11) NOT NULL,
  `street` varchar(30) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `zip` decimal(5,0) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `customer_address` */

insert  into `customer_address`(`customer_id`,`street`,`city`,`zip`,`state`) values (2,'8933 Mulberry Court','Newton','7860','NJ'),(3,'3980 Elm Avenue','Fort Lauderdale','33308','FL'),(4,'6341 Ann Street','Gaithersburg','20877','MD'),(5,'6890 Hudson Street','Livingston','7039','NJ'),(6,'5613 6th Avenue','Fort Myers','33905','FL'),(7,'8578 Edgewood Drive','Fort Mill','29708','SC'),(8,'5699 Washington Street','Dyersburg','38024','TN'),(9,'260 Valley Road','Vienna','22180','VA'),(10,'5102 Lexington Drive','Los Banos','93635','CA'),(1,'9271 Route 10','Augusta','30906','GA');

/*Table structure for table `customer_order` */

DROP TABLE IF EXISTS `customer_order`;

CREATE TABLE `customer_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `quantity` decimal(10,0) NOT NULL,
  `order_date` date NOT NULL,
  `price` decimal(4,2) NOT NULL,
  `emp_id` int(11) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `customer_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `customer_order_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `customer_order` */

insert  into `customer_order`(`order_id`,`customer_id`,`quantity`,`order_date`,`price`,`emp_id`) values (1,1,'2','2012-10-10','75.00',1),(2,1,'5','2012-12-11','99.00',2),(3,6,'4','2013-04-08','85.00',5),(4,5,'8','2014-06-07','95.00',8),(5,9,'2','2015-03-01','85.00',2),(6,4,'5','2010-07-08','45.00',9),(7,6,'7','2015-02-09','63.00',7),(8,3,'4','2014-03-04','80.00',2),(9,8,'6','2011-11-04','45.00',2),(10,2,'5','2014-12-12','90.00',3);

/*Table structure for table `dependent` */

DROP TABLE IF EXISTS `dependent`;

CREATE TABLE `dependent` (
  `emp_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `sex` char(1) NOT NULL,
  `dob` date NOT NULL,
  `relationship` varchar(15) DEFAULT NULL,
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dependent` */

insert  into `dependent`(`emp_id`,`name`,`sex`,`dob`,`relationship`) values (1,'pavan','m','1992-04-05','brother'),(2,'karna','m','1991-04-05','brother'),(3,'cherry','m','1992-04-08','cousin'),(4,'elisha','f','1994-04-06','sister'),(5,'kristein','f','1975-04-05','mother'),(6,'martin','m','1972-06-08','father'),(7,'ruther','m','1980-04-05','uncle'),(8,'harry','m','1945-09-10','grand father'),(9,'branden','m','1985-04-05','brother'),(10,'johnny','m','1992-04-05','brother');

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(15) NOT NULL,
  `ssn` varchar(10) NOT NULL,
  `phone` decimal(10,0) NOT NULL,
  `dob` date DEFAULT NULL,
  `sex` char(1) NOT NULL,
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `ssn` (`ssn`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `employee` */

insert  into `employee`(`emp_id`,`firstname`,`lastname`,`ssn`,`phone`,`dob`,`sex`) values (1,'james','borg','888665555','9848423322','1937-11-10','M'),(2,'john','smith','123456789','7354374345','1965-01-09','M'),(3,'franklin','wong','333445555','8334636532','1955-12-08','M'),(4,'alicia','zelaya','999887777','7833312334','1968-01-19','F'),(5,'jennifer','wallace','987654321','2347467749','1941-06-20','F'),(6,'ramesh','narayan','666884444','4534246263','1962-09-15','M'),(7,'ahmad','jabbar','987987987','9489458843','1969-03-29','M'),(8,'joyce','english','453453453','8787223234','1972-07-31','F'),(9,'davis','pollack','838323231','8246246247','1965-11-20','M'),(10,'debra','noggle','542214589','5419825934','1984-01-16','F');

/*Table structure for table `employee_address` */

DROP TABLE IF EXISTS `employee_address`;

CREATE TABLE `employee_address` (
  `emp_id` int(11) NOT NULL,
  `street` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `zip` decimal(5,0) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  KEY `emp_id` (`emp_id`),
  CONSTRAINT `employee_address_ibfk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `employee_address` */

insert  into `employee_address`(`emp_id`,`street`,`city`,`zip`,`state`) values (1,'422 Madison Street','Erlanger','41018','KY'),(2,'814 Creek Road','Torrance','90505','CA'),(3,'383 12th Street','Cottage Grove','55016','MN'),(4,'719 Andover Court','Freeport','11520','NY'),(5,'732 Hillside Avenue','Bristol','6010','CT'),(6,'180 Locust Lane','Bolingbrook','60440','IL'),(7,'534 Liberty Street','Rockford','49341','MI'),(8,'287 Sunset Avenue','Mount Laurel','8054','NJ'),(9,'16 Valley View Drive','Fishers','46037','IN'),(10,'226 Valley Drive','Elkhart','46514','IN');

/*Table structure for table `games` */

DROP TABLE IF EXISTS `games`;

CREATE TABLE `games` (
  `item_id` int(11) NOT NULL,
  `developer` varchar(20) NOT NULL,
  `publisher` varchar(20) NOT NULL,
  `release_date` date NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `games_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `games` */

insert  into `games`(`item_id`,`developer`,`publisher`,`release_date`) values (1,'sega','sega','1981-05-10'),(2,'ocean software','erbe software','1992-02-15'),(3,'probe','virgingames','1989-06-25'),(4,'us gold','arcade','1999-08-14'),(5,'SW research','sinclair','1995-08-09'),(6,'commodore','activision','2005-06-08'),(7,'cinematronics','activision','2006-06-04'),(8,'spectrum','activision','2009-08-02'),(9,'nintendo','tradewest','2010-04-06'),(10,'commodore','beyond inc','2012-07-05');

/*Table structure for table `item` */

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `rental_price` decimal(10,0) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `quantity` decimal(10,0) NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `item` */

insert  into `item`(`item_id`,`name`,`price`,`rental_price`,`title`,`description`,`quantity`) values (1,'conflict','25','5','conflict','not available','75'),(2,'circus','45','8','circus','not availbale','125'),(3,'conqueror','120','15','conqueror','not available','155'),(4,'congo bongo','150','18','congo bongo','not available','220'),(5,'contra','125','12','contra','not available','350'),(6,'cool pool','180','20','cool pool','not available','280'),(7,'cook race','85','10','cook race','not available','200'),(8,'darius','79','9','darius','not available','195'),(9,'dark side','57','6','dark side','not available','150'),(10,'Edge','99','9','edge','not available','98'),(11,'Bluetooth','80','10','JBL','not available','100'),(12,'Head Set','90','10','Samsung','not available','100'),(13,'Joy Sticks','150','20','Energizer','not availbale','100');

/*Table structure for table `ordered_items` */

DROP TABLE IF EXISTS `ordered_items`;

CREATE TABLE `ordered_items` (
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_quantity` decimal(10,0) NOT NULL,
  KEY `order_id` (`order_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ordered_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`order_id`),
  CONSTRAINT `ordered_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ordered_items` */

insert  into `ordered_items`(`order_id`,`item_id`,`item_quantity`) values (1,2,'5'),(1,3,'2'),(2,4,'4'),(3,1,'1'),(4,8,'4'),(5,6,'2'),(6,11,'2'),(7,12,'1'),(7,13,'1'),(8,5,'3'),(9,6,'1'),(10,7,'4'),(10,5,'3'),(2,2,'1');

/*Table structure for table `purchase_order` */

DROP TABLE IF EXISTS `purchase_order`;

CREATE TABLE `purchase_order` (
  `order_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `purchase_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `purchase_order` */

insert  into `purchase_order`(`order_id`,`purchase_date`) values (1,'2012-10-10'),(3,'2013-04-08'),(5,'2015-03-01'),(7,'2015-02-09');

/*Table structure for table `rating` */

DROP TABLE IF EXISTS `rating`;

CREATE TABLE `rating` (
  `item_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `Rating` decimal(10,0) NOT NULL,
  KEY `item_id` (`item_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`),
  CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rating` */

/*Table structure for table `renewal_order` */

DROP TABLE IF EXISTS `renewal_order`;

CREATE TABLE `renewal_order` (
  `order_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `renewal_date` date NOT NULL,
  `return_date` date NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `renewal_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `renewal_order` */

/*Table structure for table `rental_order` */

DROP TABLE IF EXISTS `rental_order`;

CREATE TABLE `rental_order` (
  `order_id` int(11) NOT NULL,
  `due_date` date NOT NULL,
  `rental_date` date NOT NULL,
  `return_date` date NOT NULL,
  PRIMARY KEY (`order_id`),
  CONSTRAINT `rental_order_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `customer_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rental_order` */

insert  into `rental_order`(`order_id`,`due_date`,`rental_date`,`return_date`) values (2,'2013-01-11','2012-12-11','2013-01-11'),(4,'2014-07-07','2014-06-07','2014-07-07'),(6,'2010-08-08','2010-07-08','2010-08-08'),(8,'2014-04-04','2014-03-04','2014-04-04'),(9,'2011-12-04','2011-11-04','2011-12-04'),(10,'2015-01-12','2014-12-12','2015-01-12');

/*Table structure for table `supplied_items` */

DROP TABLE IF EXISTS `supplied_items`;

CREATE TABLE `supplied_items` (
  `supplier_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `supplied_quantity` decimal(10,0) NOT NULL,
  PRIMARY KEY (`supplier_id`,`item_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `supplied_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  CONSTRAINT `supplied_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `supplied_items` */

insert  into `supplied_items`(`supplier_id`,`item_id`,`supplied_quantity`) values (1,1,'75'),(1,2,'125'),(1,3,'155'),(2,4,'220'),(2,5,'350'),(2,6,'280'),(3,7,'200'),(3,8,'195'),(4,9,'150'),(4,10,'98'),(5,11,'100'),(5,12,'100'),(5,13,'100');

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone` decimal(10,0) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `supplier` */

insert  into `supplier`(`supplier_id`,`name`,`address`,`phone`,`email`) values (1,'us1america','8755 NW 35th ln Miami FL 33172','3055998888','sales@us1america.com'),(2,'EZ games inc','1415 E washington blvd LA CA-90021','2136082718','peter@ezgamesinc.com'),(3,'Alliance distributors','southwest austin texas- 78452','2356984512','sales@alliance.com'),(4,'vast inc','4815 NE 24th ln CA 84233','2159569007','sales@vastinc.com'),(5,'kvbinc','720 W Kenedy Kingsville TX 78363','1049334048','sales@kvbinc.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
