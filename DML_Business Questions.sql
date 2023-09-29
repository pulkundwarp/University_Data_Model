-- Q.1 : What are the core requirements and elective courses for these programs--
SELECT DISTINCT dp_name,
        course_name,
        type
FROM dbo.Dim_Courses dc
JOIN dbo.Fact_AcademicPerformance fp
    ON fp.CourseKey = dc.CourseKey
JOIN dbo.Dim_DegreePrograms dp
    ON dp.DPKey = fp.DPKey


-- Q.2 : What classes (course & section) did students complete in a semester & what were their grades--
SELECT DISTINCT student_name,
        course_name,
        course_section,
        ds.semester_name,
        ds.semester_year,
        Grades
FROM dbo.Dim_Courses dc
JOIN dbo.Fact_AcademicPerformance fp
    ON fp.CourseKey = dc.CourseKey
JOIN dbo.Dim_Semester ds
    ON ds.SemesterKey = fp.SemesterKey
JOIN dbo.Dim_Students dt
    ON dt.StudentKey = fp.StudentKey
ORDER BY ds.semester_year


-- Q.3 : What were the enrollment and drop dates if applicable for students in each class in a semester--
SELECT DISTINCT course_name,
        start_date,
        end_date,
        drop_date,
        semester_name,
        semester_year
FROM dbo.Dim_semester ds
JOIN dbo.Fact_AcademicPerformance fp
    ON ds.SemesterKey = fp.SemesterKey
JOIN dbo.Dim_Courses dc
    ON fp.CourseKey = dc.CourseKey

-- Q.4 : Who were the teachers in each class above--
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

-- Q.5 : What were the classes taught each semester--
SELECT DISTINCT course_name,
        semester_name,
        semester_year
FROM dbo.Dim_semester ds
JOIN dbo.Fact_AcademicPerformance fp
    ON ds.SemesterKey = fp.SemesterKey
JOIN dbo.Dim_Courses dc
    ON fp.CourseKey = dc.CourseKey	
ORDER BY semester_year

-- Q.6 : What teachers taught classes in a degree program in a semester--
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
ORDER BY dp_name

-- Q.7 : Who are the students enrolled in a degree program and attributes  such as ID, email, date of birth (DOB), hometown, campus/off-campus address if applicable, etc. --
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
ORDER BY dp_name