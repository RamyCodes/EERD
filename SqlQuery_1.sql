CREATE Table "User"
(
ID int PRIMARY KEY IDENTITY,
first_name VARCHAR(20),
middle_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(30),
"password" VARCHAR(30),
);

CREATE Table Student
(
ID int IDENTITY,
GIU_ID int,
birth_date datetime,
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)),
--semester int, or varchar????
faculty VARCHAR(30),
major VARCHAR(30),
GPA DECIMAL(4,2),
address VARCHAR(40),
--CV ??? new object
--coverletter ? same
);

CREATE Table Student_phoneNumber
(
ID int PRIMARY KEY,
number int,
);

CREATE Table Employer
(
ID int PRIMARY KEY,
company_name VARCHAR(20),
address VARCHAR(30),
phone_number int,
fax int,
website VARCHAR(30),
type_of_business VARCHAR(10),
establishment_year YEAR,
country_of_origin VARCHAR(56),
industry VARCHAR(30),
number_of_current_employees int,
products VARCHAR(30),
);

CREATE Table Contact_person
(
employer_ID int PRIMARY KEY,
"name" VARCHAR(30),
job_title VARCHAR(30),
email VARCHAR(30),
mobile_number int,
fax int,
);

CREATE Table HR_Director
(
employer_ID int PRIMARY KEY,
"name" VARCHAR(30),
email VARCHAR(30),
);

CREATE Table Admin
(
ID int PRIMARY KEY
);

CREATE Table Faculty_Representative
(
ID int PRIMARY KEY,
faculty VARCHAR(30),
);

CREATE Table Academic_Advisor
(
ID int PRIMARY KEY,
faculty VARCHAR(30),
);

CREATE Table Career_Office_Coordinator
(
ID int PRIMARY KEY,
);

CREATE Table Review_Profile
(
employer_id int PRIMARY KEY,
admin_id int,
"status" VARCHAR(30),
reason VARCHAR(30),
);

CREATE Table Job
(
ID int PRIMARY KEY,
description VARCHAR(30),
department VARCHAR(30),
start_date datetime,
end_date datetime,
duration AS (datetime(end_date) - datetime(start_date)),
application_deadline datetime,
num_of_available_internships int,
--salary_range  RANGE
qualifications VARCHAR(60),
location VARCHAR(30),
application_link VARCHAR(30),
application_email VARCHAR(30),
job_type VARCHAR(30),
employer_id int,
admin_id int,
visibility VARCHAR(30),
reason VARCHAR(30),
);

CREATE Table Allowed_faculties
(
ID int,
faculty_name VARCHAR(30),
PRIMARY KEY (ID,faculty_name),
);

CREATE Table Required_semesters
(
ID int,
--semester VARCHAR(30),
PRIMARY KEY (ID,semester),
);

CREATE Table Part_time
(
ID int PRIMARY KEY,
workdays VARCHAR(30),
);

CREATE TABLE Industrial_Internship
(
ID int PRIMARY KEY,
status VARCHAR(30),
aa_id int,
facultyRep_id int,
);

CREATE Table CV_Builder
(
personal_mail VARCHAR(30) PRIMARY KEY,
education VARCHAR(30),
extracurricular_activities VARCHAR(30),
linkedIn_link VARCHAR(30),
githubLink VARCHAR(30),
skills VARCHAR(30),
achievements VARCHAR(30),
student_id int,
first_name VARCHAR(30),
middle_name VARCHAR(30),
last_name VARCHAR(30),
GIU_mail VARCHAR(30),
GPA DECIMAL(4,2),
semester VARCHAR(30),
faculty VARCHAR(30),
major VARCHAR(30),
);

CREATE Table Apply
(
student_ID int,
job_ID int,
application_status VARCHAR(30),
PRIMARY KEY (student_ID,job_ID),
);

CREATE Table Eligible
(
student_id int,
II_id int,
coc_id int,
eligibility VARCHAR(30),
PRIMARY KEY (student_id,II_id),
);