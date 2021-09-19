create database SP19_BSE_087;
use SP19_BSE_087;
create table author(author_id int primary key,author_name varchar(20));
create table publisher(publisher_id  int primary key,publisher_name varchar(20));
create table book1(book_id int primary key,ISBN varchar(20),publisher_id int,Title varchar(200),author_id int,
price int,Foreign key(publisher_id) references publisher(publisher_id),
Foreign key(author_id) references author(author_id));

Insert into author values(40,'James');
Insert into author values(50,'Scott');
Insert into author values(60,'David');
Insert into publisher values(131,'Lap Lambert');
Insert into publisher values(132,'Thomson Reuters');
Insert into publisher values(133,'Wiley');
Insert into book1 values(1,'999-17-129',131,'database',40,5000);
Insert into book1 values(2,'989-11-143',132,'Ride sharing system',50,2000);
Insert into book1 values(3,'965-12-133',132,'Performance Evaluation System',50,1000);
Insert into book1 values(4,'987-15-276',133,'OOP concepts',60,7000);


select publisher_name, substr(lower(title), 1, round(length(Title)/2))from book1 join publisher p on book1.publisher_id=p.publisher_id;

select b.publisher_id Name, count(p.publisher_id) NO_OF_BOOKS from book1 b 
join publisher p on b.publisher_id = p.publisher_id group by 1 having count(p.publisher_id)>1;

select book1.book_id Id, book1.Title Book_Title, book1.ISBN  from book1 inner join publisher on publisher.publisher_id=book1.publisher_id
 where publisher.publisher_id > 131;
 
select book1.book_id Book_id, book1.ISBN ISBN FROM book1 inner join author 
on author.author_id=book1.author_id WHERE author.author_name = "JAMES" and author.author_name = "Lap Lambert";

select book_id Book_ID, price Book_Price from book1 where price  = (select min(price) from book1)and author_id = 
	(select author_id from author where author_name like 'S%' );
    
select substr(Title, -3,3) as Book_Title, publisher_id Publisher_Id from book1 where price < 5000;