/*
DDL QUERIES FOR DATABASE motor_pool
*/

CREATE TABLE `DEPARTMENT_ADMINISTRATOR` (
  `Administrator_ID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  PRIMARY KEY (`Administrator_ID`)
) 

CREATE TABLE `VEHICLE` (
  `VIN` varchar(45) NOT NULL,
  `Type` varchar(45) NOT NULL,
  `Ownership` varchar(45) NOT NULL,
  PRIMARY KEY (`VIN`)
)vehicleVINTypeOwnership

CREATE TABLE `TRAINING_PROGRAM` (
  `Program_ID` int NOT NULL,
  `Training_status` varchar(45) NOT NULL,
  PRIMARY KEY (`Program_ID`)
) 

CREATE TABLE `DRIVER` (
  `License_ID` varchar(45) NOT NULL,
  `Date_Of_Birth` varchar(45) NOT NULL,
  `Age` int NOT NULL,
  `Address` varchar(45) NOT NULL,
  `Phone_Number` varchar(45) NOT NULL,
  `Date_Of_Hire` datetime NOT NULL,
  `First_Name` varchar(45) NOT NULL,
  `Middle_Name` varchar(45) DEFAULT NULL,
  `Last_Name` varchar(45) NOT NULL,
  `Form_Submission_Status` varchar(45) NOT NULL,
  `Health_Condition` varchar(45) DEFAULT NULL,
  `Years_Of_Driving` int NOT NULL,
  `Gender` varchar(45) NOT NULL,
  `Driver_Type` varchar(45) NOT NULL,
  `Driver_Of_12_Flag` varchar(45) DEFAULT NULL,
  `Date_Of_Attend` varchar(45) DEFAULT NULL,
  `Commercial_Driver_Flag` varchar(45) DEFAULT NULL,
  `CDL_Number` varchar(45) DEFAULT NULL,
  `Driver_Of_12_Training_Program_ID` int DEFAULT NULL,
  `Dept_Admin_ID` int NOT NULL,
  PRIMARY KEY (`License_ID`),
  KEY `Driver_of_12_idx` (`Driver_Of_12_Training_Program_ID`),
  KEY `Dept_Admin_idx` (`Dept_Admin_ID`),
  CONSTRAINT `Dept_Admin` FOREIGN KEY (`Dept_Admin_ID`) REFERENCES `DEPARTMENT_ADMINISTRATOR` (`Administrator_ID`),
  CONSTRAINT `Driver_Of_12` FOREIGN KEY (`Driver_Of_12_Training_Program_ID`) REFERENCES `TRAINING_PROGRAM` (`Program_ID`)
)

CREATE TABLE `DRIVES` (
  `Driver_License_ID` varchar(45) NOT NULL,
  `Vehicle_VIN` varchar(45) NOT NULL,
  KEY `VIN_idx` (`Vehicle_VIN`),
  KEY `DLN_idx` (`Driver_License_ID`),
  KEY `VIN1_idx` (`Vehicle_VIN`),
  CONSTRAINT `DLN` FOREIGN KEY (`Driver_License_ID`) REFERENCES `DRIVER` (`License_ID`),
  CONSTRAINT `VIN1` FOREIGN KEY (`Vehicle_VIN`) REFERENCES `VEHICLE` (`VIN`)
)

CREATE TABLE `RISK_MANAGEMENT_DEPARTMENT_RECORD` (
  `MVR_Form_ID` int NOT NULL,
  `Date_Of_Submission` varchar(45) NOT NULL,
  PRIMARY KEY (`MVR_Form_ID`)
) 

CREATE TABLE `INSURANCE` (
  `Insurance_ID` int NOT NULL,
  `VIN` varchar(45) NOT NULL,
  PRIMARY KEY (`Insurance_ID`),
  KEY `VIN_idx` (`VIN`),
  CONSTRAINT `VIN` FOREIGN KEY (`VIN`) REFERENCES `VEHICLE` (`VIN`)
) 

CREATE TABLE `MVR_FORM` (
  `Form_ID` int NOT NULL,
  `Supervisor` varchar(45) NOT NULL,
  `Supervisor_Phone` varchar(45) NOT NULL,
  `Driver_License_ID` varchar(45) NOT NULL,
  PRIMARY KEY (`Form_ID`),
  KEY `DLN1_idx` (`Driver_License_ID`),
  CONSTRAINT `DLN1` FOREIGN KEY (`Driver_License_ID`) REFERENCES `DRIVER` (`License_ID`),
  CONSTRAINT `MVR_Form_ID` FOREIGN KEY (`Form_ID`) REFERENCES `RISK_MANAGEMENT_DEPARTMENT_RECORD` (`MVR_Form_ID`)
)

CREATE TABLE `PERSONAL_VEHICLE` (
  `Insurance_ID` int NOT NULL,
  `Excess_Amount` int NOT NULL,
  PRIMARY KEY (`Insurance_ID`),
  CONSTRAINT `Insurance_ID1` FOREIGN KEY (`Insurance_ID`) REFERENCES `INSURANCE` (`Insurance_ID`)
) 

CREATE TABLE `RENTAL_VEHICLE` (
  `Insurance_ID` int NOT NULL,
  `Damage_Amount` int NOT NULL,
  `Liability_Amount` int NOT NULL,
  PRIMARY KEY (`Insurance_ID`),
  KEY `Insurance_ID2_idx` (`Insurance_ID`),
  CONSTRAINT `Insurance_ID2` FOREIGN KEY (`Insurance_ID`) REFERENCES `INSURANCE` (`Insurance_ID`)
) 

CREATE TABLE `UK_VEHICLE` (
  `Insurance_ID` int NOT NULL,
  `Body_Injury_Amount` int NOT NULL,
  `Damage_Property` int NOT NULL,
  PRIMARY KEY (`Insurance_ID`),
  CONSTRAINT `Insurance_ID` FOREIGN KEY (`Insurance_ID`) REFERENCES `INSURANCE` (`Insurance_ID`)
)

CREATE TABLE `STATE_MOTOR_VEHICLE_RECORD` (
  `Record_ID` int NOT NULL,
  `Deficiency_Points` int NOT NULL,
  `DLN` varchar(45) NOT NULL,
  PRIMARY KEY (`Record_ID`),
  KEY `DLN2_idx` (`DLN`),
  CONSTRAINT `DLN2` FOREIGN KEY (`DLN`) REFERENCES `DRIVER` (`License_ID`)
) 

/*
DML QUERIES
*/

INSERT INTO `DEPARTMENT_ADMINISTRATOR` (`Administrator_ID`,`Name`,`Phone`) VALUES (1,' Tony Stark','700-655-000');
INSERT INTO `DEPARTMENT_ADMINISTRATOR` (`Administrator_ID`,`Name`,`Phone`) VALUES (2,'John Snow','700-700-300');
INSERT INTO `DEPARTMENT_ADMINISTRATOR` (`Administrator_ID`,`Name`,`Phone`) VALUES (3,'James Harden','700-533-080');
INSERT INTO `DEPARTMENT_ADMINISTRATOR` (`Administrator_ID`,`Name`,`Phone`) VALUES (4,'Daler Mehndi','700-343-090');
INSERT INTO `DEPARTMENT_ADMINISTRATOR` (`Administrator_ID`,`Name`,`Phone`) VALUES (5,'ImperialHal','701-909-333');
INSERT INTO `DEPARTMENT_ADMINISTRATOR` (`Administrator_ID`,`Name`,`Phone`) VALUES (6,'Jay Chou','701-001-003');
INSERT INTO `DEPARTMENT_ADMINISTRATOR` (`Administrator_ID`,`Name`,`Phone`) VALUES (7,'James Bond','700-007-700');
/*
-- Query: SELECT * FROM motor_pool.DEPARTMENT_ADMINISTRATOR;
LIMIT 0, 1000
*/

INSERT INTO `VEHICLE` (`VIN`,`Type`,`Ownership`) VALUES ('1FMZU72X6YZC22785','Bus','Rental');
INSERT INTO `VEHICLE` (`VIN`,`Type`,`Ownership`) VALUES ('1G8ZF5287XZ363384','Bus','UK');
INSERT INTO `VEHICLE` (`VIN`,`Type`,`Ownership`) VALUES ('1GNDV23L26D236839','Sedan','UK');
INSERT INTO `VEHICLE` (`VIN`,`Type`,`Ownership`) VALUES ('2T1KR32EX3C158977','Bus','UK');
INSERT INTO `VEHICLE` (`VIN`,`Type`,`Ownership`) VALUES ('3B7KF23Z42M211215','Pickup','UK');
INSERT INTO `VEHICLE` (`VIN`,`Type`,`Ownership`) VALUES ('JH4KA3250KC009863','Sedan','Rental');
INSERT INTO `VEHICLE` (`VIN`,`Type`,`Ownership`) VALUES ('JM3ER293490222369','SportsCar','Personal');
INSERT INTO `VEHICLE` (`VIN`,`Type`,`Ownership`) VALUES ('WD2YD241825356884','Sedan','Rental');
INSERT INTO `VEHICLE` (`VIN`,`Type`,`Ownership`) VALUES ('ZAMGJ45A390047326','SportsCar','Personal');
/*
-- Query: SELECT * FROM motor_pool.VEHICLE;
LIMIT 0, 1000
*/

INSERT INTO `TRAINING_PROGRAM` (`Program_ID`,`Training_status`) VALUES (1,'Complete');
INSERT INTO `TRAINING_PROGRAM` (`Program_ID`,`Training_status`) VALUES (2,'Incomplete');
INSERT INTO `TRAINING_PROGRAM` (`Program_ID`,`Training_status`) VALUES (3,'Complete');
INSERT INTO `TRAINING_PROGRAM` (`Program_ID`,`Training_status`) VALUES (4,'Incomplete');
INSERT INTO `TRAINING_PROGRAM` (`Program_ID`,`Training_status`) VALUES (5,'Complete');
INSERT INTO `TRAINING_PROGRAM` (`Program_ID`,`Training_status`) VALUES (6,'Complete');
/*
-- Query: SELECT * FROM motor_pool.TRAINING_PROGRAM;
LIMIT 0, 1000
*/

INSERT INTO `DRIVER` (`License_ID`,`Date_Of_Birth`,`Age`,`Address`,`Phone_Number`,`Date_Of_Hire`,`First_Name`,`Middle_Name`,`Last_Name`,`Form_Submission_Status`,`Health_Condition`,`Years_Of_Driving`,`Gender`,`Driver_Type`,`Driver_Of_12_Flag`,`Date_Of_Attend`,`Commercial_Driver_Flag`,`CDL_Number`,`Driver_Of_12_Training_Program_ID`,`Dept_Admin_ID`) VALUES ('K19-383-793','1988-04-03',33,'2897 Karen Lane','202-555-0168','2007-03-29 00:00:00','Steve',NULL,'Kerr','Submitted','No',10,'Male','Personal','No',NULL,'No',NULL,NULL,4);
INSERT INTO `DRIVER` (`License_ID`,`Date_Of_Birth`,`Age`,`Address`,`Phone_Number`,`Date_Of_Hire`,`First_Name`,`Middle_Name`,`Last_Name`,`Form_Submission_Status`,`Health_Condition`,`Years_Of_Driving`,`Gender`,`Driver_Type`,`Driver_Of_12_Flag`,`Date_Of_Attend`,`Commercial_Driver_Flag`,`CDL_Number`,`Driver_Of_12_Training_Program_ID`,`Dept_Admin_ID`) VALUES ('K19-960-242','1994-07-21',27,'2921 Carolyns Circle','202-555-0131','2005-07-03 00:00:00','Kerry',NULL,'Kegan','Submitted','No',3,'Female','Commercial','No',NULL,'Yes','K19-960-242',NULL,3);
INSERT INTO `DRIVER` (`License_ID`,`Date_Of_Birth`,`Age`,`Address`,`Phone_Number`,`Date_Of_Hire`,`First_Name`,`Middle_Name`,`Last_Name`,`Form_Submission_Status`,`Health_Condition`,`Years_Of_Driving`,`Gender`,`Driver_Type`,`Driver_Of_12_Flag`,`Date_Of_Attend`,`Commercial_Driver_Flag`,`CDL_Number`,`Driver_Of_12_Training_Program_ID`,`Dept_Admin_ID`) VALUES ('S20-141-386','1970-02-21',51,'2664 Glen Street','202-555-0137\n','2004-01-01 00:00:00','John',NULL,'Smith','Submitted','Yes',10,'Male','Personal','Yes','2007-08-10','No',NULL,1,1);
/*
-- Query: SELECT * FROM motor_pool.DRIVER;
LIMIT 0, 1000
*/

INSERT INTO `DRIVES` (`Driver_License_ID`,`Vehicle_VIN`) VALUES ('K19-960-242','1GNDV23L26D236839');
INSERT INTO `DRIVES` (`Driver_License_ID`,`Vehicle_VIN`) VALUES ('K19-960-242','3B7KF23Z42M211215');
INSERT INTO `DRIVES` (`Driver_License_ID`,`Vehicle_VIN`) VALUES ('S20-141-386','1G8ZF5287XZ363384');
INSERT INTO `DRIVES` (`Driver_License_ID`,`Vehicle_VIN`) VALUES ('S20-141-386','1FMZU72X6YZC22785');
INSERT INTO `DRIVES` (`Driver_License_ID`,`Vehicle_VIN`) VALUES ('S20-141-386','2T1KR32EX3C158977');
INSERT INTO `DRIVES` (`Driver_License_ID`,`Vehicle_VIN`) VALUES ('S20-141-386','JH4KA3250KC009863');
/*
-- Query: SELECT * FROM motor_pool.DRIVES;
LIMIT 0, 1000
*/


INSERT INTO `RISK_MANAGEMENT_DEPARTMENT_RECORD` (`MVR_Form_ID`,`Date_Of_Submission`) VALUES (1,'2021-08-20');
INSERT INTO `RISK_MANAGEMENT_DEPARTMENT_RECORD` (`MVR_Form_ID`,`Date_Of_Submission`) VALUES (2,'2021-04-02');
INSERT INTO `RISK_MANAGEMENT_DEPARTMENT_RECORD` (`MVR_Form_ID`,`Date_Of_Submission`) VALUES (3,'2020-11-23');
INSERT INTO `RISK_MANAGEMENT_DEPARTMENT_RECORD` (`MVR_Form_ID`,`Date_Of_Submission`) VALUES (4,'2019-12-25');
INSERT INTO `RISK_MANAGEMENT_DEPARTMENT_RECORD` (`MVR_Form_ID`,`Date_Of_Submission`) VALUES (5,'2017-02-01');
INSERT INTO `RISK_MANAGEMENT_DEPARTMENT_RECORD` (`MVR_Form_ID`,`Date_Of_Submission`) VALUES (6,'2021-04-27');
/*
-- Query: SELECT * FROM motor_pool.RISK_MANAGEMENT_DEPARTMENT_RECORD;
LIMIT 0, 1000
*/

INSERT INTO `INSURANCE` (`Insurance_ID`,`VIN`) VALUES (1,'1FMZU72X6YZC22785');
INSERT INTO `INSURANCE` (`Insurance_ID`,`VIN`) VALUES (2,'1G8ZF5287XZ363384');
INSERT INTO `INSURANCE` (`Insurance_ID`,`VIN`) VALUES (3,'1GNDV23L26D236839');
INSERT INTO `INSURANCE` (`Insurance_ID`,`VIN`) VALUES (4,'2T1KR32EX3C158977');
INSERT INTO `INSURANCE` (`Insurance_ID`,`VIN`) VALUES (5,'3B7KF23Z42M211215');
INSERT INTO `INSURANCE` (`Insurance_ID`,`VIN`) VALUES (6,'JH4KA3250KC009863');
INSERT INTO `INSURANCE` (`Insurance_ID`,`VIN`) VALUES (7,'JM3ER293490222369');
INSERT INTO `INSURANCE` (`Insurance_ID`,`VIN`) VALUES (8,'WD2YD241825356884');
INSERT INTO `INSURANCE` (`Insurance_ID`,`VIN`) VALUES (9,'ZAMGJ45A390047326');
/*
-- Query: SELECT * FROM motor_pool.INSURANCE;
LIMIT 0, 1000
*/

INSERT INTO `MVR_FORM` (`Form_ID`,`Supervisor`,`Supervisor_Phone`,`Driver_License_ID`) VALUES (1,' Tony Stark','700-655-000','K19-383-793');
INSERT INTO `MVR_FORM` (`Form_ID`,`Supervisor`,`Supervisor_Phone`,`Driver_License_ID`) VALUES (2,'John Snow','700-700-300','K19-383-793');
INSERT INTO `MVR_FORM` (`Form_ID`,`Supervisor`,`Supervisor_Phone`,`Driver_License_ID`) VALUES (3,'Daler Mehndi','700-343-090','K19-960-242');
INSERT INTO `MVR_FORM` (`Form_ID`,`Supervisor`,`Supervisor_Phone`,`Driver_License_ID`) VALUES (4,'James Bond','700-007-700','K19-960-242');
INSERT INTO `MVR_FORM` (`Form_ID`,`Supervisor`,`Supervisor_Phone`,`Driver_License_ID`) VALUES (5,'ImperialHal','701-909-333','S20-141-386');
INSERT INTO `MVR_FORM` (`Form_ID`,`Supervisor`,`Supervisor_Phone`,`Driver_License_ID`) VALUES (6,'James Bond','700-007-700','S20-141-386');
/*
-- Query: SELECT * FROM motor_pool.MVR_FORM;
LIMIT 0, 1000
*/


INSERT INTO `PERSONAL_VEHICLE` (`Insurance_ID`,`Excess_Amount`) VALUES (7,10000);
INSERT INTO `PERSONAL_VEHICLE` (`Insurance_ID`,`Excess_Amount`) VALUES (9,10000);
/*
-- Query: SELECT * FROM motor_pool.PERSONAL_VEHICLE;
LIMIT 0, 1000
*/

INSERT INTO `RENTAL_VEHICLE` (`Insurance_ID`,`Damage_Amount`,`Liability_Amount`) VALUES (1,5000,5000);
INSERT INTO `RENTAL_VEHICLE` (`Insurance_ID`,`Damage_Amount`,`Liability_Amount`) VALUES (6,10000,5000);
INSERT INTO `RENTAL_VEHICLE` (`Insurance_ID`,`Damage_Amount`,`Liability_Amount`) VALUES (8,10000,5000);
/*
-- Query: SELECT * FROM motor_pool.RENTAL_VEHICLE;
LIMIT 0, 1000
*/


INSERT INTO `UK_VEHICLE` (`Insurance_ID`,`Body_Injury_Amount`,`Damage_Property`) VALUES (2,10000,100000);
INSERT INTO `UK_VEHICLE` (`Insurance_ID`,`Body_Injury_Amount`,`Damage_Property`) VALUES (3,10000,100000);
INSERT INTO `UK_VEHICLE` (`Insurance_ID`,`Body_Injury_Amount`,`Damage_Property`) VALUES (4,15000,100000);
INSERT INTO `UK_VEHICLE` (`Insurance_ID`,`Body_Injury_Amount`,`Damage_Property`) VALUES (5,20000,100000);
/*
-- Query: SELECT * FROM motor_pool.UK_VEHICLE;
LIMIT 0, 1000
*/

INSERT INTO `STATE_MOTOR_VEHICLE_RECORD` (`Record_ID`,`Deficiency_Points`,`DLN`) VALUES (1,1,'K19-383-793');
INSERT INTO `STATE_MOTOR_VEHICLE_RECORD` (`Record_ID`,`Deficiency_Points`,`DLN`) VALUES (2,1,'K19-383-793');
INSERT INTO `STATE_MOTOR_VEHICLE_RECORD` (`Record_ID`,`Deficiency_Points`,`DLN`) VALUES (3,2,'K19-960-242');
INSERT INTO `STATE_MOTOR_VEHICLE_RECORD` (`Record_ID`,`Deficiency_Points`,`DLN`) VALUES (4,1,'K19-960-242');
INSERT INTO `STATE_MOTOR_VEHICLE_RECORD` (`Record_ID`,`Deficiency_Points`,`DLN`) VALUES (5,1,'S20-141-386');
INSERT INTO `STATE_MOTOR_VEHICLE_RECORD` (`Record_ID`,`Deficiency_Points`,`DLN`) VALUES (6,1,'S20-141-386');
/*
-- Query: SELECT * FROM motor_pool.STATE_MOTOR_VEHICLE_RECORD;
LIMIT 0, 1000
*/

/* 
3 SQL QUERIES
*/

/*
Q1. We want to know the mvr from the information of the driver of a certain vehicle.
Taking VIN = “1GNDV23L26D236839” as an example.
*/

SELECT * FROM motor_pool.MVR_FORM
WHERE Driver_License_ID IN (SELECT Driver_License_ID
							FROM motor_pool.DRIVES
							WHERE Vehicle_VIN = "1GNDV23L26D236839");

/*
Q2. We want to know how many deficiency points a driver currently has given the MVR form ID.
*/
SELECT  SUM(Deficiency_Points)
FROM motor_pool.STATE_MOTOR_VEHICLE_RECORD
WHERE DLN IN (SELECT Driver_License_ID
			  FROM motor_pool.MVR_FORM
			  WHERE Form_ID = 3);
              
/*
Q3. We want to know the insurance information of all Rental vehicles which their driver submitted a mvr form.
*/
SELECT * FROM motor_pool.RENTAL_VEHICLE
WHERE Insurance_ID IN (SELECT Insurance_ID FROM motor_pool.INSURANCE
					   WHERE VIN IN (SELECT Vehicle_VIN AS VINS
									 FROM motor_pool.DRIVES
									 WHERE Driver_License_ID IN (SELECT DISTINCT Driver_License_ID
																 FROM motor_pool.MVR_FORM)));
            
