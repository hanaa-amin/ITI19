use CompanyDB;
select * from employee;
select Fname , Lname , salary ,Dno from employee ;
select concat(Fname,Lname) as FullName , salary * .01 + salary as Commission from employee;
select Pname , Plocation  ,Dname from project inner join departments on project.Dnum = departments.Dnum; 
select SSN , concat(Fname,Lname) as EmpName ,salary from employee where salary >1000; 
select SSN , concat(Fname,Lname) as EmpName , salary * 12 as AnnuSalary from employee where salary * 12 > 10000;
select concat(Fname,Lname) as EmpName, salary ,sex from employee where sex ='F' ; 
select Dno , concat(Fname,Lname) as EmpName from employee where superssn = 968574;
select Pnumber , Pname , Plocation from project where Dnum = 10 ; 
select Dnum , Dname , concat(Fname,lname)as mngName,MGRSSN from departments inner join employee on departments.MGRSSN = employee.superssn;
select Dname , Pname  from departments inner join project on departments.Dnum = project .Dnum;
select concat(Fname,Lname) as FullName , dependent_name ,Dependent.Sex,BirthDate from employee inner join Dependent on Dependent.ESSN = employee.SSN ;
select Dependent_name , Dependent.Sex from Dependent inner join employee on Dependent.Sex ='F' and employee.sex ='F' union select Dependent_name , Dependent.Sex from Dependent inner join employee on Dependent.Sex ='M' and employee.sex ='M' ;
select Fname , Lname , SSN ,BDate ,address,employee.sex,salary,Dname from employee inner join departments on employee.superssn = departments.MGRSSN; 
select * from project where Pname like 'a%';
select concat(Fname,Lname) as FullName ,salary , Dno from employee where Dno = 30 and salary between 1000 and 2000;
select concat(Fname,Lname) as FullName , works_for.Hours , project.Pname as FullName from employee inner join works_for on employee.Dno = 10 and works_for.Hours >= 10 inner join project on  Pname = 'Al Rabwah'; 
select SSN from employee where Fname= 'Kamel' and Lname ='mohamed' ; select concat(Fname,Lname) as FullName from employee where superssn = 223344;
select Pname , Hours from project inner join works_for on Pnumber = Pno;
select  distinct concat(Fname,Lname) as FullName from employee inner join project on employee.Dno = project.Dnum; 
select Dname , Dnum , MGRSSN  , SSN from departments inner join employee on Dno = Dnum where(SSN = (select min(SSN) from employee));
select  distinct Dname , (select max(salary) from employee ) as maxV , (select min(salary) from employee) as minV , (select avg(salary) from employee) as Average from departments inner join employee on Dno = Dnum;
select distinct Lname , Dependent_name from employee inner join Dependent on ESSN = SSN and Dependent_name is  null;

select Fname , Pname  from employee inner join departments on Dnum = Dno inner join project on Dnum = Dno  group by Dname ,Lname ,Fname ;
select Pnumber , Dname , Lname , address,BDate  from project inner join  departments on project.Dnum = departments.Dnum inner join employee on project.Dnum = employee.Dno where city like 'cairo' ;
select Pnumber , Pname from project inner join employee on Dnum = Dno where Lname = 'Mohamed' ; -- not completed
select SSN , Fname from employee where exists (select Dependent_name from Dependent where SSN = ESSN ); -- not sure
insert into employee values('Moahmed','Fathi',102672,'1995/1/1','Damietts','M',3000,112233,30);
insert into employee(Fname, Lname ,SSN,BDate,address,sex,Dno) values('Mohamed','Hamdy',102660,'1995/1/1','Damietta' ,'M',30);
insert into departments values('DEPT IT',100,112233,'2006-11-1');
update employee set Dno = 100 where Fname = 'Noha' and Lname = 'Mohamed';
update employee set Dno = 20 where SSN = 102672;
update employee set superssn = 102672 where SSN = 112233;
delete from employee where Fname= 'Kamel'and Lname = 'Mohamed';
update employee set salary = (salary + salary * .20) where SSN = 102672;
 
