CREATE PROC JobSearch
@semester int, 
@allowed_faculty varchar(20)
AS
SELECT *
FROM Job
INNER JOIN Required_semesters ON Job.ID = Required_semesters.ID
INNER JOIN Allowed_faculties ON Allowed_faculties.ID = Job.ID
WHERE (Required_semesters.semester = @semester OR Allowed_faculties.faculty_name = @allowed_faculty) AND Job.visibility = '1'

GO 

DROP PROC GenerateRandomPassWord

GO 

CREATE PROC GenerateRandomPassWord
@OUTMESSAGE VARCHAR(8) OUTPUT
AS   
BEGIN  
SET NOCOUNT ON  
declare @LENGTH INT,@CharPool varchar(26),@PoolLength varchar(26),@LoopCount  INT  
DECLARE @RandomString VARCHAR(8),@CHARPOOLINT VARCHAR(9)  
  
SET @CharPool = 'A!B@^!D#E@FG#H$IJ$K%LM%N*PQR%ST&U*V(W)X_YZ'  
DECLARE @TMPSTR VARCHAR(3)  

SET @PoolLength = DataLength(@CharPool)  
SET @LoopCount = 0  
SET @RandomString = ''  
  
    WHILE (@LoopCount <8)  
    BEGIN  
        SET @TMPSTR =   SUBSTRING(@Charpool, CONVERT(int, RAND() * @PoolLength), 1)           
        SELECT @RandomString  = @RandomString + CONVERT(VARCHAR(5), CONVERT(INT, RAND() * 10))  
        IF(DATALENGTH(@TMPSTR) > 0)  
        BEGIN   
            SELECT @RandomString = @RandomString + @TMPSTR    
            SELECT @LoopCount = @LoopCount + 1  
        END  
    END  
    SET @LOOPCOUNT = 0    
    SET @OUTMESSAGE=@RandomString  
END

GO

DECLARE @password VARCHAR(8)
EXECUTE GenerateRandomPassWord @password OUTPUT
--PRINT @password

INSERT INTO User_ VALUES ('Saad', 'elBasha' , 'Ahmed', 'jojopart4@gmail.com', 'returnToMonke')
INSERT INTO User_(first_name) VALUES ('Remi')

DECLARE @id INT
select @id = SCOPE_IDENTITY();  
PRINT @id

INSERT INTO User_(first_name) VALUES ('Mohamed')

select @id = SCOPE_IDENTITY();  
PRINT @id

DROP PROC UserRegister

CREATE PROC UserRegister
@usertype varchar(20),
@email varchar(50),
@first_name varchar(20),
@middle_name varchar(20),
@last_name varchar(20),
@birth_date datetime = NULL,
@GIU_id int  = NULL,
@semester int  = NULL,
@faculty varchar(20) = NULL,
@major varchar(20) = NULL,
@gpa decimal(4,2) = NULL,
@adress varchar(10) = NULL, 
@company_name varchar(20) = NULL, 
@company_phone varchar(20) = NULL,
@fax varchar(50) = NULL, 
@company_website varchar(50) = NULL,
@type_of_business varchar(30) = NULL,
@establishment_year datetime = NULL, 
@origin_country varchar(20) = NULL, 
@industry varchar(20) = NULL, 
@n_current_employees int = NULL,
@products_services varchar(30) = NULL,

@user_id int OUTPUT,
@password varchar(8) OUTPUT 
AS
EXEC GenerateRandomPassWord @OUTMESSAGE = @password OUTPUT
INSERT INTO User_ VALUES (@first_name, @middle_name,@last_name,@email,@password)
SELECT @user_id = SCOPE_IDENTITY();
IF @usertype = 'Student' 
INSERT INTO Student(ID,GIU_ID,first_name,middle_name,last_name,birth_date,semester,faculty,major,GPA,address_) VALUES (@user_id, @GIU_id, @first_name, @middle_name, @last_name, @birth_date, @semester, @faculty, @major, @gpa, @adress)
ELSE IF @usertype = 'Employer' 
INSERT INTO Employer(ID, company_name, address_, fax, type_of_business, establishment_year, industry,number_of_current_employees, products) VALUES (@user_id, @company_name,@adress,@fax,@type_of_business,@establishment_year,@industry,@n_current_employees,@products_services)
ELSE IF @usertype = 'Admin'
INSERT INTO Admin_ VALUES (@user_id)
ELSE IF @usertype = 'Career off coor'
INSERT INTO Career_Office_Coordinator VALUES (@user_id)
ELSE IF @usertype = 'Faculty rep'
INSERT INTO Faculty_representative (ID) VALUES (@user_id)


DECLARE @id INT 
DECLARE @pass VARCHAR(8)

EXECUTE UserRegister 'Faculty rep', 'ters.ghoneim@hotmail.com', 'mohamed', 'Ghoneim', 'Sherif', @user_id = @id OUTPUT, @password = @pass OUTPUT
PRINT @id
PRINT @pass

Create proc UserLogin
@email varchar (50),
@password varchar(20),
@succes bit OUTPUT,
@user_id int OUTPUT as if exists 
(
select User_id from User_ where User_.password_=@password and User_.email=@email
)
begin 
print @success;
print @user_id;
set @success=1;
select @user_id= User_.id from User_ 
where  User_.email=@email and User_.password_=@password
ELSE 
begin 
print @success ;
print @user_id ;
SET @success = 0 ;
SET @user_id=-1;

END
go;




CREATE PROC ViewProfile
@user_id int
AS
if exists
(
SELECT * FROM User_ a 
			INNER JOIN Student b ON a.id=@user_id AND b.student_id= @user_id
 )
	begin
	SELECT * FROM User_ a 
			INNER JOIN Student b ON b.id=@user_id AND b.student_id = @user_id 
	end

go ;




CREATE PROC DeleteProfile
@user_id int
AS
DELETE FROM User_ WHERE User_.id= @user_id ;

go;


CREATE PROC AdminViewEmps
AS
SELECT * from Employer

go;




CREATE PROC AdminReviewEmp
@admin_id int, @emp_id int, @reason varchar(200), @profile_status bit
AS UPDATE Review_Profile SET reason = @reason,status_ = @profile_status
	
WHERE admin_id = @admin_id  AND employer_id = @emp_id

go;





CREATE PROC AdminViewJobs
AS
SELECT *
FROM Job

go;




CREATE PROC AdminViewFRs
AS
SELECT * FROM Faculty_Representative
GROUP BY faculty

go;
