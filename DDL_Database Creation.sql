--Geography--
CREATE TABLE Dim_Geography(
    GeographyKey    bigint          NOT NULL,
    address         varchar(100)    NULL,
    city            varchar(50)     NULL,
    state           varchar(50)     NULL,
    country         varchar(50)     NULL,
    zipcode         bigint          NULL,
    CONSTRAINT PK2 PRIMARY KEY CLUSTERED (GeographyKey)
)

--College--
CREATE TABLE Dim_College(
    CollegeKey      bigint         NOT NULL,
    college_name    varchar(20)    NULL,
    GeographyKey    bigint         NULL,
    CONSTRAINT PK1 PRIMARY KEY CLUSTERED (CollegeKey), 
    CONSTRAINT RefDim_Geography37 FOREIGN KEY (GeographyKey)
    REFERENCES Dim_Geography(GeographyKey)
)

--Department--
CREATE TABLE Dim_Department(
    DepartmentKey      bigint         NOT NULL,
    department_name    varchar(50)    NULL,
    CollegeKey         bigint         NULL,
    CONSTRAINT PK3 PRIMARY KEY CLUSTERED (DepartmentKey), 
    CONSTRAINT RefDim_College41 FOREIGN KEY (CollegeKey)
    REFERENCES Dim_College(CollegeKey)
)

--DegreePrograms--
CREATE TABLE Dim_DegreePrograms(
    DPKey            bigint         NOT NULL,
    dp_name          varchar(50)    NULL,
    DepartmentKey    bigint         NULL,
    CONSTRAINT PK4 PRIMARY KEY CLUSTERED (DPKey), 
    CONSTRAINT RefDim_Department40 FOREIGN KEY (DepartmentKey)
    REFERENCES Dim_Department(DepartmentKey)
)

--Faculty--
CREATE TABLE Dim_Faculty(
    FacultyKey      bigint         NOT NULL,
    faculty_name    varchar(50)    NULL,
    CONSTRAINT PK8 PRIMARY KEY CLUSTERED (FacultyKey)
)

--Students--
CREATE TABLE Dim_Students(
    StudentKey       bigint         NOT NULL,
    NUID             bigint         NULL,
    student_name     varchar(50)    NULL,
    email            varchar(50)    NULL,
    contact          bigint         NULL,
    resident_type    varchar(50)    NULL,
    start_date       date           NULL,
    end_date         date           NULL,
    GeographyKey     bigint         NULL,
    CONSTRAINT PK9 PRIMARY KEY CLUSTERED (StudentKey), 
    CONSTRAINT RefDim_Geography38 FOREIGN KEY (GeographyKey)
    REFERENCES Dim_Geography(GeographyKey)
)

--Semester--
CREATE TABLE Dim_semester(
    SemesterKey        bigint         NOT NULL,
    start_date         date           NULL,
    drop_date          date           NULL,
    end_date           date           NULL,
    semester_name      varchar(50)    NULL,
    semester_year      tinyint        NULL,
    enrollment_date    datetime       NULL,
    CONSTRAINT PK5 PRIMARY KEY CLUSTERED (SemesterKey)
)

--Courses--
CREATE TABLE Dim_Courses(
    CourseKey         bigint         NOT NULL,
    total_credits     bigint         NULL,
    fee_per_credit    bigint         NULL,
    course_name       varchar(50)    NULL,
    course_section    tinyint        NULL,
    total_seats       bigint         NULL,
    type              varchar(50)    NULL,
    CONSTRAINT PK7 PRIMARY KEY CLUSTERED (CourseKey)
)

--date--
CREATE TABLE [dbo].[Dim_Date] (
   [DateKey] [int] NOT NULL,
   [Date] [date] NOT NULL,
   [Day] [tinyint] NOT NULL,
   [DayOfYear] [smallint] NOT NULL,
   [Month] [tinyint] NOT NULL,
   [MonthName] [varchar](10) NOT NULL,
   [Year] [int] NOT NULL,
   [MMYYYY] [char](6) NOT NULL,
   [MonthYear] [char](7) NOT NULL,
   PRIMARY KEY CLUSTERED ([DateKey] ASC)
)