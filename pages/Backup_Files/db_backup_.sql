DROP TABLE IF EXISTS category;

CREATE TABLE `category` (
  `CATEGORY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

INSERT INTO category VALUES("0","Motorcycle Parts");
INSERT INTO category VALUES("1","Auto Parts");
INSERT INTO category VALUES("2","Furniture Supplies");
INSERT INTO category VALUES("3","Lightings");
INSERT INTO category VALUES("4","Plastic Wares");
INSERT INTO category VALUES("5","Electronic Supplies");
INSERT INTO category VALUES("6","Hardware Supplies");


DROP TABLE IF EXISTS customer;

CREATE TABLE `customer` (
  `CUST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`CUST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

INSERT INTO customer VALUES("11","A Walk in Customer","","");
INSERT INTO customer VALUES("17","Sheena","Salera","125");


DROP TABLE IF EXISTS employee;

CREATE TABLE `employee` (
  `EMPLOYEE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `GENDER` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `PHONE_NUMBER` varchar(11) DEFAULT NULL,
  `JOB_ID` int(11) DEFAULT NULL,
  `HIRED_DATE` varchar(50) NOT NULL,
  `LOCATION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`EMPLOYEE_ID`),
  UNIQUE KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  UNIQUE KEY `PHONE_NUMBER` (`PHONE_NUMBER`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  KEY `JOB_ID` (`JOB_ID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`LOCATION_ID`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`JOB_ID`) REFERENCES `job` (`JOB_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

INSERT INTO employee VALUES("1","Sheen ","Sal","Female","sheenasalera3@gmail.com","09123456778","1","0000-00-00","113");
INSERT INTO employee VALUES("5","Kevin","Sabado","Male","12@gmail.com","12345678912","2","2020-12-03","160");
INSERT INTO employee VALUES("6","Jon","Ygay","Male","123@gmail.com","123","1","2020-12-03","161");
INSERT INTO employee VALUES("7","Leslie","Liquit","Female","100@gmail.com","1233546","2","2020-12-05","165");


DROP TABLE IF EXISTS job;

CREATE TABLE `job` (
  `JOB_ID` int(11) NOT NULL,
  `JOB_TITLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`JOB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO job VALUES("1","Manager");
INSERT INTO job VALUES("2","Cashier");


DROP TABLE IF EXISTS location;

CREATE TABLE `location` (
  `LOCATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROVINCE` varchar(100) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;

INSERT INTO location VALUES("1","Philippines","Mandawi");
INSERT INTO location VALUES("113","Surigao del Sur","Lingig");
INSERT INTO location VALUES("156","Negros Occidental","Bacolod");
INSERT INTO location VALUES("159","Mandawi","Philippines");
INSERT INTO location VALUES("160","Davao del Sur","Davao City");
INSERT INTO location VALUES("161","Davao del Sur","Davao City");
INSERT INTO location VALUES("162","Japan","Japan");
INSERT INTO location VALUES("163","Japan","Japan");
INSERT INTO location VALUES("164","China","China");
INSERT INTO location VALUES("165","Davao del Sur","Davao City");


DROP TABLE IF EXISTS manager;

CREATE TABLE `manager` (
  `FIRST_NAME` varchar(50) DEFAULT NULL,
  `LAST_NAME` varchar(50) DEFAULT NULL,
  `LOCATION_ID` int(11) NOT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` varchar(11) DEFAULT NULL,
  UNIQUE KEY `PHONE_NUMBER` (`PHONE_NUMBER`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO manager VALUES("Sheen ","Sal","113","PC@00","09124033805");


DROP TABLE IF EXISTS payment;

CREATE TABLE `payment` (
  `paymentID` int(11) NOT NULL AUTO_INCREMENT,
  `paymentMethod` varchar(30) NOT NULL,
  PRIMARY KEY (`paymentID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

INSERT INTO payment VALUES("1","GCash");


DROP TABLE IF EXISTS product;

CREATE TABLE `product` (
  `PRODUCT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PRODUCT_CODE` varchar(20) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(250) NOT NULL,
  `QTY_STOCK` int(50) DEFAULT NULL,
  `PRICE` int(50) DEFAULT NULL,
  `Unit_ID` int(15) DEFAULT NULL,
  `CATEGORY_ID` int(11) DEFAULT NULL,
  `SUPPLIER_ID` int(11) DEFAULT NULL,
  `Satus_ID` int(50) DEFAULT NULL,
  `DATE_STOCK_IN` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`PRODUCT_ID`),
  KEY `CATEGORY_ID` (`CATEGORY_ID`),
  KEY `SUPPLIER_ID` (`SUPPLIER_ID`),
  KEY `Unit_ID` (`Unit_ID`),
  KEY `Satus_ID` (`Satus_ID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `category` (`CATEGORY_ID`),
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`SUPPLIER_ID`) REFERENCES `supplier` (`SUPPLIER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6598 DEFAULT CHARSET=latin1;

INSERT INTO product VALUES("1","666666","hello","goodbye","1","55","3","5","17","1","2020-12-02 12:05:10");
INSERT INTO product VALUES("6595","123","motor","hfljsljodhv","1","43","3","0","17","1","2020-12-03 16:17:46");
INSERT INTO product VALUES("6596","1234","abcd","furniture ","1","1235","4","2","17","1","2020-12-05 11:49:10");
INSERT INTO product VALUES("6597","4666","auto","autoxssfg","1","45","3","1","18","1","2020-12-05 12:52:17");


DROP TABLE IF EXISTS satus;

CREATE TABLE `satus` (
  `Satus_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Status_Name` varchar(50) NOT NULL,
  PRIMARY KEY (`Satus_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO satus VALUES("1","Available");
INSERT INTO satus VALUES("2","Unavailable");


DROP TABLE IF EXISTS supplier;

CREATE TABLE `supplier` (
  `SUPPLIER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPANY_NAME` varchar(50) DEFAULT NULL,
  `LOCATION_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`SUPPLIER_ID`),
  KEY `LOCATION_ID` (`LOCATION_ID`),
  CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`LOCATION_ID`) REFERENCES `location` (`LOCATION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

INSERT INTO supplier VALUES("17","SamYa","159","123");
INSERT INTO supplier VALUES("18","Global","162","09099090879");
INSERT INTO supplier VALUES("19","Galaxy","163","09099090876");
INSERT INTO supplier VALUES("20","Samya","164","46485");


DROP TABLE IF EXISTS transaction;

CREATE TABLE `transaction` (
  `TRANS_ID` int(50) NOT NULL AUTO_INCREMENT,
  `CUST_ID` int(11) DEFAULT NULL,
  `NUMOFITEMS` varchar(250) NOT NULL,
  `SUBTOTAL` varchar(50) NOT NULL,
  `LESSVAT` varchar(50) NOT NULL,
  `NETVAT` varchar(50) NOT NULL,
  `ADDVAT` varchar(50) NOT NULL,
  `GRANDTOTAL` varchar(250) NOT NULL,
  `CASH` varchar(250) NOT NULL,
  `DATE` varchar(50) NOT NULL,
  `TRANS_D_ID` varchar(250) NOT NULL,
  PRIMARY KEY (`TRANS_ID`),
  KEY `TRANS_DETAIL_ID` (`TRANS_D_ID`),
  KEY `CUST_ID` (`CUST_ID`),
  CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`CUST_ID`) REFERENCES `customer` (`CUST_ID`),
  CONSTRAINT `transaction_ibfk_4` FOREIGN KEY (`TRANS_D_ID`) REFERENCES `transaction_details` (`TRANS_D_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

INSERT INTO transaction VALUES("16","11","1","24.00","2.57","21.43","2.57","24.00","50","2020-12-02 07:16 am","120271630");
INSERT INTO transaction VALUES("17","11","1","43.00","4.61","38.39","4.61","43.00","2600","2020-12-04 20:05 pm","1204200528");
INSERT INTO transaction VALUES("18","11","1","1,235.00","132.32","1,102.68","132.32","1,235.00","2000","2020-12-05 05:43 am","120554408");
INSERT INTO transaction VALUES("19","11","2","174.00","0.21","155.36","0.21","174.00","170","2020-12-05 06:37 am","120563752");
INSERT INTO transaction VALUES("20","11","3","1,366.00","1.64","1,219.64","1.64","1,366.00","2000","2020-12-05 07:41 am","120574422");
INSERT INTO transaction VALUES("21","11","1","43.00","0.05","38.39","0.05","43.00","60","2020-12-11 18:04 pm","1211180918");


DROP TABLE IF EXISTS transaction_details;

CREATE TABLE `transaction_details` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TRANS_D_ID` varchar(250) NOT NULL,
  `PRODUCTS` varchar(250) NOT NULL,
  `QTY` varchar(250) NOT NULL,
  `PRICE` varchar(250) NOT NULL,
  `EMPLOYEE` varchar(250) NOT NULL,
  `ROLE` varchar(250) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `TRANS_D_ID` (`TRANS_D_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

INSERT INTO transaction_details VALUES("23","120271630","hello","1","24","Sheen ","Manager");
INSERT INTO transaction_details VALUES("24","1204200528","motor","1","43","Sheen ","Manager");
INSERT INTO transaction_details VALUES("25","120554408","abcd","1","1235","Sheen ","Manager");
INSERT INTO transaction_details VALUES("26","120563752","motor","3","43","Sheen ","Manager");
INSERT INTO transaction_details VALUES("27","120563752","auto","1","45","Sheen ","Manager");
INSERT INTO transaction_details VALUES("28","120574422","motor","2","43","Sheen ","Manager");
INSERT INTO transaction_details VALUES("29","120574422","auto","1","45","Sheen ","Manager");
INSERT INTO transaction_details VALUES("30","120574422","abcd","1","1235","Sheen ","Manager");
INSERT INTO transaction_details VALUES("31","1211180918","motor","1","43","Sheen ","Manager");


DROP TABLE IF EXISTS type;

CREATE TABLE `type` (
  `TYPE_ID` int(11) NOT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO type VALUES("1","Admin");
INSERT INTO type VALUES("2","User");


DROP TABLE IF EXISTS unit;

CREATE TABLE `unit` (
  `Unit_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Unit_Name` varchar(10) NOT NULL,
  PRIMARY KEY (`Unit_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO unit VALUES("1","Kilo");
INSERT INTO unit VALUES("2","Ounce");
INSERT INTO unit VALUES("3","Pack");
INSERT INTO unit VALUES("4","Pieces");


DROP TABLE IF EXISTS users;

CREATE TABLE `users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMPLOYEE_ID` int(11) DEFAULT NULL,
  `USERNAME` varchar(50) DEFAULT NULL,
  `PASSWORD` varchar(50) DEFAULT NULL,
  `TYPE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `TYPE_ID` (`TYPE_ID`),
  KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`TYPE_ID`) REFERENCES `type` (`TYPE_ID`),
  CONSTRAINT `users_ibfk_4` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employee` (`EMPLOYEE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

INSERT INTO users VALUES("1","1","admin","d033e22ae348aeb5660fc2140aec35850c4da997","1");
INSERT INTO users VALUES("10","5","kevz","e4988541386a50d05191c408ef730f760c2db990","2");
INSERT INTO users VALUES("11","6","ygay","cb64fef0d134a3cef0c6ca3ea043525fed27c067","2");


