CREATE Table Users
(
ID int PRIMARY KEY IDENTITY,
first_name VARCHAR(20),
middle_name VARCHAR(20),
last_name VARCHAR(20),
email VARCHAR(30),
passwordd VARCHAR(30),
);

CREATE Table Student
(
ID int,
GIU_ID int,
birth_date datetime,
age AS (YEAR(CURRENT_TIMESTAMP) - YEAR(birth_date)),
semester VARCHAR(30),
faculty VARCHAR(30),
major VARCHAR(30),
GPA DECIMAL(4,2),
address VARCHAR(40),
--CV ??? new object
--coverletter ? same
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Users(ID),
);

CREATE Table Student_phoneNumber
(
ID int,
number int,
PRIMARY KEY (ID,number),
FOREIGN KEY (ID) REFERENCES Users(ID),
);

CREATE Table Employer
(
ID int,
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
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Users(ID),
);

CREATE Table Contact_person
(
employer_ID int,
namee VARCHAR(30),
job_title VARCHAR(30),
email VARCHAR(30),
mobile_number int,
fax int,
PRIMARY KEY (employer_ID),
FOREIGN KEY (employer_ID) REFERENCES Employer(ID),
);

CREATE Table HR_Director
(
employer_ID int,
namee VARCHAR(30),
email VARCHAR(30),
PRIMARY KEY (employer_ID),
FOREIGN KEY (employer_ID) REFERENCES Employer(ID),
);

CREATE Table Admin
(
ID int,
FOREIGN KEY (ID) REFERENCES Users(ID),
);

CREATE Table Faculty_Representative
(
ID int,
faculty VARCHAR(30),
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Users(ID),
);

CREATE Table Academic_Advisor
(
ID int,
faculty VARCHAR(30),
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Users(ID),
);

CREATE Table Career_Office_Coordinator
(
ID int,
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Users(ID),
);

CREATE Table Review_Profile
(
employer_id int,
admin_id int,
statuss VARCHAR(30),
reason VARCHAR(30),
PRIMARY KEY (employer_id),
FOREIGN KEY (employer_id) REFERENCES Employer(employer_id),
FOREIGN KEY (admin_id) REFERENCES Admin(ID),
);

CREATE Table Job
(
ID int,
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
PRIMARY KEY (employer_id),
FOREIGN KEY (employer_id) REFERENCES Employer(employer_id),
FOREIGN KEY (admin_id) REFERENCES Admin(ID),
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
--semester VARCHAR(30),
PRIMARY KEY (ID,semester),
FOREIGN KEY (ID) REFERENCES Job(ID),
);

CREATE Table Part_time
(
ID int,
workdays VARCHAR(30),
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
PRIMARY KEY (ID),
FOREIGN KEY (ID) REFERENCES Job(ID),
);

CREATE TABLE Industrial_Internship
(
ID int,
status VARCHAR(30),
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
PRIMARY KEY (personal_mail),
FOREIGN KEY (student_id) REFERENCES Student(ID),
);

CREATE Table Apply
(
student_ID int,
job_ID int,
application_status VARCHAR(30),
PRIMARY KEY (student_ID,job_ID),
FOREIGN KEY (student_ID) REFERENCES Student(ID),
FOREIGN KEY (job_ID) REFERENCES Job(ID),
);

CREATE Table Eligible
(
student_id int,
II_id int,
coc_id int,
eligibility VARCHAR(30),
PRIMARY KEY (student_id,II_id),
FOREIGN KEY (student_id) REFERENCES Student(ID),
FOREIGN KEY (II_id) REFERENCES Industrial_Internship(ID),
FOREIGN KEY (coc_id) REFERENCES Career_Office_Coordinator(ID),
);

CREATE Table Progress_report
(
student_id int,
date datetime,
numeric_state int,
evaluation VARCHAR(30), -- sure?
description VARCHAR(30), -- sure?
advisor_id int,
PRIMARY KEY(student_id,date),
FOREIGN KEY (student_id) REFERENCES Student(ID),
FOREIGN KEY (advisor_id) REFERENCES Admin(ID),
);
