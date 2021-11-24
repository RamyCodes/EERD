Users (ID, username, password, email,
Student (student_ID, first_name, middle_name, last_name, GIU_email, birth_date, age, semester, faculty, major, GPA, address, age)
WHERE age IS (currentDate – birthDate)
studentPhones (sID, sPhone)
studentPhones.sID references Student.student_ID
Employer (work_ID, company_name, address, phone_number, fax_number, email, website, type_of_business, aID(dotted underline))
Employer.aID references Admin.aID
Admin (aID)
Admin.aID references Users.ID
FacultyRepresentative (fac_ID, name, fac_email, faculty)
CareerOfficeCoordinator (cooID)
CareerOfficeCoordinator.cooID references Users.ID
AcademicAdvisor (GIU_ID, name, faculty, work_email, cooID(dotted underline))
AcademicAdvisor.cooID references CareerOfficeCoordinator.cooID
Job (jID, title, pending, short_listed, rejected, hired, salary_range, qualifications, duration, description, num_of_available_internships, in_office, hybrid, remote, application_deadline, start_date, end_date, department, fac_ID (dotted underline), student_ID (dotted underline))
Job.fac_ID references FacultyRepresentative.fac_ID
Job.student_ID references Student.student_ID
Job.jID references Students.student_ID
requiredSemesters (semsTitle, semNum)
requiredSemesters.semsTitle references Job.title
allowedFaculties (facTitle, allFac)
requiredSemesters.semsTitle references Job.title
CVBuilder (cvID, personal_mail, education, extracurricular_activities, skills, technical, language, achievement_honors, LinkedIn, Github, Behance, student_ID(dotted underline))
CVBuilder.student_ID references Student.student_ID
CVBuilder.cvID references Students.Student_ID
ProgressReport (prID, date, state, description, evaluation, student_id(dotted underline), GIU ID(dotted underline))
ProgressReport.GIU ID references AcademicAdvisor.GIU ID
ProgressReport.prID references Students.Student_ID
ContactPerson (workID, name, job_title, email, fax)
Company (name, country_of_origin, establishment_year, nOfEmployees, multinational, national, public, industry, products/services, website, HR_cID(Dotted Line))
Company.HR_cID references HR Director.company_ID
HR_Director (company_ID, name)
Summer_Internship (sITitle)
Project_Based (pbTitle)
Freelance (flTitle)
Full_time (ftTitle)
Part_time (ptTitle, work_days)
Industrial_internship (IITitle)
Employer-CPerson-Company(work_ID (dotted underline), CP_name (dotted underline), C_name (dotted underline))
Employer-CPerson-Company.C_name refrences Company.name
Employer-CPerson-Company.CP_name references Contact_Person.name
Employer-CPerson-Company.Work_ID references Employer.work_ID
