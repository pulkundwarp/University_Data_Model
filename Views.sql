--View 1--
CREATE VIEW Requirements AS
SELECT DISTINCT course_name,
        type,
        dp_name
FROM dbo.Dim_Courses dc
JOIN dbo.Fact_AcademicPerformance fp
    ON fp.CourseKey = dc.CourseKey
JOIN dbo.Dim_DegreePrograms dp
    ON dp.DPKey = fp.DPKey
go

--View 2--
CREATE VIEW [Classes_in_a_semester] AS
SELECT DISTINCT course_name,
        course_section,
        ds.semester_name,
        ds.semester_year
FROM dbo.Dim_Courses dc
JOIN dbo.Fact_AcademicPerformance fp
    ON fp.CourseKey = dc.CourseKey
JOIN dbo.Dim_Semester ds
    ON ds.SemesterKey = fp.SemesterKey
go

--View 3--
CREATE VIEW [enrolment_and_drop_dates] AS
SELECT DISTINCT course_name,
        start_date,
        end_date,
        drop_date,
        semester_name
FROM dbo.Dim_semester ds
JOIN dbo.Fact_AcademicPerformance fp
    ON ds.SemesterKey = fp.SemesterKey
JOIN dbo.Dim_Courses dc
    ON fp.CourseKey = dc.CourseKey
go

--View 4--
CREATE VIEW [teacher_in_each_class] AS
SELECT DISTINCT course_name,
        faculty_name,
        semester_name,
        semester_year,
        start_date,
        end_date,
        drop_date
FROM dbo.Dim_semester ds
JOIN dbo.Fact_AcademicPerformance fp
    ON ds.SemesterKey = fp.SemesterKey
JOIN dbo.Dim_Courses dc
    ON fp.CourseKey = dc.CourseKey
JOIN dbo.Dim_Faculty df
    ON df.FacultyKey = fp.FacultyKey
go

--View 5--
CREATE VIEW [classes_taught_in_a_semester] AS
SELECT DISTINCT course_name,
        semester_name,
        semester_year
FROM dbo.Dim_semester ds
JOIN dbo.Fact_AcademicPerformance fp
    ON ds.SemesterKey = fp.SemesterKey
JOIN dbo.Dim_Courses dc
    ON fp.CourseKey = dc.CourseKey	
go

--View 6--
CREATE VIEW [classes_taught_in_a_semester_by_teachers] AS
SELECT DISTINCT faculty_name,
        semester_name,
        semester_year,
        dp_name
FROM dbo.Dim_semester ds
JOIN dbo.Fact_AcademicPerformance fp
    ON ds.SemesterKey = fp.SemesterKey
JOIN dbo.Dim_DegreePrograms dp
    ON fp.DPKey = dp.DPKey
JOIN dbo.Dim_Faculty df
    ON df.FacultyKey = fp.FacultyKey
go

--View 7--
CREATE VIEW [student_info] AS
SELECT DISTINCT NUID,
        student_name,
        email,
        city,
        state,
        country,
        resident_type,
        address,
        dp_name
FROM dbo.Dim_Students ds
JOIN dbo.Fact_AcademicPerformance fp
    ON fp.StudentKey = ds.StudentKey
JOIN dbo.Dim_DegreePrograms dp
    ON dp.DPKey = ds.DPKey
JOIN dbo.Dim_Geography dg
    ON ds.GeographyKey = dg.GeographyKey
go
