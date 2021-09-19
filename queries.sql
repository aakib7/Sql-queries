use db;
create table department(dept_no int primary key, dept_name varchar(15));
create table employee(emp_id int primary key, emp_name varchar(15), job varchar(15),salary int,
dept_no int, foreign key (dept_no) references department (dept_no));
alter table department modify dept_name varchar(15) not null;
alter table employee modify job varchar(15) not null;
alter table employee modify salary int check(salary>=10000 and salary<=90000);
INSERT into department(dept_no,dept_name) VALUES (40,'SE');
INSERT INTO employee (emp_id, emp_name, job,salary,dept_no) values (101,'ABC','Manager',80000,10);
INSERT INTO employee (emp_id, emp_name, job,salary,dept_no) values (102,'CDF', 'Analyst',25000,20);
INSERT INTO employee (emp_id, emp_name, job,salary,dept_no) values (103,'LKI','Analyst', 28000,10);
INSERT INTO employee (emp_id, emp_name, job,salary,dept_no) values (104,'FKO','Analyst', 15000,30);
select dept_name,dept_no from department where dept_name='CS';
select salary from employee where salary between 20000 and 90000;
select emp_name, emp_id from employee where emp_name LIKE 'a%' and salary >30000;
select job from employee where emp_name LIKE '%c%'; 
update department set dept_name='Pharmacy' where dept_name ='Finance';
select * from employee order by salary desc;
select emp_name, emp_id from employee where dept_no = 20 and emp_name LIKE '%a%' or emp_name LIKE '%c%';
select dept_no, dept_name from department where dept_no in (10,20,30,40) order by dept_no desc; 
select salary from employee where dept_no not in(10);

create view Employees as select emp_name, emp_id from employee; 
select * from Employees;
select now();
select LOWER(emp_name) E_name , length(emp_name) Name_of_employees from employee where emp_name LIKE 'l%' OR 
emp_name LIKE'A%' or emp_name LIKE 'c%' order by emp_name;
select substr(emp_name,-2,1) e_job from employee;
select replace(salary, 80000, 20000 ) salary from employee;
select concat(emp_name,' ', job) E_JOB from employee where length(concat(emp_name,job))>6;
select substr(emp_name, 2,1) employee from employee;
INSERT into employee(emp_id, emp_name, job, salary, dept_no) values (105, 'Ali', 'IT', 1000, 40);
select dept_no,sum(salary) salaries from employee group by dept_no having sum(salary)>11000 order by dept_no desc;
select dept_no, min(salary) salary from employee group by dept_no having min(salary)>11000;
select dept_no, round(avg(salary),0) Average from employee group by dept_no;
select dept_no, max(salary) Maximum from employee group by dept_no having max(salary)>11000 order by dept_no desc;
select emp_id, emp_name, round(salary+(salary*0.15),0) New_salary from employee ;
select emp_id, avg(salary) average from employee where dept_no between 10 and 80
 group by dept_no having avg(salary)>9000;
 
 select count() from employee having count()>3;
 select min(salary) salary from employee group by dept_no having min(salary)>5000;
 select e.emp_name, e.dept_no, d.dept_name from employee e, department d where e.dept_no= d.dept_no;
 select e.job, e.dept_no, d.dept_name from employee e, department d where e.dept_no= d.dept_no and salary >10000;
 
select emp_name,job,salary,d.dept_name from employee e JOIN department d on e.dept_no=d.dept_no and job!='IT';
select d.dept_name, count(emp_name), avg(salary) from department d left join employee e on d.dept_no=e.dept_no group by 
dept_name;
select dept_name,e.dept_no,e.emp_id,e.emp_name from department d right join employee e on d.dept_no=e.dept_no;
select emp_name, d.dept_name from employee e left join department d on e.dept_no=d.dept_no union all
select emp_name, d.dept_name from employee e right join department d on e.dept_no=d.dept_no;
select emp_name, d.dept_name from employee e right join department d on e.dept_no=d.dept_no;
select e.salary from employee e, employee e1 where e1.emp_name='CLARK' and e.salary>e1.salary;

select dept_no, salary from employee where salary in (select salary from employee where job ='Manager');
select dept_no, emp_name from employee where salary < any (select salary from employee where job = 'Manager');
select emp_name from employee where salary > all (select salary from employee where job = 'Manager');
select emp_name from employee where dept_no in (select dept_no from employee where emp_name = 'Johns');
select emp_name from employee where exists (select emp_name from employee where job = 'Manager');

use db;
select job from employee where deptNo in (select deptNo from Dept where dName='EE' or dName='CS') order by job;
select empId,empName from employee  where deptNo in (select deptNo from employee where empName like'%A%');
select max(salary) from employee WHERE salary < (select max(salary) from employee); 
select empId,salary from employee where salary < any(select salary from employee where job='Manager') 
and deptNo=(select DeptNo from Dept where dName='sales');

INSERT INTO employee (empId, empName,job,salary,deptNo) values (111,'Tayab','Manager',80000,10);
INSERT INTO employee (empId, empName,job,salary,deptNo) values (112,'Rahat', 'Analyst',2500,20);
INSERT INTO employee (empId, empName,job,salary,deptNo) values (113,'Nusrat','Analyst', 28000,10);

use db;
select empId,empName from employee where deptNo in (select deptNo from employee where empName like'%t%');
select * from employee where deptNo = (select deptNo from Dept where dName='SALES');
select * from employee where salary  in (select salary from employee where job='Analyst');
SELECT deptNo,avg(salary)  FROM employee GROUP BY deptNo HAVING avg(salary) < (SELECT avg(salary)FROM employee);
UPDATE employee SET salary = salary+(salary/2) WHERE deptNo>=20; 

