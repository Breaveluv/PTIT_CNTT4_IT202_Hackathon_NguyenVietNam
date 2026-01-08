create database de10;
use de10;
 
 create table Department ( 
	dept_id varchar(5) primary key,
    dept_name varchar(100) unique not null,
    location varchar(100) not null,
    manager_name varchar(50) not null
 );
 
 create table Employee (
   emp_id varchar(5) primary key auto_increment,
   emp_name varchar(50) not null,
   dob date not null,
   email varchar(100) not null unique,
   phone varchar(15) not null unique,
   dept_id varchar (5),
   foreign key (dept_id) references Department(dept_id)
 );
 
 create table Project (
	project_id VARCHAR(5) primary key,
	project_name VARCHAR(20) not null unique ,
	start_date	DATE not null,
	end_date DATE not null,
	budget	DECIMAL(10, 2) not null
 );
 
 create table Assignment (
	assignment_id INT auto_increment primary key ,
    emp_id	VARCHAR(5) not null ,
    project_id	VARCHAR(5) not null,
	role VARCHAR(20) not null,
    hours_worked INT not null,
    constraint fk_asi_empid foreign key (emp_id) references Employee(emp_id),
    constraint fk_asi_proid foreign key (project_id) references Project(project_id)
    
 );
 
 insert into Department values 
 ('D01', 'IT', 'Floor 5','Nguyen Van An'),
 ('D02', 'HR', 'Floor 2','Tran Thi Binh'),
 ('D03', 'Sales', 'Floor 1','Le Van Cuong'),
 ('D04', 'Marketing', 'Floor 3','Pham Thi Duong'),
 ('D04', 'Marketing', 'Floor 3','Pham Thi Duong');
 
 insert into Employee values 
 ('E001','Nguyen Van Tuan','1990-01-01','tuan@mail.com','0901234567','D01'),
 ('E002','Tran Thi Lan','1995-05-05','lan@mail.com','0902345678','D02'),
 ('E003','Le Minh Khoi','1992-10-10','khoi@mail.com','0903456789','D01'),
 ('E004','Pham Hoang Nam',' 1998-12-12','nam@mail.com','0904567890','D03'),
 ('E005','Vu Minh Ha','1996-07-07','ha@mail.com','0905678901','D01');
 
 insert into Project values
 ('P001','Website Redesign','2025-01-01','2025-06-01','50000.00'),
 ('P002','Mobile App Dev','2025-02-01','2025-08-01','80000.00'),
 ('P003','HR System','2025-03-01','2025-09-01','30000.00'),
 ('P004','Marketing Campaign','2025-05-01','2025-06-01','10000.00'),
 ('P005','AI Research','2025-05-01','2025-12-31','100000.00');
 
 
 insert into Assignment values
 ('1','E001','P001','Developer','150'),
 ('2','E003','P001','Tester','100'),
 ('3','E001','P002','Tech Lead','200'),
 ('4','E005','P005','Data Scientist','180'),
 ('5','E004','P004','Content Creator','50');

select * from 


 
 


 
 
 
 


 
 
 
 
 
 
 
 
 