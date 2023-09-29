# University_Data_Model

## Examine Northeastern Graduate Student Course enrollment and performance

### Facts & Measures:
  - Fact_Performance (Grades)
  - Fact_Enrollment (Total enrollment)

### Dimensions:
  - College (Slowly Changing Dimension)
  - Department (Shrunken Dimension)
  - Degree Program (Shrunken Dimension)
  - Courses (Slowly changing, Confirmed Dimension)
  - Semester (Rapid Changing, Confirmed Dimension)
  - Faculty (Slowly changing Dimension)/n
  - Students (Slowly changing Dimension
  - Geography (Confirmed, Role-Playing Dimension)
  - Date (Static Dimension)

### Business Questions:
  - Q.1 : What are the core requirements and elective courses for these programs
  - Q.2 : What classes (course & section) did students complete in a semester & what were their grades
  - Q.3 : What were the enrollment and drop dates if applicable for students in each class in a semester
  - Q.4 : Who were the teachers in each class above
  - Q.5 : What were the classes taught each semester
  - Q.6 : What teachers taught classes in a degree program in a semester
  - Q.7 : Who are the students enrolled in a degree program and attributes  such as ID, email, date of birth (DOB), hometown, campus/off-campus address if applicable, etc.

### Important Grains of Business Process:
  course_name, course_type, course_section, semester_name. semester_year, enrollment_date, drop_date, student details, faculty details, degree program

### Fact Table Type:
  - Periodic

### Fact Table Granularity:/n
  - Monitoring performance of a student and department based on grades
  - Monitoring performance of a degree program based on total enrollment of the students

### Fact Attribute Types:
  - Grades: Non-additive
  - Total enrollment: Additive
