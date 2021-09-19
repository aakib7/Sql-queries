use project;
CREATE TABLE user
(
  user_id INT NOT NULL,
  f_name VARCHAR(20) NOT NULL,
  l_name VARCHAR(20) NOT NULL,
  pin INT NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE usersaccount
(
  user_amount FLOAT NOT NULL,
  account_status VARCHAR(20),
  account_type VARCHAR (20),
  account_number INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (account_number, user_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE card
(
  card_no INT NOT NULL,
  card_type VARCHAR(25) NOT NULL,
  cardbank_name VARCHAR(25) NOT NULL,
  PRIMARY KEY (card_no)
);

CREATE TABLE usercard
(
  user_id INT NOT NULL,
  card_no INT NOT NULL,
  PRIMARY KEY (user_id, card_no),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (card_no) REFERENCES card(card_no)
);

CREATE TABLE transection
(
  transection_id INT NOT NULL,
  transection_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (transection_id)
);

CREATE TABLE user_address
(
  user_id INT NOT NULL,
  lane_address VARCHAR(50) NOT NULL,
  city VARCHAR(20) NOT NULL,
  postalcode INT NOT NULL,
  province INT NOT NULL,
  PRIMARY KEY (lane_address,user_id ),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);
CREATE TABLE employee_address
(
  employee_id INT NOT NULL,
  lane_address VARCHAR(50) NOT NULL,
  city VARCHAR(20) NOT NULL,
  postalcode INT NOT NULL,
  province INT NOT NULL,
  PRIMARY KEY (lane_address,employee_id ),
  FOREIGN KEY (employee_id) REFERENCES manager(employee_id)
);

CREATE TABLE user_phonenumber
(
  phone_no INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (phone_no,user_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE employee_phonenumber
(
  phone_no INT NOT NULL,
  employee_id INT NOT NULL,
  PRIMARY KEY (phone_no,employee_id),
  FOREIGN KEY (employee_id) REFERENCES manager(employee_id)
);

CREATE TABLE manager
(
  employee_id INT NOT NULL,
  f_name VARCHAR(20) NOT NULL,
  l_name VARCHAR(20) NOT NULL,
  machine_id INT NOT NULL,
  PRIMARY KEY (employee_id)
);

CREATE TABLE atm_machine
(
  machine_id INT NOT NULL,
  branch_name INT NOT NULL,
  employee_id INT NOT NULL,
  PRIMARY KEY (machine_id),
  FOREIGN KEY (employee_id) REFERENCES manager(employee_id)
);

CREATE TABLE user_transections
(
  transection_no INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (transection_no),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE transection_record
(
  user_id INT NOT NULL,
  amount FLOAT NOT NULL,
  transection_date DATE NOT NULL,
  transection_id INT NOT NULL,
  transection_no INT NOT NULL,
  machine_id INT NOT NULL,
  PRIMARY KEY (transection_no),
  FOREIGN KEY (transection_id) REFERENCES transection(transection_id),
  FOREIGN KEY (transection_no) REFERENCES user_transections(transection_no),
  FOREIGN KEY (machine_id) REFERENCES atm_machine(machine_id)
);


/** 
insert into user done 
**/
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(1, 'ali','murtza',md5('ali1'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(2, 'Imran','Khan',md5('1232'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(3, 'Daniyal','Alam',md5('1122'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(4, 'Usama','Bhatti',md5('2211'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(5, 'Umer','Farooq',md5('6789'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(6, 'Waqas','Arshad',md5('2332'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(7, 'Hassan','Tariq',md5('4554'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(8, 'Sajawal','Awan',md5('3222'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(9, 'Aaqib','Javed',md5('3333'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(10, 'Abdul','Rehman',md5('4444'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(11, 'Ayaan','Awaan',md5('1243'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(12, 'Saad','Ali',md5('3321'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(13, 'Mustajab','Danish',md5('1123'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(14, 'Hammad','Iqbal',md5('1221'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(15, 'Abdul','Qayyuum',md5('9009'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(16, 'Shoaib','Malik',md5('9880'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(17, 'Fahad','Gujjar',md5('4565'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(18, 'Hassan','Zahid',md5('4445'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(19, 'Qasim','Raiz',md5('3343'));
INSERT INTO user (user_id,f_name,l_name,pin) VALUES(20, 'Saqlain','Ali',md5('0009'));

/** 
insert into user_address done
**/
use project;
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(1, 'house no#20 lane 12 ali town lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(2, 'house no#210 lane 32 Nawab town , lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(3, 'house no#2 lane 21 Model town , lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(4, 'house no#201 lane 14 Bahira town , lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(5, 'house no#222 lane 12 Mustafa town , lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(6, 'house no#12 lane 15 Fasial town ,lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(7, 'house no#1 lane 7 Johar town , lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(8, 'house no#202 lane 6 Azam Garden , lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(9, 'house no#102 lane 4 Dream Garden , lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(10, 'house no#112 lane 9 LDA town , lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(11, 'house no#232 lane 45 silk city , Sialkot','lahore',1224,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(12, 'house no#133 lane 13 khawaja town , Sialkot','Sialkot',1224,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(13, 'house no#204 lane 17 Rehman Town,  Fasialabad','Fasialabad',1034,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(14, 'house no#243 lane 19 Iqbal town , lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(15, 'house no#120 lane 18 Ayyaan Garden , lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(16, 'house no#150 lane 12 Nawab town , lahore','lahore',1234,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(17, 'house no#4 lane 23 Mugalpura  , Gujranwala','lahore',2233,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(18, 'house no#90 lane 44 Kotli Lohran , Sialkot','Sialkot',1224,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(19, 'house no#50 lane 54 City Housing , Multan','lahore',1345,'punjab');
INSERT INTO user_address(user_id,lane_address,city,postalcode,province) VALUES(20, 'house no#70 lane 21 Askri 1 , Sialkot','Sialkot',1224,'punjab');

/** 
insert into user_phonenumber done
**/

INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001122333',1);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001122303',2);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001122833',3);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001172333',4);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001102333',5);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001122003',6);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001100033',7);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001166633',8);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001120133',9);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001122331',10);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001122332',11);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001122322',12);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03001122330',13);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03011122333',14);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03021122333',15);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03031122333',16);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03041122333',17);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03061122333',18);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03331122333',19);
INSERT INTO user_phonenumber(phone_no,user_id) VALUES('03341122333',20);

/** 
insert into usersaccount done
**/
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('1003000','active','current_account','1233214567',1);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('3200000','active','current_account','1233214561',2);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('800000','active','current_account', '1233214562',3);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('12223','active','current_account',  '1233214563',4);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('133004','active','current_account', '1233214564',5);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('1563705','active','current_account','1233214565',6);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('1033306','active','current_account','1233214566',7);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('1022207','active','current_account','1233214568',8);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('1333408','active','current_account','1233214569',9);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('1044450','active','current_account','1233214510',10);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('2343300','active','current_account','1233214511',11);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('1030000','active','current_account','1233214512',12);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('1022000','active','current_account','1233214513',13);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('2133300','active','current_account','1233214514',14);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('2344000','active','current_account','1233214515',15);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('9800000','active','current_account','1233214516',16);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('5666700','active','current_account','1233214517',17);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('9888800','active','current_account','1233214518',18);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('5430000','active','current_account','1233214519',19);
INSERT INTO usersaccount(user_amount,account_status,account_type,account_number,user_id) VALUES('1349000','active','current_account','1233214520',20);

/** 
insert into usercard 
**/
INSERT INTO usercard(user_id,card_no) VALUES(1,12345);
INSERT INTO usercard(user_id,card_no) VALUES(2,22113);
INSERT INTO usercard(user_id,card_no) VALUES(3,12211);
INSERT INTO usercard(user_id,card_no) VALUES(4,89076);
INSERT INTO usercard(user_id,card_no) VALUES(5,67898);
INSERT INTO usercard(user_id,card_no) VALUES(6,23415);
INSERT INTO usercard(user_id,card_no) VALUES(7,11345);
INSERT INTO usercard(user_id,card_no) VALUES(8,23234);
INSERT INTO usercard(user_id,card_no) VALUES(9,12657);
INSERT INTO usercard(user_id,card_no) VALUES(10,78980);
INSERT INTO usercard(user_id,card_no) VALUES(11,89021);
INSERT INTO usercard(user_id,card_no) VALUES(12,54678);
INSERT INTO usercard(user_id,card_no) VALUES(13,54612);
INSERT INTO usercard(user_id,card_no) VALUES(14,09127);
INSERT INTO usercard(user_id,card_no) VALUES(15,91632);
INSERT INTO usercard(user_id,card_no) VALUES(16,69812);
INSERT INTO usercard(user_id,card_no) VALUES(17,87230);
INSERT INTO usercard(user_id,card_no) VALUES(18,65436);
INSERT INTO usercard(user_id,card_no) VALUES(19,76300);
INSERT INTO usercard(user_id,card_no) VALUES(20,56709);

/** 
insert into usercard done
**/
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(12345,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(22113,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(12211,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(89076,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(67898,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(23415,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(11345,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(23234,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(12657,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(78980,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(89021,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(54678,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(54612,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(09127,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(91632,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(69812,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(87230,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(65436,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(76300,'debit card','HBL');
INSERT INTO card(card_no,card_type,cardbank_name) VALUES(56709,'debit card','HBL');

/** 
insert into manager done
**/
INSERT INTO manager(employee_id,f_name,l_name,machine_id) VALUES(1,'abu bakar','ashraf',0011);
INSERT INTO manager(employee_id,f_name,l_name,machine_id) VALUES(2,'Malik','Abdul Rehman',0022);
INSERT INTO manager(employee_id,f_name,l_name,machine_id) VALUES(3,'Aaqib Javed','Chaudhary',0033);
INSERT INTO manager(employee_id,f_name,l_name,machine_id) VALUES(4,'Usama','Bhatti',0044);
INSERT INTO manager(employee_id,f_name,l_name,machine_id) VALUES(5,'Waqas','Arshad',0055);
/** 
insert into employee_address done
**/

INSERT INTO employee_address(employee_id,lane_address,city,postalcode,province) VALUES(1, 'house no#99 lane#100 askari, Sialkot','Sialkot',1224,'punjab');
INSERT INTO employee_address(employee_id,lane_address,city,postalcode,province) VALUES(2, 'house no#9 lane#20 Silk city, Sialkot','Sialkot',1224,'punjab');
INSERT INTO employee_address(employee_id,lane_address,city,postalcode,province) VALUES(3, 'house no#90 lane#30 Johar Town, Lahore','Lahore',1234,'punjab');
INSERT INTO employee_address(employee_id,lane_address,city,postalcode,province) VALUES(4, 'house no#01 lane#130 Bahria Town, Labhore','Lahore',1234,'punjab');
INSERT INTO employee_address(employee_id,lane_address,city,postalcode,province) VALUES(5, 'house no#78 lane#230 Dream Garden, Lahore','Lahore',1234,'punjab');

/** 
insert into employee_phonenumber done
**/
INSERT INTO employee_phonenumber(phone_no,employee_id) VALUES('03435566777',1);
INSERT INTO employee_phonenumber(phone_no,employee_id) VALUES('03026214311',2);
INSERT INTO employee_phonenumber(phone_no,employee_id) VALUES('03004199222',3);
INSERT INTO employee_phonenumber(phone_no,employee_id) VALUES('03453444566',4);
INSERT INTO employee_phonenumber(phone_no,employee_id) VALUES('03006344980',5);

/** 
insert into atm_machine done
**/
INSERT INTO atm_machine(machine_id,branch_name,employee_id) VALUES(11,'e block johr town,lahore',1);
INSERT INTO atm_machine(machine_id,branch_name,employee_id) VALUES(22,'B block Bahria town,lahore',2);
INSERT INTO atm_machine(machine_id,branch_name,employee_id) VALUES(33,'f block Dream Garden,lahore',3);
INSERT INTO atm_machine(machine_id,branch_name,employee_id) VALUES(44,'silk city,sialkot',4);
INSERT INTO atm_machine(machine_id,branch_name,employee_id) VALUES(55,'Nawab town,lahore',5);

/** 
insert into transection done
**/
INSERT INTO transection(transection_id,transection_name) VALUES(101,'withdraw');
INSERT INTO transection(transection_id,transection_name) VALUES(102,'transfer');
INSERT INTO transection(transection_id,transection_name) VALUES(103,'billpay');
INSERT INTO transection(transection_id,transection_name) VALUES(104,'inquiry');
INSERT INTO transection(transection_id,transection_name) VALUES(105,'changepin');

