CREATE PROC AddFacultyRepToII
@job_id int, @admin_id int, @facultyRep_id int
AS
ALTER TABLE Job
ADD facultyRepresentative int = @facultyRep_id
WHERE (SELECT department FROM Job WHERE ID = @job_id) = (SELECT faculty FROM Faculty_Representative WHERE ID = @facultyRep_id)

go;

CREATE PROC AdminReviewJob
@admin_id int, @job_id int, @visibility bit, @reason varchar(100)
AS
IF((SELECT status from Review_Profile WHERE admin_id = @admin_id)='accepted')
BEGIN
SET @visibility = 1
END
ELSE
BEGIN 
SET @visibility = 0
END

GO;

CREATE PROC EmpEditProfile
@id int, @password varchar(8), @adress varchar(10), @company_name varchar(20), @company_phone varchar(20),@fax varchar(50), @company_website varchar(50) @type_of_business
varchar(30), @establishment_year datetime, @origin_country varchar(20), @industry varchar(20),
@n_current_employees int, @products_services varchar(30)
AS 
GRANT UPDATE ON User TO Employer
GRANT UPDATE ON Employer TO Employer

go;

CREATE PROC AddContact
@emp_id int, @name varchar(20), @job_title varchar(30), @email varchar(50), @mobile_number varchar(20), @fax varchar(50)
AS 
GRANT INSERT ON Contact_person TO Employer

go;

CREATE PROC AddHR
@emp_id int, @name varchar(20), @email varchar(50)
AS
GRANT INSERT ON HR_Director TO Employer

go;

CREATE PROC ViewProfileStatus
@emp_id int
AS
SELECT @status FROM Review_Profile AND @reason FROM Review_Profile
WHERE @emp_id= employer_id FROM Review_Profile

go;

CREATE PROC PostJob
@emp_id int, @title varchar(30), @description varchar(50), @department varchar(20), @start_date
datetime, @end_date datetime, @application_deadline datetime, @n_available_internships int,
@salary_range varchar(20), @qualifications varchar(100), @location varchar(20), @application_link
varchar(50), @application_email varchar(50), @job_type varchar(30), @workdays int
AS
IF((SELECT status FROM Review_Profile WHERE employer_id = @emp_id) = 'accepted' )
BEGIN
GRANT INSERT ON Job To Employee
END

go;


CREATE PROC AddFaculty
@job_id int,@allowed_faculty varchar(20)
AS 
GRANT UPDATE ON Allowed_faculties TO Employer

go;

CREATE PROC AddSemester
@job_id int,@semester int
AS
GRANT UPDATE ON Required_semesters TO Employer

go;

CREATE PROC EmpViewJobs
@emp_id int
AS
SELECT *
FROM Job
ORDER BY start_date ASC
GO;

CREATE PROC EmpViewApplicants
@emp_id int, @job_id int
AS
SELECT *
FROM Student
WHERE @emp_id = @job_id

go;

CREATE PROC EmpUpdateApplicant
@student_id int, @job_id int, @application_status varchar(20)
AS 
IF (title = 'industrial intership')
BEGIN
	IF ((SELECT department FROM Job WHERE ID = @job_id) <> (SELECT faculty_name FROM Allowed_faculties WHERE ID = @job_id))
	BEGIN 
		@application_status = 'rejected'
	END
	
END
ELSE
BEGIN
UPDATE Review_Profile
SET status = @application_status
END

go;
