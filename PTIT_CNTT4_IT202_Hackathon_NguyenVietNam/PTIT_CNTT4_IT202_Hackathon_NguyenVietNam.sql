create database de10;
use de10;
 
 create table Department ( 
	dept_id varchar(5) primary key,
    dept_name varchar(100) unique not null,
    location varchar(100) not null,
    manager_name varchar(50) not null
 );
 
 create table Employee (
   emp_id varchar(5) primary key ,
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
 ('D05', 'Finance', 'Floor 4','Hoang Van Tu');
 
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
 ('P004','Marketing Campaign','2025-04-01','2025-05-01','10000.00'),
 ('P005','AI Research','2025-05-01','2025-12-31','100000.00');
 
 
 insert into Assignment values
 ('1','E001','P001','Developer','150'),
 ('2','E003','P001','Tester','100'),
 ('3','E001','P002','Tech Lead','200'),
 ('4','E005','P005','Data Scientist','180'),
 ('5','E004','P004','Content Creator','50');

select * from assignment;

select * from department;

select * from employee;

select * from project;
-- Cập nhật thông tin phòng ban. Hãy viết câu lệnh thay đổi địa điểm của phòng ban có dept_id = 'C001' thành "Floor 10"
UPDATE Department SET location = 'Floor 10' WHERE dept_id = 'D01';

DELETE FROM assignment WHERE hours_worked = 0 OR role = 'Intern';

-- Liệt kê danh sách nhân viên gồm các cột: emp_id, emp_name, email thuộc phòng ban có mã  'D01'. 
select emp_id, emp_name, email from employee where dept_id='D01';

-- 7. Lấy thông tin project_name, start_date, budget của những dự án có tên chứa từ khóa là 'System'.(5 điểm) 
select project_name, start_date, budget from project where project_name ='System';


-- Hiển thị danh sách tất cả các dự án gồm: project_id, project_name, budget. Kết quả sắp xếp theo budget giảm dần
select project_id, project_name, budget from project order by budget desc;

-- Lấy thông tin 3 nhân viên lớn tuổi nhất theo dob trong bảng Employee
select * from Employee order by dob desc limit 3;

-- Hiển thị thông tin các sản phẩm (project_id, project_name) từ bảng Project, bỏ qua 1 bản ghi đầu tiên và lấy 3 bản ghi tiếp theo .
select project_id, project_name from Project limit 3 offset 1;


 -- Hiển thị danh sách đơn hàng gồm: assignment_id, emp_name , project_name  và role. Chỉ lấy những đơn hàng có hours_worked lớn hơn 100.
SELECT  a.assignment_id, e.emp_name  , p.project_name , a.role
FROM assignment a
INNER JOIN project p  ON a.project_id=p.project_id
INNER JOIN employee e ON e.emp_id = a.assignment_id
where hours_worked >100;

-- Liệt kê tất cả các phòng ban trong hệ thống gồm: dept_id, dept_name và emp_name tương ứng (nếu có). Kết quả phải bao gồm cả những phòng ban chưa có nhan viên nào.
select d.dept_id, d. dept_name ,e.emp_name
from department d
join employee e
on  d.dept_id=e.dept_id

select project_name, sum()as Total_Hours from project group by project_id
select order_id, sum(quantity) as total_quantity from order_items group by order_id;






 


 
 
 
 


 
 
 
 
 
 
 
 
 