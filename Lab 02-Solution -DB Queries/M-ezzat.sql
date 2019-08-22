Queries:

-- 1-Display all the employees Data.
	  select * from employee;
      
-- 2-Display the employee First name, last name, Salary and Department number.
      select Fname,Lname,salary,Dno
      from employee;
      
-- 3-Display all the projects names, locations and the department which is responsible about it.
      select projects.Pname, projects.Plocation, departments.Dname
      from projects
      inner join departments
      where projects.Dnum = departments.Dnum;
      
-- 4-If you know that the company policy is to pay an annual commission for each employee which specific percent equals 10% of his/her annual salary .Display each employee full name and his annual commission in an ANNUAL COMM column (alias).
	  select concat(Fname,' ',Lname) as fullname, (salary*.10) as ANNUAL_COMM
      from employee;
-- 5-Display the employees Id, name who earns more than 1000 LE monthly.
     select SSN,concat(Fname,' ',Lname) as name
     from employee
     where salary> 1000;
     
-- 6-Display the employees Id, name who earns more than 10000 LE annually.
	 select SSN,concat(Fname,' ',Lname) as name
     from employee
     where salary*12> 10000;
     
-- 7-Display the names and salaries of the female employees.
     select concat(Fname,' ',Lname) as name,salary
     from employee
     where sex = 'F';
     
-- 8-Display each department id, name which managed by a manager with id equals 968574.
     select Dnum,Dname
     from departments
     where MGRSSN = 968574;
     
-- 9-Dispaly the ids, names and locations of  the pojects which controled with department 10.
	select Pnumber,Pname,Plocation
    from projects
    where Dnum=10;
    
-- 10-Display the Department id, name and id and the name of its manager.
	select departments.Dnum, departments.Dname, employee.SSN,concat(employee.Fname,' ',employee.Lname) as name
    from departments
    inner join employee
    where departments.MGRSSN = employee.SSN;
    
-- 11-Display the name of the departments and the name of the projects under its control.
	select departments.Dname, projects.Pname
    from departments
    inner join projects
    where departments.Dnum = projects.Dnum;
    
-- 12-Display the full data about all the dependence associated with the name of the employee they depend on him/her.
      select  concat(employee.Fname,' ',employee.Lname) as name, dependent.*
      from employee
	  join dependent
      where employee.SSN = dependent.ESSN;
      
-- 13-Display (Using Union Function)
       --  a.  The name and the gender of the dependence that's gender is Female and depending on Female Employee.
              select dependent.dependent_name, dependent.sex
              from dependent
              join employee
              where dependent.sex ='f' and employee.sex='f'
              union
              select dependent.dependent_name, dependent.sex
              from dependent
              join employee
              where dependent.ESSN = employee.SSN and dependent.sex ='f';

       --  b.  And the male dependence that depends on Male Employee.
              select dependent.dependent_name, dependent.sex
              from dependent
              join employee
              where dependent.sex ='M' and employee.sex='M'
              
                            union
              select dependent.dependent_name, dependent.sex
              from dependent
              join employee
              where dependent.ESSN = employee.SSN and dependent.sex ='M';
              
-- 14-Display the full data of the employees who is managing any of the company's departments.
			select employee.*
            from employee
            inner join departments
            where employee.SSN = departments.MGRSSN;
            
      --  15-Display the Id, name and location of the projects in Cairo or Alex city.
     --   16-Display the Projects full data of the projects with a name starts with "a" letter.
      --  17-display all the employees in department 30 whose salary from 1000 to 2000 LE monthly
      --  18-Retrieve the names of all employees in department 10 who works more than or equal10 hours per week on "AL Rabwah" project.
      --  19-Find the names of the employees who directly supervised with Kamel Mohamed.
      --  20-For each project, list the project name and the total hours per week (for all employees) spent on that project.
     --   21-Retrieve the names of all employees who work in every project sorted.
      --  22-Display the data of the department which has the smallest employee ID over all employees' ID.
      
      select departments.* 
      from departments
      inner join employee
      where employee.Dno = departments.Dnum and employee.SSN = (select min(employee.SSN));
      
      select departments.* 
      from employee, departments
      where employee.Dno = departments.Dnum and employee.SSN = (select min(employee.SSN));
     
     --  23-For each department, retrieve the department name and the maximum, minimum and average salary of its employees.
     --  24-List the last name of all managers who have no dependents.
     --   25-For each department-- if its average salary is less than the average salary of all departments-- display its number, name and number of its employees.
     --  26-Retrieve a list of employees and the projects they are working on ordered by department and within each department, ordered alphabetically by last name, first name.
     --  27-For each project located in Cairo City , find the project number, the controlling department name ,the department manager last name ,address and birthdate.
     --   28-Make a list of all projects’ numbers for projects that involve an employee whose last name is Mohamed, either as a worker or as a manager of the department that controls the project.(solve it with nested Q or union function )
     --   29-Display the employee number and name who has no dependent on him/her (use exists).

-- Data Manipulating Language:

       -- 1-Insert your personal data to the employee table as a new employee in department number 30, SSN = 102672, Superssn = 112233.
	   -- select * from employee;
        insert into employee values ('mohamed','ezzat',102672,'1989-10-14','mansoura-met badr khames','M',2500,112233,30);
        
       -- 2-Insert another employee with personal data your friend as new employee in department number 30, SSN = 102660, but don’t enter any value for salary or manager number to him.
		insert into employee values ('mostafa','salah',102660,'1968-1-1','mansoura','M',null,null,30);
       
       -- 3-In the department table insert new department called "DEPT IT" , with id 100, employee with SSN = 112233 as a manager for this department. The start date for this manager is '1-11-2006'
       -- select * from departments;
       insert into departments values ('DEPT IT',100,112233,2006-11-1);
        
       -- 4-Do what is required if you know that : Mrs.Noha Mohamed moved to be the manager of the new department (id = 100), and they give you her position 
			-- a. First try to update her record in your database.
            update departments
            set MGRSSN =  (select SSN from employee where fname = 'Noha')
            where Dnum = 100;
			-- b. Update your record to be department 20 manager.
            update departments
            set MGRSSN =  (select SSN from employee where Lname = 'ezzat')
            where Dnum = 20;
			-- c. Update your friend data to be in your teamwork (supervised by you)
			update employee
            set Superssn = 102672
            where Lname ='salah';
       -- 5-Unfortunately the company ended the contract with Mr.Kamel Mohamed so try to delete his data from your database, in case you know that you will be temporary in his position.
		update employee
            set Superssn = 102672
            where Superssn = (select SSN from employee where Fname = 'Kamel');
       -- 6-And your salary has been upgraded by 20 present of its las