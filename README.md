# University_Data_Model

## Examine Northeastern Graduate Student Course enrollment and performance

### Facts & Measures:/n
  • Fact_Performance (Grades)/n
  • Fact_Enrollment (Total enrollment)/n

### Dimensions:/n
  • College (Slowly Changing Dimension)/n
  • Department (Shrunken Dimension)/n
  • Degree Program (Shrunken Dimension)/n
  • Courses (Slowly changing, Confirmed Dimension)/n
  • Semester (Rapid Changing, Confirmed Dimension)/n
  • Faculty (Slowly changing Dimension)/n
  • Students (Slowly changing Dimension)/n
  • Geography (Confirmed, Role-Playing Dimension)/n
  • Date (Static Dimension)/n

### Business Questions:/n
  -- Q.1 : What are the core requirements and elective courses for these programs/n
  -- Q.2 : What classes (course & section) did students complete in a semester & what were their grades/n
  -- Q.3 : What were the enrollment and drop dates if applicable for students in each class in a semester/n
  -- Q.4 : Who were the teachers in each class above/n
  -- Q.5 : What were the classes taught each semester/n
  -- Q.6 : What teachers taught classes in a degree program in a semester/n
  -- Q.7 : Who are the students enrolled in a degree program and attributes  such as ID, email, date of birth (DOB), hometown, campus/off-campus address if applicable, etc./n

### Important Grains of Business Process:/n
  course_name, course_type, course_section, semester_name. semester_year, enrollment_date, drop_date, student details, faculty details, degree program/n

### Fact Table Type:/n
  • Periodic/n

### Fact Table Granularity:/n
  • Monitoring performance of a student and department based on grades/n
  • Monitoring performance of a degree program based on total enrollment of the students/n

### Fact Attribute Types:/n
  • Grades: Non-additive/n
  • Total enrollment: Additive/n
