/*Display all the employees Data*/
select * from employee;
/*Display the employee First name, last name, Salary and Department number.*/
select Fname,Lname,salary ,Dnum from employee,Departments;
/*Display all the projects names, locations and the department which is responsible about it.*/
select Project.Pname,Project.Plocation,Departments.Dname from Project inner join Departments on Project.Dnum = Departments.Dnum;
/*Display the employees Id, name who earns more than 1000 LE monthly.*/
select SSN,concat(Fname,Lname) as Emp_name , salary from employee where Salary>1000;
/*Display the employees Id, name who earns more than 10000 LE annually.*/
select SSN,concat(Fname,Lname) as Emp_name , salary*12 as salary_annually from employee where salary*12>10000;
/*Display the names and salaries of the female employees */
select concat(Fname,Lname)as Emp_name , salary , sex  from employee where sex= 'F';
/*Display each department id, name which managed by a manager with id equals 968574.*/
select Dno,concat(Fname,Lname) as Emp_name from employee where Superssn=968574;
/*Dispaly the ids, names and locations of  the pojects which controled with department 10.*/
select Pnumber,Pname,Plocation from Project where Dnum=10;
/*Display the Department id, name and id and the name of its manager.*/
select Dnum,Dname,MGRSSN ,concat(Fname,Lname)as manager from Departments inner join employee on Departments.MGRSSN = employee.Superssn;
/*Display the name of the departments and the name of the projects under its control.*/
select Dname , Pname from Departments inner join Project on Departments.Dnum=Project.Dnum;
/*Display the full data about all the dependence associated with the name of the employee they depend on him/her.*/
select * from Dependent inner join employee on Dependent.ESSN=employee.SSN;
/* Display (Using Union Function)
	a.  The name and the gender of the dependence that's gender is Female and depending on Female Employee.
	b.  And the male dependence that depends on Male Employee.*/
select Dependent_name, Sex from Dependent inner join employee on Dependent.ESSN=employee.SSN where employee.sex='F'
union
select Dependent_name, Sex from Dependent inner join employee on Dependent.ESS=employee.SSN where employee.sex='M' ;
/*Display the full data of the employees who is managing any of the company's departments.*/
select employee.*,Departments.Dname from employee
inner join Departments on employee.Superssn=Departments.MGRSSN;
/*Display the Id, name and location of the projects in Cairo or Alex city.*/
select Pnumber,Pname,Plocation from Project where City='Cairo' or City='Alex';
/*Display the Projects full data of the projects with a name starts with "a" letter.*/
select * from Project where Pname like 'a%';
/*display all the employees in department 30 whose salary from 1000 to 2000 LE monthly*/
select concat(Fname,'',Lname) as Emp_name from employee where Dno=30 and Salary between 1000 and 2000;
/*Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.*/
select concat(Fname,'',Lname) as Emp_name,Hours from employee inner join Works_for on employee.Superssn=Works_for.ESSN 
inner join Project on Project.Dnum=employee.Dno 
 where Hours>10 or Hours=10 ; 
/*Find the names of the employees who directly supervised with Kamel Mohamed.*/
select concat(Fname,Lname) as Emp_name from employee where Superssn=321654;
select concat(Fname,Lname) as Emp_name
 from employee
where Superssn=( select Superssn from employee where Fname='Kamel' and Lname='Mohamed');
/*For each project, list the project name and the total hours per week (for all employees) spent on that project.*/
select Pname,Hours from Project inner join Works_for on Project.Pnumber=Works_for.Pno;
/*Retrieve the names of all employees who work in every project sorted.*/
select concat(Fname,Lname) as Emp_name from employee inner join Works_for on employee.Superssn=Works_for.ESSN;
/*Display the data of the department which has the smallest employee ID over all employees' ID.*/
select * from Departments inner join employee on Departments.Dnum=employee.Dno where employee.SSN = (select min(SSN) from employee); 
/*For each department, retrieve the department name and the maximum, minimum and average salary of its employees.*/
select max(Salary) as MaxSalary, min(Salary) as Minimumsalary, avg(Salary) as AveragSalary, Dno
from employee 
group by Dno;
/*List the last name of all managers who have no dependents.*/
select Lname from employee  where SSN not in (select ESSN from Dependent);
/*For each department-- if its average salary is less than the average salary of all departments-- display its number, name and number of its employees.*/
select Dno, avg(Salary) as average from employee
group by Dno
having  average < some (select avg(Salary) as average from employee group by Dno);
/*Retrieve a list of employees and the projects they are working on ordered by department and within each department, ordered alphabetically by last name, first name.*/
select concat(Fname, Lname)as Emp_name ,Pname from employee
inner join Departments on employee.Dno=Departments.Dnum 
inner join Project on Project.Dnum=Departments.Dnum order by Fname,Lname ASC;
/*For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.*/
select Pnumber,Dname,Address,BDATE from  employee
inner join Departments on employee.Dno=Departments.Dnum 
inner join Project on Project.Dnum=Departments.Dnum where City='Cairo';
/*Make a list of all projects’ numbers for projects that involve an employee whose last name is Mohamed, either as a worker or as a manager of the department that controls the project.(solve it with nested Q or union function )*/
select Pnumber,concat(Fname,Lname)as Emp_name from employee
inner join Departments on employee.Dno=Departments.Dnum
inner join Project on Project.Dnum=Departments.Dnum where Lname='Mohamed';
/* Display the employee number and name who has no dependent on him/her (use exists).*/
select SSN,concat(Fname,Lname)as Emp_name from employee where exists  (select Dependent_name from Dependent);
 /*Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233.*/
 alter table employee rename to new_employee;
insert into new_employee (Dno,SSN,Superssn)values(30,102672,112233);
/*Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or manager number to him.*/
insert into new_employee (Dno,SSN)values(30,102660);
/*In the department table insert new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'*/
insert into Departments values('DEPTIT',100,112233,1/11/2006);
/*Do what is required if you know that : Mrs.Noha Mohamed moved to be the manager of the new department (id = 100), and they give you her position 
        a. First try to update her record in your database.
        b. Update your record to be department 20 manager.
        c. Update your friend data to be in your teamwork (supervised by you)*/
update new_employee set Dno = 100 where Fname = 'Noha' and Lname = 'Mohamed';
update new_employee set Dno=20 where SSN=102672;
update Departments set MGRSSN=102672 where Dnum=20;
update new_employee set Superssn = 102672 where SSN = 102672;
/*Unfortunately the company ended the contract with Mr.Kamel Mohamed so try to delete his data from your database, in case you know that you will be temporary in his position.*/
delete from new_employee where Fname='Kamel' and Lname='Mohamed';
/*And your salary has been upgraded by 20 present of its las*/
update new_employee set Salary = (Salary + Salary * 20) where SSN = 102672;

















