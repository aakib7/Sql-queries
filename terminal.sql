use sp19_bse_087;

create table author(author_id int primary key,author_name varchar(20));
create table publisher(publisher_id int primary key,publisher_name varchar(20));
create table book1(book_id int primary key,ISBN varchar(150),publisher_id int,Title varchar(20),author_id int,
price int,Foreign key(publisher_id) references publisher(publisher_id),
Foreign key(author_id) references author(author_id),
Foreign key(publisher_id) references publisher(publisher_id));

Insert into author values(40,'James');
Insert into author values(50,'Scott');
Insert into author values(60,'David');
insert into author values(70,'Stuart');
Insert into publisher values(131,'Lap Lambert');
Insert into publisher values(132,'Thomson Reuters');
Insert into publisher values(133,'Wiley');
Insert into book1 values(1,'999-17-129',131,'database',40,5000);
Insert into book1 values(2,'989-11-143',132,'Ride sharing system',50,2000);
Insert into book1 values(3,'965-12-133',133,'Performance Evaluation System',50,1000);
Insert into book1 values(4,'987-15-276',133,'OOP concepts',60,7000);
Insert into book1 values(5,'999-17-281',133,'Mathematics',60,7000);



use sp19_bse_087;
select book_id as id,title as BookTitle,price as BookPrice from book1 where price >= (select min(price) from book1) and  price <=3000;
select * from book1 where price >= (select (price + (price * 0.40)) from book1 where Title = "database");
select b1.book_id,b1.title from book1 as b,book1 as b1 where b.price=b1.price and b1.title != b2.title;
select b1.book_id,b1.title from book1 b1 join book1 b2 on b1.price = b2.price and b1.title != b2.title ORDER BY b1.book_id DESC;
select publisher_id,publisher_name from publisher where publisher_id=(select publisher_id from book1 group by publisher_id having count(*)>=3);
select b.book_id, a.author_name from author as a left join book1 as b on(a.author_id=b.author_Id);

create view bookshop as select book_id from book1 where price > 2000 and Title like "%D%";
select * from bookshop;

select p.publisher_name, left(b.Title, (LENGTH(b.Title) / 2)) as Title from book1 as b join publisher as p on b.publisher_id=p.publisher_id;

SELECT CONCAT(b.Title, "_", p.publisher_name) as Books_Author FROM book1 AS b JOIN publisher as p
on b.publisher_id=p.publisher_id
where length(CONCAT(b.Title, "_", p.publisher_name)) > 30;
SELECT SUBSTR(title,-3) from book1;


