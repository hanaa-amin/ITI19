-- Query Solution for lab-02.doc
-- 1. Display all the employees Data.
select * from employees;
-- 2. Display the employee First name, last name, Salary and Department number.
select Fname, Lname, Salary, Dno from employees;
-- 3. Display all the projects names, locations and the department which is responsible about it.
select pro.Pname, pro.Plocation, dep.Dname
from projects pro,
departments dep
where pro.Dnum = dep.Dnum;
/* 4. If you know that the company policy is to pay an annual commission 
for each employee which specific percent equals 10% of his/her annual salary.
Display each employee full name and his annual commission in an ANNUAL COMM column (alias).*/
select concat (Fname, ' ' , Lname) as FullName, Salary*10/100 as ANNUALCOMM from employees;

-- 5.Display the employees Id, name who earns more than 1000 LE monthly.
select SSN, concat (Fname, ' ' , Lname) as Name from employees
where Salary >1000;
-- 6. Display the employees Id, name who earns more than 1000 LE monthly.
select SSN, concat (Fname, ' ' , Lname) as Name from employees
where Salary * 12 >10000;
-- 7. Display the names and salaries of the female employees
select concat (Fname, ' ' , Lname) as Name, Salary  from employees
where sex="F";
-- 8. Display each department id, name which managed by a manager with id equals 968574.
select Dnum, Dname from departments where MGRSSN=968574;
-- 9. Dispaly the ids, names and locations of  the pojects which controled with department 10.
select Pnumber, Pname,Plocation from projects where Dnum=10;
-- 10. Display the Department id, name and id and the name of its manager.
Select dep.Dnum, dep.Dname, dep.MGRSSN, emp.Fname, emp.Lname
from departments dep, employees emp
where dep.MGRSSN = emp.SSN;
-- 11.Display the name of the departments and the name of the projects under its control.
select dep.Dname, pro.Pname 
from departments dep, projects pro
where dep.Dnum = pro.Dnum;
-- 12.Display the full data about all the dependence associated with the name of the employee they depend on him/her
select dep1.* , concat(Fname,' ', emp.LName) FullName
from dependences dep1, employees emp
where dep1.ESSN = emp.SSN;
/* 13.Display (Using Union Function)
        a. The name and the gender of the dependence that's gender 
        is Female and depending on Female Employee.
        b. And the male dependence that depends on Male Employee. 
	select dependent_name, Sex
    from dependences dep
    where Sex="F"
    union
    select 
    where dep.ESSN=emp.SSN 
    and dep.Sex="F"
    and emp.Sex="F";
*/ 
-- 14.Display the full data of the employees who is managing any of the company's departments.
      select emp.* from employees emp, departments dep
      where emp.SSN=dep.MGRSSN;
-- 15. Display the Id, name and location of the projects in Cairo or Alex city.
select Pnumber, Pname , Plocation 
from projects
where city in ('cairo', 'Alex');
-- 16.Display the Projects full data of the projects with a name starts with "a" letter.
select * from projects where Pname like 'a%';
-- 17. display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
select concat (Fname,' ', Lname)  Emp_name
from employees
 where Dno=30 and salary between 1000 and 2000;
 /* 18.Retrieve the names of all employees in department 10 who works more than or 
 equal 10 hours per week on "AL Rabwah" project. */
 
 select emp.Fname, emp.Lname 
 from employees emp ,worksfor w, projects pro
 where emp.SSN = w.ESSN
 and pro.Pnumber = w.Pno
 and emp.dno=10
 and w.Hours >=10
 and pro.Pname="AL Rabwah";
 -- 19. Find the names of the employees who directly supervised with Kamel Mohamed.
 select Fname 
 from employees
 where Superssn=( select Superssn from employees where Fname='Kamel' and Lname='Mohamed');
 /* 20.For each project, 
 list the project name and the total hours per week 
 (for all employees) spent on that project.
 select sum (Hours) 
 from projects pro , worksfor wor
 where pro.Pnumber = wor.Pno;
 select sum(Hours),pName 
 from worksfor, projects
 where worksfor.Pno=projects.Pnumber;*/
 -- 21. Retrieve the names of all employees who work in every project sorted.
 select distinct emp.Fname, emp.Lname
 from employees emp, worksfor wor
 where emp.SSN=wor.ESSN;
 -- 22. Display the data of the department which has the smallest employee ID over all employees' ID.
select dep.* 
from departments dep, employees emp
where  dep.Dnum = emp.Dno
and emp.SSN = (select min(SSN) from employees); 
/* 23. For each department, retrieve the department name and the maximum, 
minimum and average salary of its employees.*/
select max(Salary) as MaxSalary, min(Salary) as Minimumsalary, avg(Salary) as AveragSalary, Dno
from employees 
group by Dno;
-- 24.List the last name of all managers who have no dependents.

 
