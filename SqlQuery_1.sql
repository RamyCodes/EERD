CREATE Table User_
(
ID int PRIMARY KEY IDENTITY,
first_name VARCHAR(20),
middle_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(50),
password_ VARCHAR(30),
);

CREATE Table Student
(
ID int,
GIU_ID int,
first_name VARCHAR(30),
middle_name VARCHAR(30),
last_name VARCHAR(30),
birth_date datetime,
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)),
semester int,
faculty VARCHAR(30),
major VARCHAR(30),
GPA DECIMAL(4,2),
address_ VARCHAR(40),
CV VARCHAR(255),
coverletter VARCHAR(255),
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES User_(ID),
);

CREATE Table Student_phoneNumber
(
ID int,
number int,
PRIMARY KEY (ID,number),
FOREIGN KEY (ID) REFERENCES User_(ID),
);

CREATE Table Employer
(
ID int,
company_name VARCHAR(20),
address_ VARCHAR(30),
phone_number VARCHAR(20), --assuming this is like company phone
fax VARCHAR(50),
website VARCHAR(50),
type_of_business VARCHAR(30),
establishment_year datetime,
country_of_origin VARCHAR(56),
industry VARCHAR(30),
number_of_current_employees int,
products VARCHAR(30),
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES User_(ID),
);

CREATE Table Contact_person
(
employer_ID int,
name_ VARCHAR(30),
job_title VARCHAR(30),
email VARCHAR(50),
mobile_number VARCHAR(30),
fax VARCHAR(50),
PRIMARY KEY (employer_ID),
FOREIGN KEY (employer_ID) REFERENCES Employer(ID),
);

CREATE Table HR_Director
(
employer_ID int,
namee VARCHAR(30),
email VARCHAR(50),
PRIMARY KEY (employer_ID),
FOREIGN KEY (employer_ID) REFERENCES Employer(ID),
);

CREATE Table Admin_
(
ID int,
PRIMARY KEY(ID),
FOREIGN KEY (ID) REFERENCES User_(ID),
);

CREATE Table Faculty_Representative
(
ID int,
faculty VARCHAR(30),
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES User_(ID),
);

CREATE Table Academic_Advisor
(
ID int,
faculty VARCHAR(30),
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES User_(ID),
);

CREATE Table Career_Office_Coordinator
(
ID int,
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES User_(ID),
);

CREATE Table Review_Profile
(
employer_id int,
admin_id int,
status_ bit,
reason VARCHAR(100),
PRIMARY KEY (employer_id),
FOREIGN KEY (employer_id) REFERENCES Employer(ID),
FOREIGN KEY (admin_id) REFERENCES Admin_(ID),
);

CREATE Table Job
(
ID int,
description_ VARCHAR(100),
department VARCHAR(30),
start_date_ datetime,
end_date datetime,
duration AS ((end_date) - (start_date_)),
application_deadline datetime,
num_of_available_internships int,
salary_range  VARCHAR(30),
qualifications VARCHAR(100),
location_ VARCHAR(30),
application_link VARCHAR(50),
application_email VARCHAR(50),
job_type VARCHAR(30),
employer_id int,
admin_id int,
visibility bit,
reason VARCHAR(100),
PRIMARY KEY (ID),
FOREIGN KEY (employer_id) REFERENCES Employer(ID),
FOREIGN KEY (admin_id) REFERENCES Admin_(ID),
);

CREATE Table Allowed_faculties
(
ID int,
faculty_name VARCHAR(30),
PRIMARY KEY (ID,faculty_name),
FOREIGN KEY (ID) REFERENCES Job(ID),
);

CREATE Table Required_semesters
(
ID int,
semester int,
PRIMARY KEY (ID,semester),
FOREIGN KEY (ID) REFERENCES Job(ID),
);

CREATE Table Part_time
(
ID int,
workdays int,
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Job(ID),
);

CREATE TABLE Freelance
(
ID int,
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Job(ID),
);

CREATE TABLE Summer_internship
(
ID int,
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Job(ID),
);

CREATE TABLE Full_time
(
ID int,
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Job(ID),
);

CREATE TABLE Project_based
(
ID int,
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Job(ID),
);

CREATE TABLE Industrial_Internship
(
ID int,
status_ bit,
aa_id int,
facultyRep_id int,
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Job(ID),
FOREIGN KEY (aa_id) REFERENCES Academic_Advisor(ID),
FOREIGN KEY (facultyRep_id) REFERENCES Faculty_Representative(ID),
);

CREATE Table CV_Builder
(
personal_mail VARCHAR(30),
education VARCHAR(100),
extracurricular_activities VARCHAR(300),
linkedIn_link VARCHAR(60),
githubLink VARCHAR(60),
skills VARCHAR(300),
achievements VARCHAR(300),
student_id int,
first_name VARCHAR(30),
middle_name VARCHAR(30),
last_name VARCHAR(30),
GIU_mail VARCHAR(30),
GPA DECIMAL(4,2),
semester int,
faculty VARCHAR(30),
major VARCHAR(30),
PRIMARY KEY (personal_mail),
FOREIGN KEY (student_id) REFERENCES Student(ID) ON UPDATE CASCADE,
);

CREATE Table Apply_
(
student_ID int,
job_ID int,
application_status VARCHAR(20) DEFAULT 'Pending',
PRIMARY KEY (student_ID,job_ID),
FOREIGN KEY (student_ID) REFERENCES Student(ID),
FOREIGN KEY (job_ID) REFERENCES Job(ID),
);

CREATE Table Eligible
(
student_id int,
II_id int,
coc_id int,
eligibility bit,
PRIMARY KEY (student_id,II_id),
FOREIGN KEY (student_id) REFERENCES Student(ID),
FOREIGN KEY (II_id) REFERENCES Industrial_Internship(ID),
FOREIGN KEY (coc_id) REFERENCES Career_Office_Coordinator(ID),
);

CREATE Table Progress_report
(
student_id int,
date_ datetime,
numeric_state int,
evaluation VARCHAR(100),
description_ VARCHAR(100),
advisor_id int,
PRIMARY KEY(student_id,date_),
FOREIGN KEY (student_id) REFERENCES Student(ID),
FOREIGN KEY (advisor_id) REFERENCES Admin_(ID),
);
