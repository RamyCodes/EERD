CREATE PROC courseInformation
@facRep_id int, @job_id int, @ii_status bit OUTPUT
AS
BEGIN
SELECT fr.ID
FROM Faculty_Representative fr
JOIN Industrial_Internship II ON II.ID = fr.ID
WHERE fr.ID = @facRep_id
 if @@rowcount = 0 SET @ii_status = 0
 else
 SET @ii_status = 1
 return @ii_status
 END


CREATE PROC StudentEditProfile
@sid int, @email varchar(50),@first_name varchar(20),@middle_name varchar(20), @last_name
varchar(20), @birth_date datetime,@GIU_id int,@semester int, @faculty varchar(20),@major varchar(20),@gpa decimal(4,2),@adress varchar(10)
AS
BEGIN
UPDATE Student
SET ID = @sid, first_name = @first_name, middle_name = @middle_name, last_name = @last_name,
birth_date = @birth_date, GIU_ID = @GIU_id, semester = @semester, faculty = @faculty, major = @major, GPA = @gpa, address_ = @adress
FROM Student
WHERE ID = @sid

UPDATE User_
SET email = @email
WHERE ID = @sid
END


CREATE PROC AddMobile
@sid int, @mobileNumber varchar(20)
AS
BEGIN
INSERT INTO Student_phoneNumber(number)
VALUES (@mobileNumber);
END


CREATE PROC CreateCV
@s_id int, @personal_mail varchar(50), @education varchar(100), @extracurricular_activities
varchar(300), @linkedIn_link varchar(30), @github_link varchar(30), @skills varchar(300),
@achievements varchar(300)
AS
BEGIN
INSERT INTO CV_Builder(personal_mail, education, extracurricular_activities, linkedIn_link, githubLink,
skills, achievements)
VALUES(@personal_mail, @education, @extracurricular_activities, @linkedIn_link, @github_link, @skills, @achievements)

SELECT first_name, middle_name, last_name, GPA, semester, faculty, major, ID
FROM Student
WHERE Student.ID = @s_id

UNION

SELECT personal_mail, education, extracurricular_activities, linkedIn_link, githubLink,
skills, achievements, student_id
FROM CV_Builder
WHERE CV_Builder.student_id = @s_id
END


CREATE PROC ApplyForJob
 @sid int, @job_id int
 AS
 BEGIN
 Update Apply
 SET application_status = DEFAULT --'pending' should be set to default
 WHERE student_ID = @sid AND job_ID = @job_id
 END


CREATE PROC ViewMyStatus
@sid int, @job_id int,
@application_status varchar(20) OUTPUT
AS
BEGIN
SET @application_status = (
SELECT application_status
FROM Apply
WHERE student_ID = @sid AND job_ID = @job_id
)
RETURN @application_status
END


CREATE PROC AddProgressReport
@sid int, @date datetime, @description varchar (100)
AS
BEGIN
INSERT INTO Progress_report(student_id, date_, description_)
VALUES(@sid, @date, @description)
END


CREATE PROC ViewMyReports
@sid int, @nOfReports int output, @date datetime output,
@description varchar(100) output, @numeric_state int output, @evaluation varchar(100) output
AS
BEGIN
SET @nOfReports = (SELECT COUNT(*) FROM Progress_report WHERE Progress_report.student_id = @sid)
SELECT @date = p.date_, @description = p.description_,
@numeric_state = p.numeric_state, @evaluation = p.evaluation
FROM Progress_report AS p
WHERE p.student_id = @sid
IF(@evaluation = null)
BEGIN
SET @evaluation = 'not evaluated yet'
SET @numeric_state = -1
END
END


CREATE PROC ViewAdvisors
AS
BEGIN
SELECT *
FROM Academic_Advisor
END


CREATE PROC CocViewStudents
@ii_id int
AS
BEGIN
SELECT Student.ID, Student.first_name
FROM Industrial_Internship AS II
INNER JOIN
Job AS J ON II.ID = J.ID
INNER JOIN
Apply AS A ON J.ID = A.job_ID
WHERE II.ID = @ii_id
END


CREATE PROC CocViewStudents
@ii_id int
AS
BEGIN
SELECT Apply_.student_ID
FROM Apply_
LEFT JOIN
Industrial_Internship ON Apply_.job_ID = Industrial_Internship.ID
WHERE Industrial_Internship.ID = @ii_id
END


CREATE PROC CocUpdateEligibility
 @coc_id int, @s_id int, @ii_id int, @eligibility bit
 AS
 BEGIN
 UPDATE Eligible
 SET eligibility = @eligibility
 WHERE coc_id = @coc_id AND student_id = @s_id AND II_id = @ii_id
 END


CREATE PROC AAToII
@aa_id int, @ii_id int
AS
BEGIN
DECLARE @temp VARCHAR(30)
SET @temp = 
(SELECT status_ FROM Industrial_Internship
WHERE Industrial_Internship.ID = @ii_id
)
IF(@temp = 'accepted')
BEGIN
UPDATE Industrial_Internship
SET aa_id = @aa_id
WHERE Industrial_Internship.ID = @ii_id
END
END


CREATE PROC EvalProgressReport
@sid int, @date datetime, @numeric_state int, @evaluation varchar(100)
AS
BEGIN
UPDATE Progress_report SET numeric_state = @numeric_state
FROM Progress_report AS p
WHERE p.student_id = @sid AND p.date_ = @date AND p.evaluation = @evaluation
END


CREATE PROC ViewProgressReports
@advisor_id int
AS
BEGIN
SELECT *
FROM Progress_report
WHERE Progress_report.advisor_id = @advisor_id
ORDER BY Progress_report.date_ DESC
END
